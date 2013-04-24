
package com.zx.myhistory.dao;

import com.zx.myhistory.model.Comment;

import net.paoding.rose.jade.annotation.DAO;
import net.paoding.rose.jade.annotation.ReturnGeneratedKeys;
import net.paoding.rose.jade.annotation.SQL;
import net.paoding.rose.jade.annotation.SQLParam;

import java.util.List;

@DAO
public interface CommentDAO {
    @SQL("INSERT INTO news_comment (comment_id, news_id, user_id, user_name, user_icon, content, create_time)VALUES(:commentId, :newsId, :userId, :userName, :userIcon, :content, :createTime)")
    public void insertComment(@SQLParam("commentId") long commentId, @SQLParam("newsId") long newsId, @SQLParam("userId") long userId,
        @SQLParam("userName") String userName, @SQLParam("userIcon") String userIcon, @SQLParam("content") String content,
        @SQLParam("createTime") long createTime);

    @SQL("SELECT comment_id,news_id,user_id,user_name,user_icon,content,create_time FROM news_comment WHERE news_id=:newsId AND create_time<:createTime ORDER BY create_time DESC LIMIT :limit")
    public List<Comment> getComments(@SQLParam("newsId") long newsId, @SQLParam("createTime") long createTime, @SQLParam("limit") int limit);

    @SQL("DELETE FROM news_comment WHERE comment_id=:commentId")
    public void deleteComment(@SQLParam("newsId") long newsId, @SQLParam("commentId") long commentId);

    @SQL("INSERT INTO news_comment_id_index ()VALUES()")
    @ReturnGeneratedKeys
    public Long getAndIncrCommentId();
}
