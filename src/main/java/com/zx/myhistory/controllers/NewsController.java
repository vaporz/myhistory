
package com.zx.myhistory.controllers;

import com.zx.myhistory.model.BadRequestException;
import com.zx.myhistory.model.Comment;
import com.zx.myhistory.model.ErrorCode;
import com.zx.myhistory.model.HostHolder;
import com.zx.myhistory.model.Keyword;
import com.zx.myhistory.model.Message;
import com.zx.myhistory.model.News;
import com.zx.myhistory.model.User;
import com.zx.myhistory.service.CommentService;
import com.zx.myhistory.service.NewsService;
import com.zx.myhistory.util.LoginRequired;
import com.zx.myhistory.util.NewsUtils;

import net.paoding.rose.web.Invocation;
import net.paoding.rose.web.annotation.Param;
import net.paoding.rose.web.annotation.Path;
import net.paoding.rose.web.annotation.rest.Get;
import net.paoding.rose.web.annotation.rest.Post;

import org.apache.commons.lang3.StringUtils;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Path("")
public class NewsController {

    // private Log logger = LogFactory.getLog(NewsController.class);
    @Autowired
    private NewsService newsService;
    @Autowired
    private CommentService commentService;

    @Autowired
    private HostHolder hostHolder;

    private static SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Get("")
    public String index() {
        return "r:/keywords";
    }

    /**
     * 显示事件提交页
     */
    @Get("news/commit")
    public String showCommitNews(Invocation inv, @Param("msg") String msg, @Param("msgType") String msgType) {
        if (StringUtils.isBlank(msg)) {
            msgType = "info";
        } else {
            msgType = StringUtils.defaultString(msgType, "success");
        }
        inv.addModel("msg", StringUtils.defaultString(msg));
        inv.addModel("active", "commit");
        inv.addModel("msgType", msgType);
        return "showcommitnews";
    }

    /**
     * 提交事件
     */
    @Post("news/commit")
    @LoginRequired
    public String commitNews(Invocation inv, @Param("url") String url, @Param("title") String title, @Param("content") String content,
        @Param("keywords") String keywords, @Param("day") String dayStr, @Param("second") String secondStr,
        @Param("datedesc") String newsTimeDesc, @Param("timepoint") String timePoint, @Param("datetype") String dateType)
                                                                                                                         throws ParseException {
        inv.addModel("url", url);
        inv.addModel("title", StringUtils.defaultIfBlank(title, ""));
        inv.addModel("content", StringUtils.defaultIfBlank(content, ""));
        inv.addModel("keywords", StringUtils.defaultIfBlank(keywords, ""));
        inv.addModel("day", StringUtils.defaultIfBlank(dayStr, ""));
        inv.addModel("second", StringUtils.defaultIfBlank(secondStr, "00:00:00"));
        inv.addModel("datedesc", StringUtils.defaultIfBlank(newsTimeDesc, ""));
        inv.addModel("timepoint", StringUtils.defaultIfBlank(timePoint, ""));
        inv.addModel("datetype", StringUtils.defaultIfBlank(dateType, ""));
        if (StringUtils.isBlank(title) || StringUtils.isBlank(content) || StringUtils.isBlank(keywords)) {
            return showCommitNews(inv, "“标题”，“事件摘要”和“关键字”都不能为空", "error");
        }
        String newTimeStr = "";
        if ("exact".equals(dateType)) {
            if (StringUtils.isBlank(dayStr)) {
                return showCommitNews(inv, "“年月日”不能为空", "error");
            }
            newTimeStr = dayStr + " " + secondStr;
            newTimeStr = newTimeStr.replace('：', ':');
            newsTimeDesc = "";
        } else if ("approximate".equals(dateType)) {
            newTimeStr = timePoint;
            newsTimeDesc = StringUtils.defaultIfBlank(newsTimeDesc, "");
            if (StringUtils.isBlank(newsTimeDesc)) {
                return showCommitNews(inv, "时间描述不能为空", "error");
            }
        } else {
            return showCommitNews(inv, "时间输入错误", "error");
        }
        try {
            Set<String> keywordSet = getKeywordSet(keywords);
            if (!CollectionUtils.isEmpty(keywordSet)) {
                long newsTime = format.parse(newTimeStr).getTime();
                newsService.commitNews(title, content, url, newsTime, newsTimeDesc, keywordSet);
            }
        } catch (ParseException e) {
            return showCommitNews(inv, "时间格式输入错误", "error");
        }
        return "r:/news/commit?msg=操作成功&msgType=success";
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
        inv.addModel("active", "keywords");
        return "keywords";
    }

