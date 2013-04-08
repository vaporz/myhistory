
package com.zx.myhistory.util;

import java.io.CharArrayWriter;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

/**
 * 类说明
 * 
 * @author 张啸 (zhangxiao@xiaomi.com):
 * @version 创建时间：Nov 17, 2011 2:29:31 PM
 */
public class AppResponseWrapper extends HttpServletResponseWrapper {

    private PrintWriter cachedWriter;
    private CharArrayWriter bufferedWriter;

    public AppResponseWrapper(HttpServletResponse response) {
        super(response);
        // 保存返回结果
        bufferedWriter = new CharArrayWriter();
        // 包装PrintWriter，让所有结果通过这个PrintWriter写入到bufferedWriter中
        cachedWriter = new PrintWriter(bufferedWriter);
    }

    @Override
    public PrintWriter getWriter() {
        return cachedWriter;
    }

    /**
     * 获取原始的HTML页面内容。
     * 
     * @return
     */
    public String getResult() {
        return bufferedWriter.toString();
    }
}
