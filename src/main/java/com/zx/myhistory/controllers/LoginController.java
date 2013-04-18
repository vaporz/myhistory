
package com.zx.myhistory.controllers;

import com.zx.myhistory.model.BadRequestException;
import com.zx.myhistory.model.BizException;
import com.zx.myhistory.model.ErrorCode;
import com.zx.myhistory.model.User;
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
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

@Path("")
public class LoginController {

    private Log logger = LogFactory.getLog(LoginController.class);

    @Autowired
    private NewsService newsService;

    @Get("login")
    public String showLogin(Invocation inv, String msg, String msgType) {
        if (StringUtils.isBlank(msg)) {
            msgType = "info";
        } else {
            msgType = StringUtils.defaultString(msgType, "success");
        }
        inv.addModel("msg", StringUtils.defaultString(msg, "请输入用户名和密码"));
        inv.addModel("active", "login");
        inv.addModel("msgType", msgType);
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
            User user = newsService.getUserById(userId);
            CookieManager.getInstance().saveCookie(inv.getResponse(), "locale", user.getLocale(), -1, "/", ".test.com");
            CacheUtils.cacheHostid(ticket, userId);
            return "r:/keywords";
        } else {
            return showLogin(inv, "用户名或密码错误", "error");
        }
    }

    @Get("register")
    public String showRegister(Invocation inv, String msg, String msgType) {
        if (StringUtils.isBlank(msg)) {
            msgType = "info";
        } else {
            msgType = StringUtils.defaultString(msgType, "success");
        }
        inv.addModel("msg", msg);
        inv.addModel("msgType", msgType);
        inv.addModel("active", "register");
        return "register";
    }

    @Post("register")
    public String register(Invocation inv, @Param("name") String name, @Param("pwd") String pwd, @Param("pwd2") String pwd2,
        @Param("email") String email) throws BadRequestException {
        if (StringUtils.isBlank(name) || StringUtils.isBlank(pwd)) {// TODO 前端也应该检查
            return showRegister(inv, "必填项不能为空", "error");
        }
        if (!StringUtils.equals(pwd, pwd2)) {
            return showRegister(inv, "密码输入不一致", "error");
        }
        try {
            String locale = NewsUtils.parseRawLocale(inv.getRequest());
            newsService.registerUser(pwd, name, email, locale);
        } catch (BizException e) {
            logger.error("registerError:", e);
            return showRegister(inv, "内部错误", "error");
        }
        return showLogin(inv, "注册成功！请登陆", "success");
    }

    @Get("logout")
    @Post("logout")
    public String logout(Invocation inv, @Param("userId") String userId) {
        String ticket = CookieManager.getInstance().getCookie(inv.getRequest(), "ticket");
        CacheUtils.deleteHostidCache(ticket);
        CookieManager.getInstance().clearCookie(inv.getResponse(), "ticket", -1, "/");
        return "r:/keywords";
    }
}
