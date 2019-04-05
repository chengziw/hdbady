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
		String json= "[{\"id\": \"1454551212\",\"teacherName\": \"��׳\"},{\"id\": \"1212121\",\"teacherName\": \"����\"}]";
		
		JSONArray jsonArray = JSONArray.fromObject(json);
		for(int i=0;i<jsonArray.size();i++ ){
			JSONObject jsonObject = jsonArray.getJSONObject(i);
			String id = jsonObject.getString("id");
			String teacherName = jsonObject.getString("teacherName");
			System.out.println(id);
			System.out.println(teacherName);
			
		}
		

		/*String jsonMessage = "[{'num':'�ɼ�', '����':88, '��ʷ':65, '����':99, 'object':{'aaa':'1111','bbb':'2222','cccc':'3333'}}," +
		           "{'num':'��Ȥ', '����':28, '��ʷ':45, '����':19, 'object':{'aaa':'11a11','bbb':'2222','cccc':'3333'}}," +
		           "{'num':'����', '����':48, '��ʷ':62, '����':39, 'object':{'aaa':'11c11','bbb':'2222','cccc':'3333'}}]";
		  JSONArray myJsonArray;
		  try
		  {
		   myJsonArray = new JSONArray(jsonMessage);
		   
		   for(int i=0 ; i < myJsonArray.length() ;i++)
		   {
		    //��ȡÿһ��JsonObject����
		    JSONObject myjObject = myJsonArray.getJSONObject(i);
		    
		    //��ȡÿһ�������е�ֵ
		    String numString = myjObject.getString("num");
		    int englishScore = myjObject.getInt("����");
		    int historyScore = myjObject.getInt("��ʷ");
		    int geographyScore = myjObject.getInt("����");
		    //��ȡ�����ж���Ķ���
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
