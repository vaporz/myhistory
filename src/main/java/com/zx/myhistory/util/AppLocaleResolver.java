
package com.zx.myhistory.util;

import org.springframework.web.servlet.LocaleResolver;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AppLocaleResolver implements LocaleResolver {

    @Override
    public Locale resolveLocale(HttpServletRequest request) {
        Locale locale = (Locale) request.getAttribute("locale");
        if (locale == null) {
            return request.getLocale();
        } else {
            return locale;
        }
    }

    @Override
    public void setLocale(HttpServletRequest request, HttpServletResponse response, Locale locale) {
        request.setAttribute("locale", locale);
    }

}
