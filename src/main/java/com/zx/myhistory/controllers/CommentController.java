
package com.zx.myhistory.controllers;

import com.zx.myhistory.model.HostHolder;
import com.zx.myhistory.service.CommentService;

import net.paoding.rose.web.annotation.Param;
import net.paoding.rose.web.annotation.Path;
import net.paoding.rose.web.annotation.rest.Get;
import net.paoding.rose.web.annotation.rest.Post;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

@Path("")
public class CommentController {

    @Autowired
    private HostHolder hostHolder;

    @Autowired
    private CommentService commentService;

    @Post("comment")
    public String comment(@Param("newsId") long newsId, @Param("userId") long userId, @Param("userName") String userName,
        @Param("userIcon") String userIcon, @Param("content") String content) {
        if (StringUtils.isBlank(userName)) {
            return "@你需要填写名字或者登陆";
        }
        userIcon = StringUtils.defaultIfBlank(userIcon, "");
        if (hostHolder.getHost() == null) {
            userId = 0;
        }
        commentService.insertComment(newsId, userId, userName, userIcon, content);
        return "r:/news/" + newsId;
    }

    @Get("comment/delete")
    public String deleteComment(@Param("newsId") long newsId, @Param("commentId") long commentId) {
        commentService.deleteComment(newsId, commentId);
        return "r:/news/" + newsId;
    }
}
