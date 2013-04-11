
package com.zx.myhistory.util;

import net.paoding.rose.web.Invocation;

import org.apache.commons.lang.StringUtils;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NewsUtils {
    private static final String TICKET_TOKEN = "hj2&)(HJ@H3ihfgd5jh4hG&94u5jy45#";

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

    public static String getAcceptedLocale(String locale) {
        String result = locale;
        // 如果不是目前接受的语言，就设置为默认语言
        if (StringUtils.isBlank(locale) || !acceptLocales.contains(locale)) {
            result = System.getProperty("locale.default", "zh");
        }
        return result;
    }

    public static String getLoginTicket(long id) {
        return getMd5Digest(id + TICKET_TOKEN);
    }

    public static String getMd5Digest(String pInput) {
        try {
            MessageDigest lDigest = MessageDigest.getInstance("MD5");
            lDigest.update(pInput.getBytes());
            BigInteger lHashInt = new BigInteger(1, lDigest.digest());
            return String.format("%1$032X", lHashInt);
        } catch (NoSuchAlgorithmException lException) {
            throw new RuntimeException(lException);
        }
    }

    /**
     * 得到msgKey对应的语言文案
     */
    public static String getGlobalizedMsg(Invocation inv, String msgKey, String locale) {
        return inv.getApplicationContext().getMessage(msgKey, null, new Locale(locale));
    }

    /**
     * 得到根据path指定的视图文件渲染而来的内容<br>
     * 注意：必须用{@link HttpServletRequest#setAttribute(String, Object)}设置参数
     * 
     * @param request
     * @param response
     * @param path 可以用相对路径，或者以“/”开头，从根路径指定视图文件
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public static String getHtmlContent(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException,
                                                                                                              IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher(path);
        AppResponseWrapper wrapper = new AppResponseWrapper(response);
        dispatcher.include(request, wrapper);
        return wrapper.getResult();
    }

    /**
     * 将一个以毫秒为单位的时间转化为如下格式：<br>
     * 刚刚<br>
     * xx分钟前<br>
     * xx小时前<br>
     * xx天前<br>
     * 2011-11-11 11:11:11
     * 
     * @param now 当前时间的毫秒数（System.currentTimeMillis()）
     * @param time 将被转化成字符串的时间，单位是毫秒
     * @return
     */
    // TODO 多语言支持
    public static String getTimeDescription(long now, long time) {
        String msg = "";
        if (now - time < 2 * 60 * 1000) {
            msg = "刚刚";
        } else if (now - time < 60 * 60 * 1000) {
            msg = ((now - time) / (1000 * 60)) + "分钟前";
        } else if (now - time < 24 * 60 * 60 * 1000) {
            msg = ((now - time) / (1000 * 60 * 60)) + "小时前";
        } else if (now - time < 14 * 24 * 60 * 60 * 1000) {
            msg = ((now - time) / (24 * 1000 * 60 * 60)) + "天前";
        } else {
            msg = getFormatDateTime(new Date(time));
        }
        return msg;
    }

    private static String getFormatDateTime(java.util.Date currDate) {
        SimpleDateFormat dtFormatdB = null;
        try {
            dtFormatdB = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            return dtFormatdB.format(currDate);
        } catch (Exception e) {
        }
        return "";
    }

    public static String parseRawLocale(HttpServletRequest request) {
        String locale = request.getLocale().toString().toLowerCase();
        // 中文分为繁体"zh_tw"和简体"zh"
        locale = locale.equals("zh_tw") ? "zh_tw" : locale;
        int index = locale.indexOf("_");
        if (index != -1) {
            locale = locale.substring(0, index);
        }
        return locale;
    }
}
