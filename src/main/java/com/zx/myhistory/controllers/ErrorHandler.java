
package com.zx.myhistory.controllers;

import net.paoding.rose.web.ControllerErrorHandler;
import net.paoding.rose.web.Invocation;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class ErrorHandler implements ControllerErrorHandler {

    private static Log logger = LogFactory.getLog(ErrorHandler.class);

    public Object onError(Invocation inv, Throwable ex) throws Throwable {
        logger.error("handle err:", ex);
        inv.getRequest().setAttribute("errorInfo", ex.getMessage());
        return "error";
    }

}
