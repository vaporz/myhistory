
package com.zx.myhistory.biz;

import com.zx.myhistory.dao.NewsDAO;
import com.zx.myhistory.model.Keyword;
import com.zx.myhistory.model.News;

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
        return newsDAO.commitNews(title, content, url, newsTime, System.currentTimeMillis());
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

    public long createKeyword(String keyword) {
        return newsDAO.insertKeyword(keyword, keyword.toLowerCase(), System.currentTimeMillis());
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
        return newsDAO.getNewsByIds(ids);// TODO use redis to cache News object, map: newsId, key, value
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
}