    /**
     * 按时间列出与一个关键词有关的事件
     */
    @Get("keyword/{keywordId:[0-9]+}/news")
    public String listNewsByKeyword(Invocation inv, @Param("keywordId") long keywordId, @Param("newsTime") long newsTime,
        @Param("limit") int limit, @Param("userId") long userId) throws BadRequestException, JSONException, UnsupportedEncodingException {
        if (limit <= 0 || newsTime < 0) {// TODO 不能抛出异常，要友好的提示给页面
            throw new BadRequestException(ErrorCode.ErrorParameters, "参数错误");
        }
        Keyword keyword = newsService.getTrueKeywordById(keywordId);
        if (keyword == null) {
            return "@404";
        }
        List<News> list = newsService.getNewsByKeyword(keyword.getKeywordId(), newsTime, limit);
        if (userId > 0) {
            newsService.clearUserKeyword(userId, keywordId);
        }
        User host = hostHolder.getHost();
        if (host != null) {
            if (newsService.isFollower(host.getUserId(), keywordId)) {
                inv.addModel("voted", true);
            } else {
                inv.addModel("voted", false);
            }
        } else {
            if (NewsUtils.checkVoteKeywordCookie(inv, keywordId)) {
                inv.addModel("voted", true);
            }
        }
        inv.addModel("keyword", keyword);
        inv.addModel("news", list);
        inv.addModel("active", "keywords");
        return "news";
    }

    /**
     * 显示一个事件
     */
    @Get("news/{newsId:[0-9]+}")
    public String showNews(Invocation inv, @Param("newsId") long newsId, @Param("createTime") long createTime, @Param("limit") int limit)
                                                                                                                                         throws JSONException,
                                                                                                                                         UnsupportedEncodingException {
        News news = newsService.getOneNewsById(newsId);
        List<Keyword> keywords = newsService.getKeywordsByNewsId(newsId);
        if (NewsUtils.checkVoteNewsCookie(inv, newsId)) {
            inv.addModel("voted", true);
        }
        List<Comment> comments = commentService.getComments(newsId, createTime, limit);
        inv.addModel("comments", comments);
        inv.addModel("keywords", keywords);
        inv.addModel("news", news);
        inv.addModel("active", "keywords");
        return "onenews";
    }

    /**
     * 给某个事件添加关键字
     */
    @Post("news/{newsId:[0-9]+}/keywords")
    @LoginRequired
    public String moreKeywords(Invocation inv, @Param("newsId") long newsId, @Param("keywords") String keywords) {
        Set<String> keywordSet = getKeywordSet(keywords);
        if (!CollectionUtils.isEmpty(keywordSet)) {
            newsService.attachKeywordsForNews(newsId, keywordSet);
        }
        return "r:/news/" + newsId + "/edit/keyword";
    }

    @Get("keyword/merge")
    public String showMergeKeyword(Invocation inv, String msg) {
        inv.addModel("msg", StringUtils.defaultString(msg));
        inv.addModel("active", "merge");
        return "mergekeyword";
    }

