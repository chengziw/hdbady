package com.hrbhd.bady.test;

import org.apache.log4j.chainsaw.Main;

import com.hrbhd.bady.util.TimeUtil;

public class Test7 {
	public static void main(String[] args) {
	
		String time1 = "2017-06-01";
		String time2 = "2017-06-05";
		
		long timeStamp1 = TimeUtil.getTimeStamp(time1)/1000;
		long timeStamp2 = TimeUtil.getTimeStamp(time2)/1000;
		
		long i = timeStamp2-timeStamp1;
		i = i/86640;
		
		for(int k=0;k<=i+1;k++){
			String timeFormat = TimeUtil.getTimeFormat(timeStamp1*1000+k*86640*1000);
			System.out.println(timeFormat);
		}
		
		System.out.println(i);
		
	}
}
