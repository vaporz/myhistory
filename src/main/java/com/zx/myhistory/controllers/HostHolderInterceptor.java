
package com.zx.myhistory.controllers;

import com.zx.myhistory.biz.NewsBiz;
import com.zx.myhistory.model.HostHolder;
import com.zx.myhistory.model.User;
import com.zx.myhistory.util.CacheUtils;
import com.zx.myhistory.util.CookieManager;

import net.paoding.rose.web.ControllerInterceptorAdapter;
import net.paoding.rose.web.Invocation;
import net.paoding.rose.web.annotation.Interceptor;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

@Interceptor(oncePerRequest = true)
public class HostHolderInterceptor extends ControllerInterceptorAdapter {

    @Autowired
    private HostHolder hostHolder;
    @Autowired
    private NewsBiz newsBiz;

    @Override
    public int getPriority() {
        return 9990;// 值大的优先
    }

    @Override
    public Object before(Invocation inv) throws Exception {
        if (hostHolder.getHost() != null) {// 说明已经被loginrequired拦截过了
            return true;
        }
        String ticket = CookieManager.getInstance().getCookie(inv.getRequest(), "ticket");
        if (StringUtils.isBlank(ticket)) {
            return true;
        }
        long hostId = CacheUtils.getHostid(ticket);
        if (hostId <= 0) {
            return true;
        }
        User host = newsBiz.getUserById(hostId);
        hostHolder.setHost(host);
        return true;
    }
}