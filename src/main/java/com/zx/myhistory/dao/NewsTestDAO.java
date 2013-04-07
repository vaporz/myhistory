
package com.zx.myhistory.dao;

import net.paoding.rose.jade.annotation.DAO;
import net.paoding.rose.jade.annotation.SQL;
import net.paoding.rose.jade.annotation.SQLParam;

@DAO
public interface NewsTestDAO {

    @SQL("INSERT INTO keyword (keyword_id, keyword, keyword_lowercase, wiki_url, create_time)VALUES(:keywordId, :keyword, :keywordLowercase, :wikiUrl, :createTime)")
    public void insertKeyword(@SQLParam("keywordId") long keywordId, @SQLParam("keyword") String keyword,
        @SQLParam("keywordLowercase") String keywordLowercase, @SQLParam("wikiUrl") String wikiUrl, @SQLParam("createTime") long createTime);

    @SQL("INSERT INTO news_keyword (news_id, keyword_id, keyword, keyword_lowercase, create_time)VALUES(:newsId, :keywordId, :keyword, :keywordLowercase, :createTime)")
    public void insertNewsKeyword(@SQLParam("newsId") long newsId, @SQLParam("keywordId") long keywordId,
        @SQLParam("keyword") String keyword, @SQLParam("keywordLowercase") String keywordLowercase, @SQLParam("createTime") long createTime);

    @SQL("INSERT INTO keyword_news (keyword_id, news_id, news_time)VALUES(:keywordId, :newsId, :newsTime)")
    public void insertKeywordNews(@SQLParam("keywordId") long keywordId, @SQLParam("newsId") long newsId,
        @SQLParam("newsTime") long newsTime);

}
