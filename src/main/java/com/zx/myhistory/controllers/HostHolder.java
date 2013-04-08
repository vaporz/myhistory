
package com.zx.myhistory.controllers;

import com.zx.myhistory.model.User;

import net.paoding.rose.web.Invocation;
import net.paoding.rose.web.InvocationLocal;

import org.springframework.beans.factory.annotation.Autowired;

public class HostHolder {
    @Autowired
    InvocationLocal inv;

    public User getHost() {
        Invocation inv1 = this.inv.getCurrent(false);
        if (inv1 != null) {
            return (User) inv1.getRequest().getAttribute("host");
        }
        return null;
    }

    public void setHost(User host) {
        inv.getRequest().setAttribute("host", host);
    }

}
