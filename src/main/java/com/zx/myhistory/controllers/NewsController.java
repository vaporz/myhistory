
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
import org.springframework.util.CollectionUtils;

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
    public String showCommitNews(Invocation inv, String msg) {
        inv.addModel("msg", StringUtils.defaultString(msg));
        return "showcommitnews";
    }

    /**
     * 提交事件
     */
    @Post("news/commit")
    public String commitNews(Invocation inv, @Param("url") String url, @Param("title") String title, @Param("content") String content,
        @Param("keywords") String keywords, @Param("newTime") String newTimeStr) throws ParseException, BadRequestException {
        Set<String> keywordSet = getKeywordSet(keywords);
        if (!CollectionUtils.isEmpty(keywordSet)) {
            long newsTime = format.parse(newTimeStr).getTime();
            newsService.commitNews(title, content, url, newsTime, keywordSet);
        }
        return showCommitNews(inv, "操作成功");
    }

    private Set<String> getKeywordSet(String keywords) {
        Set<String> keywordSet = new HashSet<String>();
        if (StringUtils.isBlank(keywords)) {
            return keywordSet;
        }
        String[] keywordsArr = keywords.split(",");
        for (String keyword : keywordsArr) {
            if (StringUtils.isBlank(keyword)) {
                continue;
            }
            keyword = StringUtils.trimToEmpty(keyword);
            keywordSet.add(keyword);
        }
        return keywordSet;
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

    /**
     * 给某个事件添加关键字
     */
    @Post("news/{newsId:[0-9]+}/keywords")
    public String moreKeywords(Invocation inv, @Param("newsId") long newsId, @Param("keywords") String keywords) {
        Set<String> keywordSet = getKeywordSet(keywords);
        if (!CollectionUtils.isEmpty(keywordSet)) {
            newsService.attachKeywordsForNews(newsId, keywordSet);
        }
        return showNews(inv, newsId);
    }

    @Get("keyword/merge")
    public String showMergeKeyword(Invocation inv, String msg) {
        inv.addModel("msg", StringUtils.defaultString(msg));
        return "mergekeyword";
    }

    /**
     * 合并关键字
     */
    @Post("keyword/merge")
    public String mergeKeywords(Invocation inv, @Param("keyword") String keyword, @Param("target") String target)
                                                                                                                 throws BadRequestException {
        if (StringUtils.isBlank(keyword) || StringUtils.isBlank(target)) {
            throw new BadRequestException(ErrorCode.ErrorParameters, "wrong parameters");
        }
        newsService.mergeKerword(keyword, target);
        return showMergeKeyword(inv, "操作成功");
    }

    @Get("keyword/vote/hot")
    public String voteKeywordHot(Invocation inv, @Param("keywordId") long keywordId) throws BadRequestException {
        if (keywordId <= 0) {
            throw new BadRequestException(ErrorCode.ErrorParameters, "wrong parameters");
        }
        newsService.voteKeywordHot(keywordId);
        return listNewsByKeyword(inv, keywordId, 0, 30);
    }
}
