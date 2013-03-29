
package com.zx.myhistory.controllers;

import net.paoding.rose.web.ControllerErrorHandler;
import net.paoding.rose.web.Invocation;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class ErrorHandler implements ControllerErrorHandler {

    private static Log logger = LogFactory.getLog(ErrorHandler.class);

    public Object onError(Invocation inv, Throwable ex) throws Throwable {
        logger.error("handle err:", ex);
        // 不是ajax则跳转到错误页面
        inv.getRequest().setAttribute("errorInfo", ex);
        return "error";
    }

}
