
package com.zx.myhistory.util;

import com.zx.myhistory.model.User;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

public class CacheUtils {
    private static Cache ticketCache = CacheManager.create().getCache("ticket-host");// TODO 如果将来要多机器部署，需要替换成memcached
    private static Cache userCache = CacheManager.create().getCache("user");

    public static void cacheHostid(String ticket, long userId) {
        Element element = new Element(ticket, userId);
        ticketCache.put(element);
    }

    public static long getHostid(String ticket) {
        Element idElement = ticketCache.get(ticket);
        return idElement == null ? 0 : (Long) idElement.getObjectValue();
    }

    public static void deleteHostidCache(String ticket) {
        ticketCache.remove(ticket);
    }

    public static void cacheUser(long userId, User user) {
        Element element = new Element(userId, user);
        userCache.put(element);
    }

    public static User getUser(long userId) {
        Element userElement = userCache.get(userId);
        return userElement == null ? null : (User) userElement.getObjectValue();
    }

    public static void deleteUserCache(long userId) {
        userCache.remove(userId);
    }
}
