
package com.zx.myhistory.dao;

import com.zx.myhistory.model.Keyword;
import com.zx.myhistory.model.News;

import net.paoding.rose.jade.annotation.DAO;
import net.paoding.rose.jade.annotation.ReturnGeneratedKeys;
import net.paoding.rose.jade.annotation.SQL;
import net.paoding.rose.jade.annotation.SQLParam;

import java.util.List;
import java.util.Set;

@DAO
public interface NewsDAO {

    final String KEYWORD_COLUMNS = " keyword_id, keyword, keyword_lowercase, alias_id, hot, create_time ";

    @SQL("INSERT INTO news (title, content, url, news_time, create_time)VALUES(:title, :content, :url, :newsTime, :createTime)")
    @ReturnGeneratedKeys
    public Long commitNews(@SQLParam("title") String title, @SQLParam("content") String content, @SQLParam("url") String url,
        @SQLParam("newsTime") long newsTime, @SQLParam("createTime") long createTime);

    @SQL("INSERT INTO keyword (keyword, keyword_lowercase, create_time)VALUES(:keyword, :keywordLowercase, :createTime) ON DUPLICATE KEY UPDATE keyword=:keyword")
    @ReturnGeneratedKeys
    public Long insertKeyword(@SQLParam("keyword") String keyword, @SQLParam("keywordLowercase") String keywordLowercase,
        @SQLParam("createTime") long createTime);

    @SQL("INSERT INTO news_keyword (news_id, keyword_id, keyword, keyword_lowercase, create_time)VALUES(:newsId, :keywordId, :keyword, :keywordLowercase, :createTime)"
            + " ON DUPLICATE KEY UPDATE keyword_id=:keywordId")
    public void insertNewsKeyword(@SQLParam("newsId") long newsId, @SQLParam("keywordId") long keywordId,
        @SQLParam("keyword") String keyword, @SQLParam("keywordLowercase") String keywordLowercase, @SQLParam("createTime") long createTime);

    @SQL("INSERT INTO keyword_news (keyword_id, news_id, news_time)VALUES(:keywordId, :newsId, :newsTime)"
            + " ON DUPLICATE KEY UPDATE news_id=:newsId")
    public void insertKeywordNews(@SQLParam("keywordId") long keywordId, @SQLParam("newsId") long newsId,
        @SQLParam("newsTime") long newsTime);

    @SQL("SELECT " + KEYWORD_COLUMNS + " FROM keyword ORDER BY hot DESC LIMIT 200")
    public List<Keyword> getKeywords();

    @SQL("SELECT news_id, news_time FROM keyword_news WHERE keyword_id=:keywordId AND news_time<:newsTime ORDER BY news_time DESC LIMIT :limit")
    public List<News> getNewsIdByKeyword(@SQLParam("keywordId") long keywordId, @SQLParam("newsTime") long newsTime,
        @SQLParam("limit") int limit);

    @SQL("SELECT keyword_id, keyword, keyword_lowercase, create_time FROM news_keyword WHERE news_id=:newsId")
    public List<Keyword> getKeywordsByNewsId(@SQLParam("newsId") long newsId);

    @SQL("SELECT news_id, title, content, url, news_time, create_time FROM news WHERE news_id=:newsId")
    public News getOneNewsById(@SQLParam("newsId") long newsId);

    @SQL("SELECT " + KEYWORD_COLUMNS + " FROM keyword WHERE keyword_lowercase IN (:keywords)")
    public List<Keyword> getKeywordByName(@SQLParam("keywords") Set<String> keywords);

    @SQL("SELECT " + KEYWORD_COLUMNS + " FROM keyword WHERE keyword_lowercase=:keywordLowercase")
    public Keyword getKeywordByName(@SQLParam("keywordLowercase") String keywordLowercase);

    @SQL("SELECT news_id, title, content, url, news_time, create_time FROM news WHERE news_id IN (:newsIds) ORDER BY news_time DESC")
    public List<News> getNewsByIds(@SQLParam("newsIds") Set<Long> newsIds);

    @SQL("SELECT " + KEYWORD_COLUMNS + " FROM keyword WHERE keyword_id=:keywordId")
    public Keyword getKeywordById(@SQLParam("keywordId") long keywordId);

    @SQL("UPDATE news_keyword SET keyword_id=:targetId WHERE news_id=:newsId AND keyword_id=:keywordId")
    public void updateKeywordIdForNewsKeyword(@SQLParam("newsId") long newsId, @SQLParam("keywordId") long keywordId,
        @SQLParam("targetId") long targetId);

    @SQL("DELETE FROM news_keyword WHERE news_id=:newsId AND keyword_id=:keywordId")
    public void deleteNewsFromNewsKeyword(@SQLParam("newsId") long newsId, @SQLParam("keywordId") long keywordId);

    @SQL("DELETE FROM keyword_news WHERE keyword_id=:keywordId")
    public void deleteNewsByKeywordId(@SQLParam("keywordId") long keywordId);

    @SQL("UPDATE keyword SET alias_id=:targetId WHERE keyword_id=:keywordId")
    public void aliasKeyword(@SQLParam("keywordId") long duplicatedKeywordId, @SQLParam("targetId") long targetId);

    @SQL("UPDATE keyword SET alias_id=:targetId WHERE alias_id=:oldTargetId")
    public void redirectAlias(@SQLParam("oldTargetId") long oldTargetId, @SQLParam("targetId") long targetId);

    @SQL("UPDATE keyword SET hot=hot+:delta WHERE keyword_id=:keywordId")
    public void voteKeywordHot(@SQLParam("keywordId") long keywordId, @SQLParam("delta") int delta);
}
