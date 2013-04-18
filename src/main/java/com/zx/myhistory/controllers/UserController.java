package com.zx.myhistory.controllers;

import com.zx.myhistory.model.UserKeyword;
import com.zx.myhistory.service.NewsService;
import com.zx.myhistory.util.LoginRequired;

import net.paoding.rose.web.Invocation;
import net.paoding.rose.web.annotation.Param;
import net.paoding.rose.web.annotation.Path;
import net.paoding.rose.web.annotation.rest.Get;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Path("")
@LoginRequired
public class UserController {

    private Log logger = LogFactory.getLog(UserController.class);
    @Autowired
    private NewsService newsService;
    
    /**
     * 列出我订阅关键字的变化
     */
    @Get("user/{userId:[0-9]+}/feeds")
    public String showMyFeeds(Invocation inv, @Param("userId") long userId) {
        List<UserKeyword> keywords = newsService.getUserKeywords(userId);
        inv.addModel("keywords", keywords);
        return "myfeeds";
    }

    /**
     * 显示用户信息
     */
    @Get("user/{userId:[0-9]+}/info")
    public String showUserInfo() {
        return "userinfo";
    }

    /**
     * 修改密码
     */
    public String updatePassword() {
        return "userinfo";
    }
    
    /**
     * 显示我贡献的keyword
     */
    public String showMyKeywords() {
        return "";
    }
    
}
