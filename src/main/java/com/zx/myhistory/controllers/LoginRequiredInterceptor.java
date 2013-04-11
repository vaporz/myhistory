
package com.zx.myhistory.controllers;

import com.zx.myhistory.biz.NewsBiz;
import com.zx.myhistory.model.HostHolder;
import com.zx.myhistory.model.User;
import com.zx.myhistory.util.CacheUtils;
import com.zx.myhistory.util.CookieManager;
import com.zx.myhistory.util.LoginRequired;

import net.paoding.rose.web.ControllerInterceptorAdapter;
import net.paoding.rose.web.Invocation;
import net.paoding.rose.web.annotation.Interceptor;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import java.lang.annotation.Annotation;

@Interceptor(oncePerRequest = true)
public class LoginRequiredInterceptor extends ControllerInterceptorAdapter {

    private static final Logger LOGGER = Logger.getLogger(LoginRequiredInterceptor.class);
    @Autowired
    private HostHolder hostHolder;
    @Autowired
    private NewsBiz newsBiz;

    // 覆盖这个方法，表示只有标注@LoginRequired的控制器或方法才会被此拦截器拦截
    @Override
    public Class<? extends Annotation> getRequiredAnnotationClass() {
        return LoginRequired.class;
    }

    @Override
    public int getPriority() {
        return 10000;// 值大的优先
    }

    @Override
    public Object before(Invocation inv) throws Exception {
        String ticket = CookieManager.getInstance().getCookie(inv.getRequest(), "ticket");
        if (StringUtils.isBlank(ticket)) {
            LOGGER.info("token is blank");
            return "r:/login";
        }
        long hostId = CacheUtils.getHostid(ticket);
        if (hostId <= 0) {
            LOGGER.info("host is null");
            return "r:/login";
        }
        User host = newsBiz.getUserById(hostId);
        if (host == null) {
            return "r:/login";
        }
        hostHolder.setHost(host);
        // hostHolder.setLocale(NewsUtils.getAcceptedLocale(host.getLocale()));
        CacheUtils.cacheHostid(ticket, hostId);
        return true;
    }
}