    /**
     * 合并关键字
     */
    @Post("keyword/merge")
    @LoginRequired
    public String mergeKeywords(Invocation inv, @Param("keyword") String keyword, @Param("target") String target)
                                                                                                                 throws BadRequestException {
        if (StringUtils.isBlank(keyword) || StringUtils.isBlank(target)) {
            throw new BadRequestException(ErrorCode.ErrorParameters, "参数错误");
        }
        newsService.mergeKerword(keyword, target);
        return showMergeKeyword(inv, "操作成功");
    }

    /**
     * 给关键字关注度加一
     */
    @Get("keyword/{keywordId:[0-9]+}/vote/hot")
    @Post("keyword/{keywordId:[0-9]+}/vote/hot")
    public String voteKeywordHot(Invocation inv, @Param("keywordId") long keywordId) throws BadRequestException, JSONException,
                                                                                    UnsupportedEncodingException {
        if (keywordId <= 0) {
            throw new BadRequestException(ErrorCode.ErrorParameters, "参数错误");
        }
        boolean canVote = true;
        User host = hostHolder.getHost();
        if (host != null) {
            canVote = newsService.followKeyword(host.getUserId(), keywordId);
        } else {
            if (NewsUtils.checkVoteKeywordCookie(inv, keywordId)) {
                return "r:/keyword/" + keywordId + "/news?newTime=0&limit=30";
            }
        }
        if (canVote) {
            newsService.voteKeywordHot(keywordId);
            NewsUtils.appendVoteKeywordCookie(inv, keywordId);
        }
        return "r:/keyword/" + keywordId + "/news?newTime=0&limit=30";
    }

    @Get("user/{userId:[0-9]+}/unfollow")
    public String unfollowKeyword(Invocation inv, @Param("userId") long userId, @Param("keywordId") long keywordId) {
        newsService.unfollowKeyword(userId, keywordId);
        return "r:/keyword/" + keywordId + "/news?newTime=0&limit=30";
    }

    /**
     * 给事件投票“真实”
     */
    @Get("news/{newsId:[0-9]+}/vote/truth")
    public String voteNewsTruth(Invocation inv, @Param("newsId") long newsId) throws BadRequestException, JSONException,
                                                                             UnsupportedEncodingException {
        if (newsId <= 0) {
            throw new BadRequestException(ErrorCode.ErrorParameters, "参数错误");
        }
        if (NewsUtils.checkVoteNewsCookie(inv, newsId)) {
            return "r:/news/" + newsId;
        }
        newsService.updateNewsTruth(newsId, 1);
        NewsUtils.appendVoteNewsCookie(inv, newsId);
        return "r:/news/" + newsId;
    }

    /**
     * 给事件投票“谣传”
     */
    @Get("news/{newsId:[0-9]+}/vote/fake")
    public String voteNewsFake(Invocation inv, @Param("newsId") long newsId) throws BadRequestException, JSONException,
                                                                            UnsupportedEncodingException {
        if (newsId <= 0) {
            throw new BadRequestException(ErrorCode.ErrorParameters, "参数错误");
        }
        if (NewsUtils.checkVoteNewsCookie(inv, newsId)) {
            return "r:/news/" + newsId;
        }
        newsService.updateNewsFake(newsId, 1);
        NewsUtils.appendVoteNewsCookie(inv, newsId);
        return "r:/news/" + newsId;
    }

    @Get("message")
    public String showMessageBoard(Invocation inv, @Param("msgId") long msgId) {
        List<Message> list = newsService.getMessages(msgId, 50);
        inv.addModel("messages", list);
        inv.addModel("active", "message");
        return "messageboard";
    }

    /**
     * 网站留言板留言
     */
    @Post("message")
    public String insertMessage(Invocation inv, @Param("userId") long userId, @Param("name") String name, @Param("content") String content) {
        if (StringUtils.isNotBlank(content)) {
            name = StringUtils.defaultIfBlank(name, "匿名");
            newsService.insertMsg(userId, name, content);
            inv.addModel("msg", "提交成功，3Q~");
        } else {
            inv.addModel("msg", "啥都不写可不行");
        }
        List<Message> list = newsService.getMessages(0, 50);
        inv.addModel("messages", list);
        inv.addModel("active", "message");
        return "messageboard";
    }

