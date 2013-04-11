
package com.zx.myhistory.controllers;

import com.zx.myhistory.biz.NewsBiz;
import com.zx.myhistory.model.HostHolder;
import com.zx.myhistory.model.User;
import com.zx.myhistory.util.CacheUtils;
import com.zx.myhistory.util.CookieManager;
import com.zx.myhistory.util.NewsUtils;

import net.paoding.rose.web.ControllerInterceptorAdapter;
import net.paoding.rose.web.Invocation;
import net.paoding.rose.web.annotation.Interceptor;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.LocaleResolver;

import java.util.Locale;

/**
 * 国际化的拦截器
 * 
 * @author zhangxiao
 */
@Interceptor(oncePerRequest = true)
public class GlobalizedInterceptor extends ControllerInterceptorAdapter {

    protected final Log logger = LogFactory.getLog(getClass());

    @Autowired
    protected HostHolder hostHolder;

    @Autowired
    private NewsBiz newsBiz;

    public String getLocale(Invocation inv) {
        String locale = NewsUtils.parseRawLocale(inv.getRequest());
        String cookieLocale = CookieManager.getInstance().getCookie(inv.getRequest(), "locale");
        if (StringUtils.isNotBlank(cookieLocale)) {// 如果cookie里设置了locale就使用cookie中的
            // TODO 用户修改自己的locale时也要改一下cookie中的locale
            locale = cookieLocale;
        } else {// cookie里没有locale，尝试从user设置里取
            User host = hostHolder.getHost();
            if (host != null) {
                locale = host.getLocale();
            } else {
                String ticket = CookieManager.getInstance().getCookie(inv.getRequest(), "ticket");
                if (StringUtils.isNotBlank(ticket)) {
                    long hostId = CacheUtils.getHostid(ticket);
                    if (hostId > 0) {
                        host = newsBiz.getUserById(hostId);
                        if (host != null && StringUtils.isNotBlank(host.getLocale())) {
                            locale = host.getLocale();
                        }
                    }
                }
            }
        }
        return NewsUtils.getAcceptedLocale(locale);
    }

    public GlobalizedInterceptor() {
        setPriority(9980);
    }

    @Override
    public Object before(Invocation inv) throws Exception {
        logger.debug("Entry GlobalizedInterceptor!");
        String locale = getLocale(inv);
        LocaleResolver localeResolver = (LocaleResolver) inv.getApplicationContext().getBean("roseLocaleResolver");
        if (localeResolver != null) {
            localeResolver.setLocale(inv.getRequest(), inv.getResponse(), new Locale(locale));
            inv.getRequest().setAttribute(DispatcherServlet.LOCALE_RESOLVER_ATTRIBUTE, localeResolver);
        }
        // inv.addModel("locale", locale);
        logger.debug("Exit GlobalizedInterceptor!");
        return true;
    }
}
