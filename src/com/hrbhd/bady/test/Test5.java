package com.hrbhd.bady.test;

import java.io.File;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.apache.log4j.chainsaw.Main;
import org.apache.poi.hslf.dev.SlideAndNotesAtomListing;

public class Test5 {
	public static void main(String[] args) {

		Random random = new Random();
		int nextInt = random.nextInt(1000000);
		System.out.println(nextInt);
		
	}
	
	public static void test1(){
		
		URL resource = Test5.class.getClassLoader().getResource("");
		System.out.println(resource.getPath());
		System.out.println(resource.getFile());
	
	}
	
	public static void test2(){
		
		List<String> list = new ArrayList<String>();
		list.add("一");
		list.add("二");
		list.add("三");
		if(list.contains("二")){
			System.out.println("有");
		}
		
	}
}
