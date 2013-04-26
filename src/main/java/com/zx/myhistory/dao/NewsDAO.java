
package com.zx.myhistory.dao;

import com.zx.myhistory.model.Keyword;
import com.zx.myhistory.model.Message;
import com.zx.myhistory.model.News;
import com.zx.myhistory.model.UserKeyword;

import net.paoding.rose.jade.annotation.DAO;
import net.paoding.rose.jade.annotation.ReturnGeneratedKeys;
import net.paoding.rose.jade.annotation.SQL;
import net.paoding.rose.jade.annotation.SQLParam;
import net.paoding.rose.jade.annotation.ShardBy;

import java.util.List;
import java.util.Set;

@DAO
public interface NewsDAO {

    final String KEYWORD_COLUMNS = " keyword_id, keyword, keyword_lowercase, alias_id, hot, wiki_url, create_time ";

    @SQL("INSERT INTO news (news_id, title, content, url, news_time, create_time)VALUES(:newsId, :title, :content, :url, :newsTime, :createTime)")
    public void commitNews(@SQLParam("newsId") long newsId, @SQLParam("title") String title, @SQLParam("content") String content,
        @SQLParam("url") String url, @SQLParam("newsTime") long newsTime, @SQLParam("createTime") long createTime);

    @SQL("INSERT INTO keyword (keyword_id, keyword, keyword_lowercase, wiki_url, create_time)VALUES(:keywordId, :keyword, :keywordLowercase, :wikiUrl, :createTime) ON DUPLICATE KEY UPDATE keyword=:keyword")
    public void insertKeyword(@SQLParam("keywordId") long keywordId, @SQLParam("keyword") String keyword,
        @SQLParam("keywordLowercase") String keywordLowercase, @SQLParam("wikiUrl") String wikiUrl, @SQLParam("createTime") long createTime);

    @SQL("INSERT INTO news_keyword (news_id, keyword_id, keyword, keyword_lowercase, create_time)VALUES(:newsId, :keywordId, :keyword, :keywordLowercase, :createTime)"
            + " ON DUPLICATE KEY UPDATE keyword_id=:keywordId")
    public void insertNewsKeyword(@ShardBy @SQLParam("newsId") long newsId, @SQLParam("keywordId") long keywordId,
        @SQLParam("keyword") String keyword, @SQLParam("keywordLowercase") String keywordLowercase, @SQLParam("createTime") long createTime);

    @SQL("INSERT INTO keyword_news (keyword_id, news_id, news_time)VALUES(:keywordId, :newsId, :newsTime)"
            + " ON DUPLICATE KEY UPDATE news_id=:newsId")
    public void insertKeywordNews(@ShardBy @SQLParam("keywordId") long keywordId, @SQLParam("newsId") long newsId,
        @SQLParam("newsTime") long newsTime);

    @SQL("SELECT " + KEYWORD_COLUMNS + " FROM keyword WHERE alias_id=0 ORDER BY hot DESC LIMIT 200")
    public List<Keyword> getKeywords();

    @SQL("SELECT news_id, news_time FROM keyword_news WHERE keyword_id=:keywordId AND news_time<:newsTime ORDER BY news_time DESC LIMIT :limit")
    public List<News> getNewsIdByKeyword(@ShardBy @SQLParam("keywordId") long keywordId, @SQLParam("newsTime") long newsTime,
        @SQLParam("limit") int limit);

    @SQL("SELECT keyword_id, keyword, keyword_lowercase, create_time FROM news_keyword WHERE news_id=:newsId")
    public List<Keyword> getKeywordsByNewsId(@ShardBy @SQLParam("newsId") long newsId);

    @SQL("SELECT news_id, title, content, url, news_time, truth, fake, create_time FROM news WHERE news_id=:newsId")
    public News getOneNewsById(@SQLParam("newsId") long newsId);

    @SQL("SELECT " + KEYWORD_COLUMNS + " FROM keyword WHERE keyword_lowercase IN (:keywords)")
    public List<Keyword> getKeywordByName(@SQLParam("keywords") Set<String> keywords);

    @SQL("SELECT " + KEYWORD_COLUMNS + " FROM keyword WHERE keyword_lowercase=:keywordLowercase")
    public Keyword getKeywordByName(@SQLParam("keywordLowercase") String keywordLowercase);

    @SQL("SELECT news_id, title, content, url, news_time, truth, fake, create_time FROM news WHERE news_id IN (:newsIds) ORDER BY news_time DESC")
    public List<News> getNewsByIds(@SQLParam("newsIds") Set<Long> newsIds);

    @SQL("SELECT " + KEYWORD_COLUMNS + " FROM keyword WHERE keyword_id=:keywordId")
    public Keyword getKeywordById(@SQLParam("keywordId") long keywordId);

    @SQL("UPDATE news_keyword SET keyword_id=:targetId, keyword=:keyword, keyword_lowercase=:keywordLowercase WHERE news_id=:newsId AND keyword_id=:keywordId")
    public void updateKeywordForNewsKeyword(@ShardBy @SQLParam("newsId") long newsId, @SQLParam("keywordId") long keywordId,
        @SQLParam("targetId") long targetId, @SQLParam("keyword") String keyword, @SQLParam("keywordLowercase") String keywordLowercase);

