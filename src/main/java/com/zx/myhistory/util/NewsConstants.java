package com.zx.myhistory.util;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import java.io.IOException;
import java.util.Properties;

public class NewsConstants {
    private static final String FILE_NAME = "config.properties";
    static {
        Properties properties = System.getProperties();
        try {
            Resource res = new ClassPathResource(FILE_NAME);
            properties.load(res.getInputStream());
            System.setProperties(properties);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public static final String CookieDomain = System.getProperty("cookie_domain");
}
