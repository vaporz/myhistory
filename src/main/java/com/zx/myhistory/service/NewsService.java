package com.zx.myhistory.service;

import com.zx.myhistory.biz.NewsBiz;
import com.zx.myhistory.model.Keyword;
import com.zx.myhistory.model.News;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		return newsBiz.getKeywordById(keywordId);
	}

	public List<Keyword> getKeywordsByNewsId(long newsId) {
		return newsBiz.getKeywordsByNewsId(newsId);
	}

	public void attachKeywordsForNews(long newsId,Set<String> keywordStrSet) {
		News news = newsBiz.getOneNewsById(newsId);
		attachKeywordsForNews(newsId, news.getNewsTime(), keywordStrSet);
	}

	private void attachKeywordsForNews(long newsId, long newsTime, Set<String> keywordStrSet) {
		Set<Keyword> keywordSet = getKeywords(keywordStrSet, true);
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
}
