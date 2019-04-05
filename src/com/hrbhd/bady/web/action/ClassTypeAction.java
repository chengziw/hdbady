package com.hrbhd.bady.web.action;

import java.io.IOException;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.domain.ClassType;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.service.IClassTypeService;
import com.hrbhd.bady.service.IStudentService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.web.action.base.BaseAction;
import com.opensymphony.xwork2.ActionContext;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

@Controller
@Scope("prototype")
public class ClassTypeAction extends BaseAction<ClassType>{

	@Autowired
	private IClassTypeService classTypeService;
	
	@Autowired
	private IStudentService studentService;
	
	private String page;
	private String rows;
	
	public void setPage(String page) {
		this.page = page;
	}
	public void setRows(String rows) {
		this.rows = rows;
	}
	
	public String pageQuery() throws IOException {

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));

		studentService.pageQuery(pageBean);
	
		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[]{"classes"});
		JSONArray jsonObject = JSONArray.fromObject(pageBean.getRows(),config);
		
		int total = pageBean.getTotal();
		
		String json1= "{\"total\":"+total+",\"rows\":";
		String json2 = jsonObject.toString();
		String json3 = "}";
		String json = json1 + json2 + json3;
		JsonUtil.writeJson(json);
		
		return NONE;
	}
	
	public String sortClassType(){
		
		
		return "sort";
	}
	
	public String edit(){
		String id = model.getId();
		ClassType classType = classTypeService.findById(id);
		ActionContext.getContext().getValueStack().set("classType", classType);
		return "edit";
	}
	
	
	public String editClassType() throws IOException{
		String json = "";
		String type_name = model.getType_name(); 
		if(StringUtils.isNotBlank(type_name)){
			
			String id = model.getId();
			ClassType classType = classTypeService.findById(id);
			String DBtype_name = classType.getType_name();
			
			List <ClassType> list = classTypeService.findByTypeName(type_name);
					  //不是原本的名字/////////////也不是数据库中其他名字//
			if(!type_name.equals(DBtype_name)&&list.size()>0){
				json = "{\"status\": 0, \"info\": \"班级类型名称已存在\"}";
			}else{
				classTypeService.editClassType(model);
				json = "{\"status\": 1, \"info\": \"保存成功\"}";
			}
		}else{
			json = "{\"status\": 0, \"info\": \"请填写班级类型名称\"}";
		}
		JsonUtil.writeJson(json);
		return NONE;
	}
	
	public String addClassType() throws IOException{
		String json = "";
		String type_name = model.getType_name(); 
		if(StringUtils.isNotBlank(type_name)){
		
			List <ClassType> list = classTypeService.findByTypeName(type_name);
			
			if(list.size()>0){
				json = "{\"status\": 0, \"info\": \"班级类型名称已存在\"}";
			}else{
				classTypeService.addClassType(model);
				json = "{\"status\": 1, \"info\": \"保存成功\"}";
			}
		}else{
			json = "{\"status\": 0, \"info\": \"请填写班级类型名称\"}";
		}
		JsonUtil.writeJson(json);
		
		return NONE;
	}
	
	public String changeStatus() throws IOException{
		classTypeService.changeStatus(model);
		return NONE;
	}
	
	public String findAllClassType() throws IOException{

		List<ClassType> list = classTypeService.findByStatus();
		
		if(list.size()>0){
			StringBuffer buffer = new StringBuffer();
			buffer.append("[{\"id\":\"\",\"name\":\"请选择班级类型\",\"selected\":true}");
			
			System.out.println("shou");
			for (ClassType classType : list) {
				buffer.append(",{\"id\":\""+classType.getId()+"\",\"name\":\""+classType.getType_name()+"\"}");
			}
			buffer.append("]");
			String json = buffer.toString();
			JsonUtil.writeJson(json);
		}
		
		return NONE;
	}
	
	public String findAllClassTypeToSelect() throws IOException{
		
		List<ClassType> list = classTypeService.findAll();
		
		if(list.size()>0){
			StringBuffer buffer = new StringBuffer();
			buffer.append("[{\"id\":\"\",\"name\":\"全部类型\",\"selected\":true}");
			
			System.out.println("shou");
			for (ClassType classType : list) {
				buffer.append(",{\"id\":\""+classType.getId()+"\",\"name\":\""+classType.getType_name()+"\"}");
			}
			
			buffer.append("]");
			String json = buffer.toString();
			JsonUtil.writeJson(json);
		}
		
		return NONE;
	}
	
}
