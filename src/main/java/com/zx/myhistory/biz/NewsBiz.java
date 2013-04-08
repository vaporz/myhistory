
package com.zx.myhistory.biz;

import com.zx.myhistory.dao.NewsDAO;
import com.zx.myhistory.model.Keyword;
import com.zx.myhistory.model.News;
import com.zx.myhistory.model.User;

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
    private NewsDAO newsDAO;

    public long commitNews(String title, String content, String url, long newsTime) {
        long id = newsDAO.getAndIncrId();
        newsDAO.commitNews(id, title, content, url, newsTime, System.currentTimeMillis());
        return id;
    }

    public void commitNewsKeyword(long newsId, Set<Keyword> keywords) {
        for (Keyword keyword : keywords) {
            newsDAO.insertNewsKeyword(newsId, keyword.getKeywordId(), keyword.getKeyword(), keyword.getKeywordLowercase(),
                System.currentTimeMillis());
        }
    }

    public void commitKeywordNews(long newsId, long newsTime, Set<Keyword> keywords) {
        for (Keyword keyword : keywords) {
            newsDAO.insertKeywordNews(keyword.getKeywordId(), newsId, newsTime);
        }
    }

    public void insertKeywordNews(long keywordId, long newsId, long newsTime) {
        newsDAO.insertKeywordNews(keywordId, newsId, newsTime);
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
        List<Keyword> list = newsDAO.getKeywordByName(keywordsLowercase);
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
        Long userId = newsDAO.getUserIdByName(userName);// TODO 如果将来分表，需要一个倒排索引来查询
        return userId == null ? 0 : userId;
    }

    public Long registerUser(String pwd, String name, String email, String locale) {
        long userId = newsDAO.getUserId();
        newsDAO.registerUser(userId, pwd, name, email, locale, System.currentTimeMillis());// 如果将来分表，需要一个全局索引来查询name是否有重复
        return userId;
    }

    public long getUserIdByNameAndPwd(String userName, String pwd) {
        Long userId = newsDAO.getUserIdByNameAndPwd(userName, pwd);// TODO 如果将来分表，需要一个倒排索引来查询
        return userId == null ? 0 : userId;
    }

    public User getUserById(long userId) {
        return newsDAO.getUserById(userId);
    }
}
