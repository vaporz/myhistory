
package com.zx.myhistory.service;

import com.zx.myhistory.biz.NewsBiz;
import com.zx.myhistory.model.BizException;
import com.zx.myhistory.model.ErrorCode;
import com.zx.myhistory.model.Keyword;
import com.zx.myhistory.model.Message;
import com.zx.myhistory.model.News;
import com.zx.myhistory.model.User;
import com.zx.myhistory.model.UserKeyword;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

@Service
public class NewsService {
    @Autowired
    private NewsBiz newsBiz;

    public void commitNews(String title, String content, String url, long newsTime, String newsTimeDesc, Set<String> keywordStrSet) {
        url = StringUtils.defaultString(url);
        long newsId = newsBiz.commitNews(title, content, url, newsTime, newsTimeDesc);
        attachKeywordsForNews(newsId, newsTime, newsTimeDesc, keywordStrSet);
    }

    public List<Keyword> getKeywords() {
        return newsBiz.getKeywords();
    }

    public List<News> getNewsByKeyword(long keywordId, long newsTime, int limit) {
        newsTime = newsTime <= 0 ? Long.MAX_VALUE : newsTime;
        return newsBiz.getNewsByKeyword(keywordId, newsTime, limit);
    }

    public News getOneNewsById(long newsId) {
        return newsBiz.getOneNewsById(newsId);
    }

    public Keyword getKeywordById(long keywordId) {
        return newsBiz.getKeywordById(keywordId);
    }

    /**
     * 如果aliasId大于0，会一直找到最后一个aliasId不大于0的keyword
     */
    public Keyword getTrueKeywordById(long keywordId) {
        Keyword keyword = newsBiz.getKeywordById(keywordId);
        while (keyword != null && keyword.getAliasId() > 0) {
            keyword = newsBiz.getKeywordById(keyword.getAliasId());
        }
        return keyword;
    }

    public List<Keyword> getKeywordsByNewsId(long newsId) {
        return newsBiz.getKeywordsByNewsId(newsId);
    }

    public void attachKeywordsForNews(long newsId, Set<String> keywordStrSet) {
        News news = newsBiz.getOneNewsById(newsId);
        attachKeywordsForNews(newsId, news.getNewsTime(), news.getNewsTimeDesc(), keywordStrSet);
    }

    private void attachKeywordsForNews(long newsId, long newsTime, String newsTimeDesc, Set<String> keywordStrSet) {
        Set<Keyword> keywordSet = getKeywords(keywordStrSet, true);
        Map<String, Keyword> trueMap = new HashMap<String, Keyword>();
        if (keywordSet != null) {
            for (Keyword keyword : keywordSet) {
                Keyword trueKeyword = keyword;
                if (keyword.getAliasId() > 0) {
                    trueKeyword = getTrueKeywordById(keyword.getKeywordId());
                }
                if (trueMap.get(trueKeyword.getKeyword()) == null) {
                    trueMap.put(trueKeyword.getKeyword(), trueKeyword);
                }
            }
        }
        Set<Keyword> trueKeywordSet = new HashSet<Keyword>();
        CollectionUtils.addAll(trueKeywordSet, trueMap.values().iterator());
        // TODO 有并发的问题，如果有关键字在执行过程中被alias？
        newsBiz.commitKeywordNews(newsId, newsTime, newsTimeDesc, trueKeywordSet);
        newsBiz.commitNewsKeyword(newsId, trueKeywordSet);
        // 通知关键字更新
        notifyFollowers(trueKeywordSet);
    }

    private void notifyFollowers(Set<Keyword> trueKeywordSet) {
        // TODO 优化，使用redis
        Map<Long, List<Long>> updateMap = new HashMap<Long, List<Long>>();
        for (Keyword keyword : trueKeywordSet) {
            List<Long> userIds = newsBiz.getKeywordFollowers(keyword.getKeywordId());
            for (Long userId : userIds) {
                List<Long> keywordIds = updateMap.get(userId);
                if (keywordIds == null) {
                    keywordIds = new ArrayList<Long>();
                    updateMap.put(userId, keywordIds);
                }
                keywordIds.add(keyword.getKeywordId());
            }
        }
        for (Entry<Long, List<Long>> entry : updateMap.entrySet()) {
            newsBiz.updateUserKeywordNotRead(entry.getKey(), entry.getValue(), 1);
        }
    }

    private Set<Keyword> getKeywords(Set<String> keywordStrSet, boolean createWhenUnxist) {
        Set<String> keywordLowercase = new HashSet<String>();
        for (String keyword : keywordStrSet) {
            keywordLowercase.add(keyword.toLowerCase());
        }
        Map<String, Keyword> keywords = newsBiz.findKeywordsReturnMap(keywordLowercase);
        if (createWhenUnxist) {
            for (String keyword : keywordStrSet) {
                if (keywords.get(keyword) == null) {
                    // 新keyword，添加进去
                    long keywordId = newsBiz.createKeyword(keyword);
                    keywords.put(keyword, new Keyword(keywordId, keyword));
                }
            }
        }
        Set<Keyword> keywordSet = new HashSet<Keyword>();
        CollectionUtils.addAll(keywordSet, keywords.values().iterator());
        return keywordSet;
    }