    @SQL("DELETE FROM news_keyword WHERE news_id=:newsId AND keyword_id=:keywordId")
    public void deleteNewsFromNewsKeyword(@ShardBy @SQLParam("newsId") long newsId, @SQLParam("keywordId") long keywordId);

    @SQL("DELETE FROM keyword_news WHERE keyword_id=:keywordId")
    public void deleteNewsByKeywordId(@ShardBy @SQLParam("keywordId") long keywordId);

    @SQL("UPDATE keyword SET alias_id=:targetId WHERE keyword_id=:keywordId")
    public void aliasKeyword(@SQLParam("keywordId") long duplicatedKeywordId, @SQLParam("targetId") long targetId);

    @SQL("UPDATE keyword SET alias_id=:targetId WHERE alias_id=:oldTargetId")
    public void redirectAlias(@SQLParam("oldTargetId") long oldTargetId, @SQLParam("targetId") long targetId);

    @SQL("UPDATE keyword SET hot=hot+:delta WHERE keyword_id=:keywordId")
    public void voteKeywordHot(@SQLParam("keywordId") long keywordId, @SQLParam("delta") int delta);

    @SQL("INSERT INTO id_index ()VALUES()")
    @ReturnGeneratedKeys
    public Long getAndIncrId();

    @SQL("UPDATE news SET truth=truth+:delta WHERE news_id=:newsId")
    public void updateNewsTruth(@SQLParam("newsId") long newsId, @SQLParam("delta") int delta);

    @SQL("UPDATE news SET fake=fake+:delta WHERE news_id=:newsId")
    public void updateNewsFake(@SQLParam("newsId") long newsId, @SQLParam("delta") int delta);


    @SQL("INSERT INTO user_keyword (user_id, keyword_id, keyword, last_modify_time)VALUES(:userId, :keywordId, :keyword, :lastModifyTime)")
    public void insertUserKeyword(@SQLParam("userId") long userId, @SQLParam("keywordId") long keywordId,
        @SQLParam("keyword") String keyword, @SQLParam("lastModifyTime") long lastModifyTime);

    @SQL("INSERT INTO keyword_user (keyword_id, user_id, create_time)VALUES(:keywordId, :userId, :createTime)"
            + " ON DUPLICATE KEY UPDATE keyword_id=:keywordId")
    public Integer insertKeywordUser(@SQLParam("keywordId") long keywordId, @SQLParam("userId") long userId,
        @SQLParam("createTime") long createTime);

    @SQL("SELECT user_id FROM keyword_user WHERE keyword_id=:keywordId")
    public List<Long> getKeywordFollowers(@SQLParam("keywordId") long keywordId);

    @SQL("SELECT user_id FROM keyword_user WHERE keyword_id=:keywordId AND user_id=:userId")
    public Long getKeywordFollower(@SQLParam("keywordId") long keywordId, @SQLParam("userId") long userId);

    @SQL("UPDATE user_keyword SET not_read=not_read+:delta, last_modify_time=:time WHERE user_id=:userId AND keyword_id IN (:keywordIds)")
    public void updateUserKeywordNotRead(@SQLParam("userId") long userId, @SQLParam("keywordIds") List<Long> keywordIds,
        @SQLParam("delta") int delta, @SQLParam("time") long time);

    @SQL("UPDATE user_keyword SET not_read=0,last_modify_time=0 WHERE user_id=:userId AND keyword_id=:keywordId")
    public void clearUserKeywordNotRead(@SQLParam("userId") long userId, @SQLParam("keywordId") long keywordId);

    @SQL("DELETE FROM user_keyword WHERE user_id=:userId AND keyword_id=:keywordId")
    public void deleteUserKeyword(@SQLParam("userId") long userId, @SQLParam("keywordId") long keywordId);

    @SQL("DELETE FROM keyword_user WHERE keyword_id=:keywordId AND user_id=:userId")
    public void deleteKeywordUser(@SQLParam("keywordId") long keywordId, @SQLParam("userId") long userId);

    @SQL("SELECT keyword_id, keyword, not_read, last_modify_time FROM user_keyword WHERE user_id=:userId ORDER BY last_modify_time DESC")
    public List<UserKeyword> getUserKeywords(@SQLParam("userId") long userId);

    @SQL("INSERT INTO message_board (user_id, user_name, content, create_time)VALUES(:userId, :userName, :content, :createTime)")
    public void insertMsg(@SQLParam("userId") long userId, @SQLParam("userName") String userName, @SQLParam("content") String content,
        @SQLParam("createTime") long createTime);

    @SQL("SELECT msg_id, user_id, user_name, content, create_time FROM message_board WHERE msg_id<:msgId LIMIT :limit")
    public List<Message> getMessages(@SQLParam("msgId") long msgId, @SQLParam("limit") int limit);
}