    @Get("news/{newsId:[0-9]+}/edit/content")
    @LoginRequired
    public String showEditNewsContent(Invocation inv, @Param("newsId") long newsId, @Param("msg") String msg,
        @Param("msgType") String msgType) {
        if (StringUtils.isBlank(msg)) {
            msgType = "info";
        } else {
            msgType = StringUtils.defaultString(msgType, "success");
        }
        News news = newsService.getOneNewsById(newsId);
        long newsTime = news.getNewsTime();
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(newsTime);
        String newsTimeStr = format.format(cal.getTime());
        inv.addModel("newsTimeStr", newsTimeStr);
        inv.addModel("news", news);
        inv.addModel("msg", StringUtils.defaultString(msg));
        inv.addModel("active", "keywords");
        inv.addModel("msgType", msgType);
        return "editnewscontent";
    }

    @Post("news/{newsId:[0-9]+}/edit/content")
    @LoginRequired
    public String editNewsContent(Invocation inv, @Param("newsId") long newsId, @Param("url") String url, @Param("title") String title,
        @Param("content") String content, @Param("day") String dayStr, @Param("second") String secondStr,
        @Param("datedesc") String newsTimeDesc, @Param("timepoint") String timePoint, @Param("datetype") String dateType) {
        if (StringUtils.isBlank(title) || StringUtils.isBlank(content)) {
            return "r:/news/" + newsId + "/edit/content?msg=“标题”和“事件摘要”都不能为空&msgType=error";
        }
        url = StringUtils.defaultString(url);
        String newTimeStr = "";
        if ("exact".equals(dateType)) {
            if (StringUtils.isBlank(dayStr)) {
                return "r:/news/" + newsId + "/edit/content?msg=“年月日”不能为空&msgType=error";
            }
            newTimeStr = dayStr + " " + secondStr;
            newTimeStr = newTimeStr.replace('：', ':');
            newsTimeDesc = "";
        } else if ("approximate".equals(dateType)) {
            newTimeStr = timePoint;
            newsTimeDesc = StringUtils.defaultIfBlank(newsTimeDesc, "");
            if (StringUtils.isBlank(newsTimeDesc)) {
                return "r:/news/" + newsId + "/edit/content?msg=时间描述不能为空&msgType=error";
            }
        } else {
            return "r:/news/" + newsId + "/edit/content?msg=时间输入错误&msgType=error";
        }
        try {
            long newsTime = format.parse(newTimeStr).getTime();
            newsService.updateNewsContent(newsId, title, content, url, newsTime, newsTimeDesc);
        } catch (ParseException e) {
            return "r:/news/" + newsId + "/edit/content?msg=时间输入错误&msgType=error";
        }
        return "r:/news/" + newsId;
    }

    @Get("news/{newsId:[0-9]+}/edit/keyword")
    @LoginRequired
    public String showEditNewsKeywords(Invocation inv, @Param("newsId") long newsId) {
        List<Keyword> keywords = newsService.getKeywordsByNewsId(newsId);
        inv.addModel("keywords", keywords);
        inv.addModel("newsId", newsId);
        return "editnewskeyword";
    }

    @Get("news/{newsId:[0-9]+}/edit/keyword/{keywordId:[0-9]+}/delete")
    @LoginRequired
    public String deleteKeyword(Invocation inv, @Param("newsId") long newsId, @Param("keywordId") long keywordId) {
        newsService.deleteKeywordFromNews(newsId, keywordId);
        newsService.deleteNewsFromKeyword(newsId, keywordId);
        return "r:/news/" + newsId + "/edit/keyword";
    }
}
