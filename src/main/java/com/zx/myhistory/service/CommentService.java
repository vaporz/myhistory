
package com.zx.myhistory.service;

import com.zx.myhistory.biz.CommentBiz;
import com.zx.myhistory.model.Comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    private CommentBiz commentBiz;

    public void insertComment(long newsId, long userId, String userName, String userIcon, String content) {
        commentBiz.insertComment(newsId, userId, userName, userIcon, content, System.currentTimeMillis());
    }

    public List<Comment> getComments(long newsId, long createTime, int limit) {
        createTime = createTime <= 0 ? Long.MAX_VALUE : createTime;
        limit = limit > 50 || limit <= 0 ? 50 : limit;
        return commentBiz.getComments(newsId, createTime, limit);
    }

    public void deleteComment(long newsId, long commentId) {
        commentBiz.deleteComment(newsId, commentId);
    }
}
