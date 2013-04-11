
package com.zx.myhistory.model;

import net.paoding.rose.web.Invocation;
import net.paoding.rose.web.InvocationLocal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
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

    // public String getLocale() {
    // return (String) inv.getRequest().getAttribute("locale");
    // }
    //
    // public void setLocale(String locale) {
    // inv.getRequest().setAttribute("locale", locale);
    // }
}
