package com.ticketcenter.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Date Utils
 */
public class DateFormatTools {

    /**
     * @param date
     * @return  yyyy-MM-dd HH:mm:ss
     */
    public static String formatDateToString(Date date){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(date);
    }

    /**
     *
     * @param date
     * @return  yyyy-MM-dd
     */
    public static String formatDateToString1(Date date){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date);
    }


    /**
     *
     * @param date
     * @return  yyyyMMddHHmmss
     */
    public static String formatDateToString2(Date date){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        return sdf.format(date);
    }


    /**
     *
     * @param dateString yyyy.MM.dd
     * @return  Date
     */
    public static Date formateStringToDate(String dateString) {
        Date formateDate = null;
        SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
        try {
            formateDate = format.parse(dateString);
        } catch (Exception e) {
            return null;
        }
        return formateDate;
    }

    /**
     *
     * @param dateString yyyy-MM-dd
     * @return  Date
     */
    public static Date formateStringToDate1(String dateString) {
        Date formateDate = null;
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        try {
            formateDate = format.parse(dateString);
        } catch (Exception e) {
            return null;
        }
        return formateDate;
    }
}
