package com.hrbhd.bady.test;

import com.hrbhd.bady.util.TimeUtil;

public class Test8 {
	
	public static void main(String[] args) {
		
		String currentTime = TimeUtil.getCurrentTime();
		String substring = currentTime.substring(11, 16);
		System.out.println(substring);
		
	}

}
