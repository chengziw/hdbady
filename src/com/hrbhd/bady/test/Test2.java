package com.hrbhd.bady.test;

import java.io.File;


import java.io.FileNotFoundException;
import java.io.IOException;
import java.security.KeyStore.PrivateKeyEntry;
import java.util.Arrays;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.chainsaw.Main;
import org.apache.poi.util.StringUtil;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.domain.CurriculaTableItem;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.MD5Utils;
import com.hrbhd.bady.web.action.base.BaseAction;
import com.opensymphony.xwork2.ActionContext;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class Test2 {
	public static void main(String[] args) {
		String json= "[{\"id\": \"1454551212\",\"teacherName\": \"刘壮\"},{\"id\": \"1212121\",\"teacherName\": \"张三\"}]";
		
		JSONArray jsonArray = JSONArray.fromObject(json);
		for(int i=0;i<jsonArray.size();i++ ){
			JSONObject jsonObject = jsonArray.getJSONObject(i);
			String id = jsonObject.getString("id");
			String teacherName = jsonObject.getString("teacherName");
			System.out.println(id);
			System.out.println(teacherName);
			
		}
		

		/*String jsonMessage = "[{'num':'成绩', '外语':88, '历史':65, '地理':99, 'object':{'aaa':'1111','bbb':'2222','cccc':'3333'}}," +
		           "{'num':'兴趣', '外语':28, '历史':45, '地理':19, 'object':{'aaa':'11a11','bbb':'2222','cccc':'3333'}}," +
		           "{'num':'爱好', '外语':48, '历史':62, '地理':39, 'object':{'aaa':'11c11','bbb':'2222','cccc':'3333'}}]";
		  JSONArray myJsonArray;
		  try
		  {
		   myJsonArray = new JSONArray(jsonMessage);
		   
		   for(int i=0 ; i < myJsonArray.length() ;i++)
		   {
		    //获取每一个JsonObject对象
		    JSONObject myjObject = myJsonArray.getJSONObject(i);
		    
		    //获取每一个对象中的值
		    String numString = myjObject.getString("num");
		    int englishScore = myjObject.getInt("外语");
		    int historyScore = myjObject.getInt("历史");
		    int geographyScore = myjObject.getInt("地理");
		    //获取数组中对象的对象
		    JSONObject myjObject2 = myjObject.getJSONObject("object");
		    String aaaString = myjObject2.getString("aaa");
		    System.out.println("aaaString="+aaaString);
		    
		    System.out.println("numString="+numString);
		    System.out.println("englishScore="+englishScore);
		    System.out.println("historyScore="+historyScore);
		    System.out.println("geographyScore="+geographyScore);
		   }
		  }
		  catch (JSONException e)
		  {
		  } */
	}
}