    public void mergeKerword(String keyword, String target) {
        Keyword keywordObj = newsBiz.getKeywordByName(keyword.toLowerCase());
        Keyword targetObj = newsBiz.getKeywordByName(target.toLowerCase());
        if (keywordObj == null || targetObj == null) {
            return;
        }
        List<News> news = newsBiz.getNewsIdByKeyword(keywordObj.getKeywordId(), Long.MAX_VALUE, Integer.MAX_VALUE);
        List<News> targetNews = newsBiz.getNewsIdByKeyword(targetObj.getKeywordId(), Long.MAX_VALUE, Integer.MAX_VALUE);
        Set<Long> targetNewsId = new HashSet<Long>();
        for (News item : targetNews) {
            targetNewsId.add(item.getNewsId());
        }
        List<News> newsTobeDeleted = new ArrayList<News>();
        List<News> newsTobeUpdated = new ArrayList<News>();// 有可能会并发又产生一个news不在这个列表中
        for (News item : news) {
            if (targetNewsId.contains(item.getNewsId())) {
                newsTobeDeleted.add(item);
            } else {
                newsTobeUpdated.add(item);
            }
        }
        for (News item : newsTobeDeleted) {
            newsBiz.deleteNewsFromNewsKeyword(item.getNewsId(), keywordObj.getKeywordId());
        }
        for (News item : newsTobeUpdated) {
            newsBiz.updateKeywordForNewsKeyword(item.getNewsId(), keywordObj.getKeywordId(), targetObj.getKeywordId(),
                targetObj.getKeyword(), targetObj.getKeywordLowercase());
            newsBiz.insertKeywordNews(targetObj.getKeywordId(), item.getNewsId(), item.getNewsTime(), item.getNewsTimeDesc());
        }
        // TODO 将关注了老keyword的用户转移到新keyword上，批量修改数据库
        newsBiz.deleteNewsByKeywordId(keywordObj.getKeywordId());
        newsBiz.aliasKeyword(keywordObj.getKeywordId(), targetObj.getKeywordId());
        newsBiz.redirectAlias(keywordObj.getKeywordId(), targetObj.getKeywordId());
    }

    public void voteKeywordHot(long keywordId) {
        newsBiz.voteKeywordHot(keywordId, 1);
    }

    public void updateNewsTruth(long newsId, int delta) {
        newsBiz.updateNewsTruth(newsId, delta);
    }

    public void updateNewsFake(long newsId, int delta) {
        newsBiz.updateNewsFake(newsId, delta);
    }

    public Long registerUser(String pwd, String name, String email, String locale) throws BizException {
        long userId = newsBiz.getUserIdByName(name);
        if (userId > 0) {
            throw new BizException(ErrorCode.DuplicatedName, "用户名已被占用");
        }
        return newsBiz.registerUser(pwd, name, "", email, locale);
    }

    public long getUserIdByNameAndPwd(String userName, String pwd) {
        return newsBiz.getUserIdByNameAndPwd(userName, pwd);
    }

    public User getUserById(long userId) {
        return newsBiz.getUserById(userId);
    }

    /**
     * 返回boolean，表示是否是新关注者，如果是，则要加一
     */
    public boolean followKeyword(long userId, long keywordId) {
        Keyword keyword = getKeywordById(keywordId);
        int rowAffected = newsBiz.insertKeywordUser(keywordId, userId);
        newsBiz.insertUserKeyword(userId, keywordId, keyword.getKeyword());
        return rowAffected > 0;
    }

    public boolean isFollower(long userId, long keywordId) {
        long returnId = newsBiz.getKeywordFollower(keywordId, userId);
        return returnId > 0;
    }

    public void unfollowKeyword(long userId, long keywordId) {
        newsBiz.deleteUserKeyword(userId, keywordId);
    }

    public List<UserKeyword> getUserKeywords(long userId) {
        return newsBiz.getUserKeywords(userId);
    }

    public void clearUserKeyword(long userId, long keywordId) {
        newsBiz.clearUserKeyword(userId, keywordId);
    }

    public void insertMsg(long userId, String userName, String content) {
        newsBiz.insertMsg(userId, userName, content, System.currentTimeMillis());
    }

    public List<Message> getMessages(long msgId, int limit) {
        return newsBiz.getMessages(msgId, limit);
    }

    public void updateNewsContent(long newsId, String title, String content, String url, long newsTime, String newsTimeDesc) {
        newsBiz.updateNewsContent(newsId, title, content, url, newsTime, newsTimeDesc);
    }

    public void deleteKeywordFromNews(long newsId, long keywordId){
        newsBiz.deleteNewsFromNewsKeyword(newsId, keywordId);
    }

    public void deleteNewsFromKeyword(long newsId, long keywordId) {
        newsBiz.deleteKeywordFromKeywordNews(keywordId, newsId);
    }
}
