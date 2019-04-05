package com.hrbhd.bady.util;

import java.net.URL;
import java.text.ParseException;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.chainsaw.Main;
import org.apache.xmlbeans.impl.xb.xsdschema.impl.PublicImpl;
import org.aspectj.weaver.patterns.ThisOrTargetAnnotationPointcut;
import org.junit.Test;
import org.springframework.scripting.config.ScriptingDefaultsParser;


public class TimeUtil {
	
	
	public static void main(String[] args){
		
		System.out.println(getCurrentDay());
		
	}
	
	
	/**
	 * 根据毫秒值获取日期格式.
	 * @return
	 */
	public static String getTimeFormat(long time){
		Date date = new Date(time);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String time_format = dateFormat.format(date);
		return time_format;
	}

	/**
	 * 获取指定日期格式的日期字符串,精确到秒
	 * @return
	 */
	public static String getCurrentTime(){
		long l = System.currentTimeMillis();
		Date date = new Date(l);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = dateFormat.format(date);
		return time;
	}
	/**
	 * 获取指定日期格式的日期字符串,精确到天
	 * @return
	 */
	public static String getCurrentDay(){
		long l = System.currentTimeMillis();
		Date date = new Date(l);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String day = dateFormat.format(date);
		return day;
	}
	/**
	 * 获取当前年份
	 * @return
	 */
	public static int getCurrentYear(){
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		int year = calendar.get(Calendar.YEAR);
		return year;
	}
	/**
	 * 获取当前日期中的日
	 * @return
	 */
	public static String getCurrentOneDay(){
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		int day = calendar.get(Calendar.DAY_OF_MONTH);
		return day+"";
	}
	/**
	 * 获取指定日期格式的毫秒值
	 * @param date
	 * @return
	 */
	public static long getTimeStamp(String date){
		if(!StringUtils.isNotBlank(date)){
			return -1;
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date parse;
		long timeStamp = -1;
		try {
			parse = format.parse(date);
			timeStamp = parse.getTime();
			System.out.println(timeStamp);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return timeStamp;
	}
	/**
	 *获取当前日期,精确到天 
	 * @param TimeStamp
	 * @return
	 */
	public static String getTimeDate(String TimeStamp){
		long time = Long.parseLong(TimeStamp);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(time);
		String timeDate = format.format(date);
		System.out.println(timeDate);
		return timeDate;
	}
	
	/**
	 * 获取指定字符串的date对象
	 * @param TimeStamp
	 * @return
	 */
	public static java.sql.Date getDate(String TimeStamp){
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = format.parse(TimeStamp);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		java.sql.Date date2 = new java.sql.Date(date.getTime());
		return date2;
	}
	
	
	/**
	 * 获取当前月第一天是星期几
	 * */
	/*public static int getOneDayToWeek(){
		
		Date date = new Date(System.currentTimeMillis());
        //String[] weeks = {"星期日","星期一","星期二","星期三","星期四","星期五","星期六"};  
        Calendar calendar = Calendar.getInstance();  
        calendar.setTime(date);  
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        int week_index = calendar.get(Calendar.DAY_OF_WEEK) - 1; 
        if(week_index<0){  
            week_index = 0;  
        } 
        return week_index;
	}*/
	
	/**
	 * 获取某天是星期几,返回的是汉子
	 * */
	public static String getWhereDayWhereMonthToWeekForChina(String date1){
		
		Date date = new Date(getTimeStamp(date1));
        String[] weeks = {"日","一","二","三","四","五","六"};  
        Calendar calendar = Calendar.getInstance();  
        calendar.setTime(date);  
        //calendar.set(Calendar.DAY_OF_MONTH, 1);
        int week_index = calendar.get(Calendar.DAY_OF_WEEK) - 1; 
        if(week_index<0){  
            week_index = 0;  
        } 
        return weeks[week_index];
	}
	
	/**
	 * 获取某天是星期几,返回的是数字
	 * */
	public static int getWhereDayWhereMonthToWeek(String date1){
		
		Date date = new Date(getTimeStamp(date1));
        //String[] weeks = {"星期日","星期一","星期二","星期三","星期四","星期五","星期六"};  
        Calendar calendar = Calendar.getInstance();  
        calendar.setTime(date);  
        //calendar.set(Calendar.DAY_OF_MONTH, 1);
        int week_index = calendar.get(Calendar.DAY_OF_WEEK) - 1; 
        if(week_index<0){  
            week_index = 0;  
        } 
        return week_index;
	}
	
	/**
	 * 获取当前日期对应的星期
	 * @return
	 */
	public static String getCurrentWeek(){
		
		Date date = new Date(System.currentTimeMillis());
        String[] weeks = {"日","一","二","三","四","五","六"};  
        Calendar calendar = Calendar.getInstance();  
        calendar.setTime(date);  
        //calendar.set(Calendar.DAY_OF_MONTH, 1);
        int week_index = calendar.get(Calendar.DAY_OF_WEEK)-1; 
        if(week_index<0){  
            week_index = 0;  
        } 
        return weeks[week_index];
	}
	
	/** 
	 * 取得当月天数 
	 * */  
	public static int getCurrentMonthLastDay()  
	{  
	    Calendar calendar = Calendar.getInstance();  
	    calendar.set(Calendar.DATE, 1);//把日期设置为当月第一天  
	    calendar.roll(Calendar.DATE, -1);//日期回滚一天，也就是最后一天  
	    int maxDate = calendar.get(Calendar.DATE);  
	    return maxDate;  
	}
	
	/** 
	 * 得到指定月的天数 
	 * */  
	public static int getMonthLastDay(int year, int month)  
	{  
	    Calendar calendar = Calendar.getInstance();  
	    calendar.set(Calendar.YEAR, year);  
	    calendar.set(Calendar.MONTH, month - 1);  
	    calendar.set(Calendar.DATE, 1);//把日期设置为当月第一天  
	    calendar.roll(Calendar.DATE, -1);//日期回滚一天，也就是最后一天  
	    int maxDate = calendar.get(Calendar.DATE);  
	    return maxDate;  
	} 
	
	/**
	 * 获取当前月份
	 **/
	public static int getCurrentMonth(){
		
		Calendar calendar = Calendar.getInstance();
		int month = calendar.get(Calendar.MONTH)+1;
		return month;
		
	}
	
	public static int getDayDifference(String time1, String time2){
		
		long timeStamp1 = TimeUtil.getTimeStamp(time1)/1000;
		long timeStamp2 = TimeUtil.getTimeStamp(time2)/1000;
		
		long i = timeStamp2-timeStamp1;
		i = i/86640;
		
		return (int)i;
	}
	
	/**
	 * 暂时不用
	 * @return
	 */
	/*public static long getTimeStamp(){
		 SimpleDateFormat format =  new SimpleDateFormat("yyyy-MM-dd");  
		 String time="1970-01-06";  
		 Date date;
		 long times=0;
		try {
			date = format.parse(time);
			System.out.print("Format To times:"+date.getTime());
			times = date.getTime();
		} catch (ParseException e) {
			e.printStackTrace();
		}  
		 return times;
	}*/
	
	
	public static long getVacationDay(String start_time,String end_time){
		
		long timeStamp1 = getTimeStamp(start_time);
		long timeStamp2 = getTimeStamp(end_time);
		Long time = (timeStamp2-timeStamp1)/(long)86400000;
		
		return time;
		
	}
	
	
}
