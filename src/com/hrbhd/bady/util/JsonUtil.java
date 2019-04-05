package com.hrbhd.bady.util;

import java.io.IOException;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONArray;

public class JsonUtil {
	//操作成功
	public static final String HANDLE_SUCCESS = "{\"status\":1,\"info\":\"\u64cd\u4f5c\u6210\u529f\"}";
	//保存成功 														
	public static final String SAVE_SUCCESS = "{\"status\":1,\"info\":\"\u4fdd\u5b58\u6210\u529f\"}";	
	
	public static void writeJson(String json) throws IOException {
		ServletActionContext.getResponse().setContentType("text/json;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().print(json);
	}
	
	public static void write2Json(Object object) throws IOException{
		JSONArray jsonObject = JSONArray.fromObject(object);
		String json = jsonObject.toString();
		ServletActionContext.getResponse().setContentType("text/json;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().print(json);
	}
}
