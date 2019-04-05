package com.hrbhd.bady.test;

import com.hrbhd.bady.domain.Subject;

public class Test6 {

	public static void main(String[] args) {
		String url = "http://localhost:8080/hdbady/askAction_p_ask.action";
	    int index = url.lastIndexOf("_"); 
	    String substring = url.substring(index-1);
	    System.out.println(substring);
	    String substring2 = substring.substring(0, 1);
	    
	    System.out.println(substring2);
	}
	
}
