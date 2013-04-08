
package com.zx.myhistory.controllers;

import com.zx.myhistory.model.BadRequestException;
import com.zx.myhistory.model.BizException;
import com.zx.myhistory.model.ErrorCode;
import com.zx.myhistory.service.NewsService;
import com.zx.myhistory.util.CacheUtils;
import com.zx.myhistory.util.CookieManager;
import com.zx.myhistory.util.NewsUtils;

import net.paoding.rose.web.Invocation;
import net.paoding.rose.web.annotation.Param;
import net.paoding.rose.web.annotation.Path;
import net.paoding.rose.web.annotation.rest.Get;
import net.paoding.rose.web.annotation.rest.Post;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

@Path("")
public class LoginController {

    @Autowired
    private NewsService newsService;

    @Get("login")
    public String showLogin(Invocation inv, String msg) {
        msg = StringUtils.isBlank(msg) ? "请登陆" : msg;
        inv.addModel("msg", msg);
        return "login";
    }

    @Post("login")
    public String login(Invocation inv, @Param("name") String name, @Param("pwd") String pwd) throws BadRequestException {
        if (StringUtils.isBlank(name) || StringUtils.isBlank(pwd)) {
            throw new BadRequestException(ErrorCode.ErrorParameters, "wrong parameters");
        }
        long userId = newsService.getUserIdByNameAndPwd(name, pwd);
        if (userId > 0) {
            String ticket = NewsUtils.getLoginTicket(userId);
            CookieManager.getInstance().saveCookie(inv.getResponse(), "ticket", ticket, -1, "/", ".test.com");
            CacheUtils.cacheHostid(ticket, userId);
            return "r:/keywords";
        } else {
            return showLogin(inv, "用户名或密码错误");
        }
    }

    @Get("register")
    public String showRegister(Invocation inv, String msg) {
        inv.addModel("msg", msg);
        return "register";
    }

    @Post("register")
    public String register(Invocation inv, @Param("name") String name, @Param("pwd") String pwd, @Param("pwd2") String pwd2)
                                                                                                                            throws BadRequestException {
        if (StringUtils.isBlank(name) || StringUtils.isBlank(pwd)) {
            return showRegister(inv, "不能为空");
        }
        if (!StringUtils.equals(pwd, pwd2)) {
            return showRegister(inv, "密码输入不一致");
        }
        try {
            newsService.registerUser(pwd, name);
        } catch (BizException e) {
            return showRegister(inv, e.getMessage());
        }
        return showLogin(inv, "注册成功！请登陆");
    }

    @Get("logout")
    @Post("logout")
    public String logout(Invocation inv, @Param("userId") String userId) {
        String ticket = CookieManager.getInstance().getCookie(inv.getRequest(), "ticket");
        CacheUtils.deleteHostidCache(ticket);
        return "r:/keywords";
    }
}
