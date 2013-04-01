
package com.zx.myhistory.service;

import com.zx.myhistory.biz.NewsBiz;
import com.zx.myhistory.model.Keyword;
import com.zx.myhistory.model.News;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Service
public class NewsService {
    @Autowired
    private NewsBiz newsBiz;

    public void commitNews(String title, String content, String url, long newsTime, Set<String> keywordStrSet) {
        long newsId = newsBiz.commitNews(title, content, url, newsTime);
        attachKeywordsForNews(newsId, newsTime, keywordStrSet);
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
        Keyword keyword = newsBiz.getKeywordById(keywordId);
        while (keyword.getAliasId() > 0) {
            keyword = newsBiz.getKeywordById(keyword.getAliasId());
        }
        return keyword;
    }

    public List<Keyword> getKeywordsByNewsId(long newsId) {
        return newsBiz.getKeywordsByNewsId(newsId);
    }

    public void attachKeywordsForNews(long newsId, Set<String> keywordStrSet) {
        News news = newsBiz.getOneNewsById(newsId);
        attachKeywordsForNews(newsId, news.getNewsTime(), keywordStrSet);
    }

    private void attachKeywordsForNews(long newsId, long newsTime, Set<String> keywordStrSet) {
        Set<Keyword> keywordSet = getKeywords(keywordStrSet, true);
        // TODO 如果有存在alias的关键字，要找到根源的关键字
        // TODO 有并发的问题，如果有关键字在执行过程中被alias？
        newsBiz.commitKeywordNews(newsId, newsTime, keywordSet);
        newsBiz.commitNewsKeyword(newsId, keywordSet);
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
            newsBiz.updateKeywordIdForNewsKeyword(item.getNewsId(), keywordObj.getKeywordId(), targetObj.getKeywordId());
        }
        newsBiz.deleteNewsByKeywordId(keywordObj.getKeywordId());
        newsBiz.aliasKeyword(keywordObj.getKeywordId(), targetObj.getKeywordId());
        newsBiz.redirectAlias(keywordObj.getKeywordId(), targetObj.getKeywordId());
    }
}
