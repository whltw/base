package com.tw.bear.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class StringUtil {
    /**
     * 返回指定的日期字符串
     * @param date
     * @param formatter
     * @return
     */
    public static String getFormatterData(Date date, String formatter){
        SimpleDateFormat sdf = new SimpleDateFormat(formatter);
        return sdf.format(date);
    }


    /**
     * 返回yyyy-MM-dd HH:mm:ss格式的日期字符串
     * @param date
     * @return
     */
    public static String getFormatterData(Date date){
        return getFormatterData(date,"yyyy-MM-dd HH:mm:ss");
    }
}
