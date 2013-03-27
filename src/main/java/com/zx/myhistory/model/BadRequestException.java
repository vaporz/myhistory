
package com.zx.myhistory.model;

public class BadRequestException extends Exception {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    public BadRequestException(int code, String message) {
        this.code = code;
        this.message = message;
    }

    private int code;
    private String message;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
