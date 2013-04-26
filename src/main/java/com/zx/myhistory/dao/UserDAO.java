package com.zx.myhistory.dao;

import com.zx.myhistory.model.User;

import net.paoding.rose.jade.annotation.DAO;
import net.paoding.rose.jade.annotation.ReturnGeneratedKeys;
import net.paoding.rose.jade.annotation.SQL;
import net.paoding.rose.jade.annotation.SQLParam;

@DAO
public interface UserDAO {

    @SQL("INSERT INTO user_id_index ()VALUES()")
    @ReturnGeneratedKeys
    public Long getUserId();

    @SQL("INSERT INTO user (user_id, pwd, name, icon, email, locale, create_time)VALUES(:userId, :pwd, :name, :icon, :email, :locale, :createTime)")
    public void registerUser(@SQLParam("userId") long userId, @SQLParam("pwd") String pwd, @SQLParam("name") String name,
        @SQLParam("icon") String icon, @SQLParam("email") String email, @SQLParam("locale") String locale,
        @SQLParam("createTime") long createTime);

    @SQL("SELECT user_id FROM user WHERE name=:userName")
    public Long getUserIdByName(@SQLParam("userName") String userName);

    @SQL("SELECT user_id FROM user WHERE name=:userName AND pwd=:pwd")
    public Long getUserIdByNameAndPwd(@SQLParam("userName") String userName, @SQLParam("pwd") String pwd);

    @SQL("SELECT user_id, name, icon, email, credit, locale, create_time FROM user WHERE user_id=:userId")
    public User getUserById(@SQLParam("userId") long userId);
}
