
package com.zx.myhistory.controllers;

import com.zx.myhistory.model.BadRequestException;
import com.zx.myhistory.model.ErrorCode;
import com.zx.myhistory.model.Keyword;
import com.zx.myhistory.model.News;
import com.zx.myhistory.service.NewsService;

import net.paoding.rose.web.Invocation;
import net.paoding.rose.web.annotation.Param;
import net.paoding.rose.web.annotation.Path;
import net.paoding.rose.web.annotation.rest.Get;
import net.paoding.rose.web.annotation.rest.Post;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Path("")
public class NewsController {

    private Log logger = LogFactory.getLog(NewsController.class);
    @Autowired
    private NewsService newsService;

    private static SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    /**
     * 显示事件提交页
     */
    @Get("news/commit")
    public String showCommitNews() {
        return "showcommitnews";
    }

    /**
     * 提交事件
     */
    @Post("news/commit")
    public String commitNews(Invocation inv, @Param("url") String url, @Param("title") String title, @Param("content") String content,
        @Param("keywords") String keywords, @Param("newTime") String newTimeStr) throws ParseException, BadRequestException {
        String[] keywordsArr = keywords.split(",");
        Set<String> keywordSet = new HashSet<String>();
        for (String keyword : keywordsArr) {
            if (StringUtils.isBlank(keyword)) {
                continue;
            }
            keyword = StringUtils.trimToEmpty(keyword);
            keywordSet.add(keyword);
        }
        long newsTime = format.parse(newTimeStr).getTime();
        newsService.commitNews(title, content, url, newsTime, keywordSet);
        return "showcommitnews";
    }

    /**
     * 显示关键词列表
     */
    @Get("keywords")
    public String listKerwords(Invocation inv) {
        List<Keyword> list = newsService.getKeywords();
        inv.addModel("keywords", list);
        return "keywords";
    }

    /**
     * 按时间列出与一个关键词有关的事件
     */
    @Get("keyword/{keywordId:[0-9]+}/news")
    public String listNewsByKeyword(Invocation inv, @Param("keywordId") long keywordId, @Param("newsTime") long newsTime,
        @Param("limit") int limit) throws BadRequestException {
        if (limit <= 0 || newsTime < 0) {
            throw new BadRequestException(ErrorCode.ErrorParameters, "wrong parameters");
        }
        Keyword keyword = newsService.getKeywordById(keywordId);
        List<News> list = newsService.getNewsByKeyword(keywordId, newsTime, limit);
        inv.addModel("keyword", keyword);
        inv.addModel("news", list);
        return "news";
    }

    /**
     * 显示一个事件
     */
    @Get("news/{newsId:[0-9]+}")
    public String showNews(Invocation inv, @Param("newsId") long newsId) {
        News news = newsService.getOneNewsById(newsId);
        List<Keyword> keywords = newsService.getKeywordsByNewsId(newsId);
        inv.addModel("keywords", keywords);
        inv.addModel("news", news);
        return "onenews";
    }
}
