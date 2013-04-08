
package com.zx.myhistory.controllers;

import net.paoding.rose.web.ControllerErrorHandler;
import net.paoding.rose.web.Invocation;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.io.PrintWriter;
import java.io.StringWriter;

public class ErrorHandler implements ControllerErrorHandler {

    private static Log logger = LogFactory.getLog(ErrorHandler.class);

    public Object onError(Invocation inv, Throwable ex) throws Throwable {
        logger.error("handle err:", ex);
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        ex.printStackTrace(pw);
        inv.getRequest().setAttribute("errorInfo", sw.toString());
        return "error";
    }

}
