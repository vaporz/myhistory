
package com.zx.myhistory.biz;

import com.zx.myhistory.dao.NewsDAO;
import com.zx.myhistory.dao.UserDAO;
import com.zx.myhistory.model.Keyword;
import com.zx.myhistory.model.Message;
import com.zx.myhistory.model.News;
import com.zx.myhistory.model.User;
import com.zx.myhistory.model.UserKeyword;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Service
public class NewsBiz {
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private NewsDAO newsDAO;

    public long commitNews(String title, String content, String url, long newsTime, String newsTimeDesc) {
        long id = newsDAO.getAndIncrId();
        newsDAO.commitNews(id, title, content, url, newsTime, newsTimeDesc, System.currentTimeMillis());
        return id;
    }

    public void commitNewsKeyword(long newsId, Set<Keyword> keywords) {
        for (Keyword keyword : keywords) {
            newsDAO.insertNewsKeyword(newsId, keyword.getKeywordId(), keyword.getKeyword(), keyword.getKeywordLowercase(),
                System.currentTimeMillis());
        }
    }

    public void commitKeywordNews(long newsId, long newsTime, String newsTimeDesc, Set<Keyword> keywords) {
        for (Keyword keyword : keywords) {
            newsDAO.insertKeywordNews(keyword.getKeywordId(), newsId, newsTime, newsTimeDesc);
        }
    }

    public void insertKeywordNews(long keywordId, long newsId, long newsTime, String newsTimeDesc) {
        newsDAO.insertKeywordNews(keywordId, newsId, newsTime, newsTimeDesc);
    }

    public long createKeyword(String keyword) {
        long id = newsDAO.getAndIncrId();
        newsDAO.insertKeyword(id, keyword, keyword.toLowerCase(), "", System.currentTimeMillis());
        return id;
    }

    public List<Keyword> getKeywords() {
        return newsDAO.getKeywords();
    }

    public List<News> getNewsByKeyword(long keywordId, long newsTime, int limit) {
        List<News> newsIds = newsDAO.getNewsIdByKeyword(keywordId, newsTime, limit);
        Set<Long> ids = new HashSet<Long>();
        for (News news : newsIds) {
            ids.add(news.getNewsId());
        }
        return newsDAO.getNewsByIds(ids);// TODO use redis to cache News object,
                                         // map: newsId, key, value
    }

    public News getOneNewsById(long newsId) {
        return newsDAO.getOneNewsById(newsId);
    }

    public List<Keyword> findKeywords(Set<String> keywordsLowercase) {
        return newsDAO.getKeywordByName(keywordsLowercase);
    }

    public Keyword getKeywordById(long keywordId) {
        return newsDAO.getKeywordById(keywordId);
    }

    public Map<String, Keyword> findKeywordsReturnMap(Set<String> keywordsLowercase) {
        List<Keyword> list = newsDAO.getKeywordByName(keywordsLowercase);// TODO 当存在海量关键字时，怎么办
        Map<String, Keyword> map = new HashMap<String, Keyword>();
        for (Keyword keyword : list) {
            map.put(keyword.getKeyword(), keyword);
        }
        return map;
    }

    public List<Keyword> getKeywordsByNewsId(long newsId) {
        return newsDAO.getKeywordsByNewsId(newsId);
    }

    public Keyword getKeywordByName(String keywordLowercase) {
        return newsDAO.getKeywordByName(keywordLowercase);
    }

    public List<News> getNewsIdByKeyword(long keywordId, long newsTime, int limit) {
        return newsDAO.getNewsIdByKeyword(keywordId, newsTime, limit);
    }

    public void deleteNewsFromNewsKeyword(long newsId, long keywordId) {
        newsDAO.deleteNewsFromNewsKeyword(newsId, keywordId);
    }

    public void deleteNewsByKeywordId(long keywordId) {
        newsDAO.deleteNewsByKeywordId(keywordId);
    }

