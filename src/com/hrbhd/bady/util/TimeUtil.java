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
	 * ���ݺ���ֵ��ȡ���ڸ�ʽ.
	 * @return
	 */
	public static String getTimeFormat(long time){
		Date date = new Date(time);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String time_format = dateFormat.format(date);
		return time_format;
	}

	/**
	 * ��ȡָ�����ڸ�ʽ�������ַ���,��ȷ����
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
	 * ��ȡָ�����ڸ�ʽ�������ַ���,��ȷ����
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
	 * ��ȡ��ǰ���
	 * @return
	 */
	public static int getCurrentYear(){
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		int year = calendar.get(Calendar.YEAR);
		return year;
	}
	/**
	 * ��ȡ��ǰ�����е���
	 * @return
	 */
	public static String getCurrentOneDay(){
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		int day = calendar.get(Calendar.DAY_OF_MONTH);
		return day+"";
	}
	/**
	 * ��ȡָ�����ڸ�ʽ�ĺ���ֵ
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
	 *��ȡ��ǰ����,��ȷ���� 
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
	 * ��ȡָ���ַ�����date����
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
	 * ��ȡ��ǰ�µ�һ�������ڼ�
	 * */
	/*public static int getOneDayToWeek(){
		
		Date date = new Date(System.currentTimeMillis());
        //String[] weeks = {"������","����һ","���ڶ�","������","������","������","������"};  
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
	 * ��ȡĳ�������ڼ�,���ص��Ǻ���
	 * */
	public static String getWhereDayWhereMonthToWeekForChina(String date1){
		
		Date date = new Date(getTimeStamp(date1));
        String[] weeks = {"��","һ","��","��","��","��","��"};  
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
	 * ��ȡĳ�������ڼ�,���ص�������
	 * */
	public static int getWhereDayWhereMonthToWeek(String date1){
		
		Date date = new Date(getTimeStamp(date1));
        //String[] weeks = {"������","����һ","���ڶ�","������","������","������","������"};  
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
	 * ��ȡ��ǰ���ڶ�Ӧ������
	 * @return
	 */
	public static String getCurrentWeek(){
		
		Date date = new Date(System.currentTimeMillis());
        String[] weeks = {"��","һ","��","��","��","��","��"};  
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
	 * ȡ�õ������� 
	 * */  
	public static int getCurrentMonthLastDay()  
	{  
	    Calendar calendar = Calendar.getInstance();  
	    calendar.set(Calendar.DATE, 1);//����������Ϊ���µ�һ��  
	    calendar.roll(Calendar.DATE, -1);//���ڻع�һ�죬Ҳ�������һ��  
	    int maxDate = calendar.get(Calendar.DATE);  
	    return maxDate;  
	}
	
	/** 
	 * �õ�ָ���µ����� 
	 * */  
	public static int getMonthLastDay(int year, int month)  
	{  
	    Calendar calendar = Calendar.getInstance();  
	    calendar.set(Calendar.YEAR, year);  
	    calendar.set(Calendar.MONTH, month - 1);  
	    calendar.set(Calendar.DATE, 1);//����������Ϊ���µ�һ��  
	    calendar.roll(Calendar.DATE, -1);//���ڻع�һ�죬Ҳ�������һ��  
	    int maxDate = calendar.get(Calendar.DATE);  
	    return maxDate;  
	} 
	
	/**
	 * ��ȡ��ǰ�·�
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
	 * ��ʱ����
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
