package com.ticketcenter.util;

import sun.misc.BASE64Encoder;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by baron.wei on 2017/3/22.
 */
public class MD5Utils {

    /**
     *
     * @param plainText
     * @return
     */
    public static String EncoderByMd5(String plainText) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        MessageDigest md5=MessageDigest.getInstance("MD5");
        BASE64Encoder base64en = new BASE64Encoder();
        //加密后的字符串
        return base64en.encode(md5.digest(plainText.getBytes("utf-8")));
    }


    /*public static void main(String[] args) {
        try {
            System.out.println(EncoderByMd5("aaa111"));
            char data[] = {'s', 'g', 'k'};
            //System.out.println(EncoderByMd5("2"));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

    }*/


}
