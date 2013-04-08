
package com.zx.myhistory.util;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 要求登录的标签
 * 
 * @author xinyan
 */
@Inherited
@Target( {
    ElementType.TYPE, ElementType.METHOD
})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface LoginRequired {

}
