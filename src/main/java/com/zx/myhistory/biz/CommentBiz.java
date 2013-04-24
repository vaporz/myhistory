
package com.zx.myhistory.biz;

import com.zx.myhistory.dao.CommentDAO;
import com.zx.myhistory.model.Comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentBiz {
    @Autowired
    private CommentDAO commentDAO;

    public void insertComment(long newsId, long userId, String userName, String userIcon, String content, long createTime) {
        long commentId = commentDAO.getAndIncrCommentId();
        commentDAO.insertComment(commentId, newsId, userId, userName, userIcon, content, createTime);
    }

    public List<Comment> getComments(long newsId, long createTime, int limit) {
        return commentDAO.getComments(newsId, createTime, limit);
    }

    public void deleteComment(long newsId, long commentId) {
        commentDAO.deleteComment(newsId, commentId);
    }
}
