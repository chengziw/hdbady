package com.hrbhd.bady.test;

import java.sql.Time;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import org.apache.log4j.chainsaw.Main;

public class Test4 {

	public static void main(String[] args){
		Calendar calendar = Calendar.getInstance();
		int i = calendar.get(calendar.MONTH)+1;
		System.out.println(i);
		
	}
}
