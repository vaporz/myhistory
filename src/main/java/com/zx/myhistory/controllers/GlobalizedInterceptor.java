
package com.zx.myhistory.controllers;

import com.zx.myhistory.biz.NewsBiz;
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
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.LocaleResolver;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.Properties;

/**
 * 国际化的拦截器
 * 
 * @author zhangxiao
 */
@Interceptor(oncePerRequest = true)
public class GlobalizedInterceptor extends ControllerInterceptorAdapter {

    private static final String FILE_NAME = "globalized.properties";
    private static List<String> acceptLocales = new ArrayList<String>();

    static {
        Properties properties = System.getProperties();
        try {
            Resource res = new ClassPathResource(FILE_NAME);
            properties.load(res.getInputStream());
            System.setProperties(properties);
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (!StringUtils.isBlank(System.getProperty("locale.accept", ""))) {
            String[] locales = System.getProperty("locale.accept").split(",");
            acceptLocales = Arrays.asList(locales);
        }
    }

    protected final Log logger = LogFactory.getLog(getClass());

    @Autowired
    protected HostHolder hostHolder;

    @Autowired
    private NewsBiz newsBiz;

    public String getLocale(Invocation inv) {
        String locale = NewsUtils.parseRawLocale(inv.getRequest());
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
        // 如果不是目前接受的语言，就设置为默认语言
        if (!acceptLocales.contains(locale)) {
            locale = System.getProperty("locale.default", "zh");
        }
        return locale;
    }

    public GlobalizedInterceptor() {
        setPriority(9980);
    }

    @Override
    public Object before(Invocation inv) throws Exception {
        logger.debug("Entry GlobalizedInterceptor!");
        LocaleResolver localeResolver = (LocaleResolver) inv.getApplicationContext().getBean("roseLocaleResolver");
        if (localeResolver != null) {
            localeResolver.setLocale(inv.getRequest(), inv.getResponse(), new Locale(getLocale(inv)));
            inv.getRequest().setAttribute(DispatcherServlet.LOCALE_RESOLVER_ATTRIBUTE, localeResolver);
        }
        logger.debug("Exit GlobalizedInterceptor!");
        return true;
    }
}
