
package com.zx.myhistory.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class NewsUtils {

    private static final String TICKET_TOKEN = "hj2&)(HJ@H3ihfgd5jh4hG&94u5jy45#";

    public static String getLoginTicket(long id) {
        return getMd5Digest(id + TICKET_TOKEN);
    }

    public static String getMd5Digest(String pInput) {
        try {
            MessageDigest lDigest = MessageDigest.getInstance("MD5");
            lDigest.update(pInput.getBytes());
            BigInteger lHashInt = new BigInteger(1, lDigest.digest());
            return String.format("%1$032X", lHashInt);
        } catch (NoSuchAlgorithmException lException) {
            throw new RuntimeException(lException);
        }
    }
}