    public void aliasKeyword(long duplicatedKeywordId, long targetId) {
        newsDAO.aliasKeyword(duplicatedKeywordId, targetId);
    }

    public void redirectAlias(long oldTargetId, long targetId) {
        newsDAO.redirectAlias(oldTargetId, targetId);
    }

    public void updateKeywordForNewsKeyword(long newsId, long keywordId, long targetId, String keyword, String keywordLowercase) {
        newsDAO.updateKeywordForNewsKeyword(newsId, keywordId, targetId, keyword, keywordLowercase);
    }

    public void voteKeywordHot(long keywordId, int delta) {
        newsDAO.voteKeywordHot(keywordId, delta);
    }

    public Long getAndIncrId() {
        return newsDAO.getAndIncrId();
    }

    public void updateNewsTruth(long newsId, int delta) {
        newsDAO.updateNewsTruth(newsId, delta);
    }

    public void updateNewsFake(long newsId, int delta) {
        newsDAO.updateNewsFake(newsId, delta);
    }

    public long getUserIdByName(String userName) {
        Long userId = userDAO.getUserIdByName(userName);// TODO 如果将来分表，需要一个倒排索引来查询
        return userId == null ? 0 : userId;
    }

    public Long registerUser(String pwd, String name, String icon, String email, String locale) {
        long userId = userDAO.getUserId();
        userDAO.registerUser(userId, pwd, name, icon, email, locale, System.currentTimeMillis());// 如果将来分表，需要一个全局索引来查询name是否有重复
        return userId;
    }

    public long getUserIdByNameAndPwd(String userName, String pwd) {
        Long userId = userDAO.getUserIdByNameAndPwd(userName, pwd);// TODO 如果将来分表，需要一个倒排索引来查询
        return userId == null ? 0 : userId;
    }

    public User getUserById(long userId) {
        return userDAO.getUserById(userId);
    }

    public void insertUserKeyword(long userId, long keywordId, String keyword) {
        newsDAO.insertUserKeyword(userId, keywordId, keyword, System.currentTimeMillis());
    }

    public int insertKeywordUser(long keywordId, long userId) {
        return newsDAO.insertKeywordUser(keywordId, userId, System.currentTimeMillis());
    }

    public void deleteUserKeyword(long userId, long keywordId) {
        newsDAO.deleteUserKeyword(userId, keywordId);
    }

    public List<UserKeyword> getUserKeywords(long userId) {
        return newsDAO.getUserKeywords(userId);
    }

    public void clearUserKeyword(long userId, long keywordId) {
        newsDAO.clearUserKeywordNotRead(userId, keywordId);
    }

    public List<Long> getKeywordFollowers(long keywordId) {
        return newsDAO.getKeywordFollowers(keywordId);
    }

    public void updateUserKeywordNotRead(long userId, List<Long> keywordIds, int delta) {
        newsDAO.updateUserKeywordNotRead(userId, keywordIds, delta, System.currentTimeMillis());
    }

    public long getKeywordFollower(long keywordId, long userId) {
        Long userId1 = newsDAO.getKeywordFollower(keywordId, userId);
        return userId1 == null ? 0 : userId1;
    }

    public void insertMsg(long userId, String userName, String content, long createTime) {
        newsDAO.insertMsg(userId, userName, content, createTime);
    }

    public List<Message> getMessages(long msgId, int limit) {
        msgId = msgId <= 0 ? Long.MAX_VALUE : msgId;
        return newsDAO.getMessages(msgId, limit);
    }

    public void updateNewsContent(long newsId, String title, String content, String url, long newsTime, String newsTimeDesc) {
        newsDAO.updateNewsContent(newsId, title, content, url, newsTime, newsTimeDesc);
    }

    public void deleteKeywordFromKeywordNews(long keywordId, long newsId) {
        newsDAO.deleteKeywordFromKeywordNews(keywordId, newsId);
    }
}
