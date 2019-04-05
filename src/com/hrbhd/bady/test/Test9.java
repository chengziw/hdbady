package com.hrbhd.bady.test;

import java.sql.Date;

import com.hrbhd.bady.util.TimeUtil;

public class Test9 {

	public static void main(String[] args) {
		
		String time1="2017-5-6";
		String time2="2017-5-1";
		long timeStamp1 = TimeUtil.getTimeStamp(time1);
		long timeStamp2 = TimeUtil.getTimeStamp(time2);
		Long time = (timeStamp2-timeStamp1)/(long)86400000;
		System.out.println(time);
	}
	
}
