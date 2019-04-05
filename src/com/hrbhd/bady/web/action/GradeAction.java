package com.hrbhd.bady.web.action;

import java.io.IOException;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.domain.ClassType;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.service.IGradeService;
import com.hrbhd.bady.service.IStudentService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.web.action.base.BaseAction;
import com.opensymphony.xwork2.ActionContext;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

@Controller
@Scope("prototype")
public class GradeAction extends BaseAction<Grade> {

	@Autowired
	private IGradeService gradeService;
	
	@Autowired
	private IStudentService studentService;
	
	private String page;
	private String rows;
	private String tag;

	public void setPage(String page) {
		this.page = page;
	}
	public void setRows(String rows) {
		this.rows = rows;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}

	public String pageQuery() throws IOException {

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));

		if ("1".equals(tag)) {
			gradeService.termQuery(model, pageBean, detachedCriteria);
		}
	
		studentService.pageQuery(pageBean);

		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[]{"classes","subjects"});
		
		JSONArray jsonObject = JSONArray.fromObject(pageBean.getRows(),config);

		int total = pageBean.getTotal();

		String json1 = "{\"total\":" + total + ",\"rows\":";
		String json2 = jsonObject.toString();
		String json3 = "}";
		String json = json1 + json2 + json3;
		JsonUtil.writeJson(json);
		return NONE;
	}

	public String edit() {
		String id = model.getId();
		Grade grade = gradeService.findById(id);
		ActionContext.getContext().getValueStack().set("grade", grade);
		return "edit";
	}

	public String editGrade() throws IOException {
		String json = "";
		String name = model.getName();
		if (StringUtils.isNotBlank(name)) {

			String id = model.getId();
			Grade grade = gradeService.findById(id);
			String DBname = grade.getName();

			List<Grade> list = gradeService.findByName(name);
			// 不是原本的名字///////也不是数据库中其他名字//
			if (!name.equals(DBname) && list.size() > 0) {
				json = "{\"errorMsg\": \"年级已存在！\"}";
			} else {
				gradeService.editGrade(model);
				json = "{\"errorMsg\":\"\"}";
			}
		} else {
			json = "{\"errorMsg\": \"请输入年级名称！\"}";
		}
		JsonUtil.writeJson(json);
		return NONE;

	}

	public String changeStatus() throws IOException {
		gradeService.changeStatus(model);
		
		return NONE;
	}

	public String addGrade() throws IOException {

		String json = "";
		String name = model.getName();
		if (StringUtils.isNotBlank(name)) {

			List<Grade> list = gradeService.findByName(name);

			if (list.size() > 0) {
				json = "{\"errorMsg\": \"年级已存在！\"}";
			} else {
				gradeService.addGrade(model);
				json = "{\"errorMsg\":\"\"}";
			}
		} else {
			json = "{\"errorMsg\": \"请输入年级名称！\"}";
		}
		JsonUtil.writeJson(json);
		return NONE;

	}

	public String findAllGrades() throws IOException {

		List<Grade> list = gradeService.findAll();
		System.out.println(list.get(0));
		if (list!=null&&list.size() > 0) {
			StringBuffer buffer = new StringBuffer();
			buffer.append("[{\"id\":\"\",\"name\":\"请选择\"}");
			// buffer.append("[");

			System.out.println("shou");
			for (Grade grade : list) {
				buffer.append(",{\"id\":\"" + grade.getId() + "\",\"name\":\"" + grade.getName() + "\"}");
				// buffer.append("{\"id\":\""+grade.getName()+"\",\"name\":\""+grade.getName()+"\"}");

			}

			buffer.append("]");
			String json = buffer.toString();
			JsonUtil.writeJson(json);
		}
		return NONE;
	}
	
	public String findAllGradesToAdd() throws IOException {

		List<Grade> list = gradeService.findAllGradesByStatus();
		System.out.println(list.get(0));
		if (list!=null&&list.size() > 0) {
			StringBuffer buffer = new StringBuffer();
			buffer.append("[{\"id\":\"\",\"name\":\"请选择\"}");
			// buffer.append("[");

			System.out.println("shou");
			for (Grade grade : list) {
				buffer.append(",{\"id\":\"" + grade.getId() + "\",\"name\":\"" + grade.getName() + "\"}");
				// buffer.append("{\"id\":\""+grade.getName()+"\",\"name\":\""+grade.getName()+"\"}");

			}

			buffer.append("]");
			String json = buffer.toString();
			JsonUtil.writeJson(json);
		}
		return NONE;
	}
	
	public String findAllGradesToSelect() throws IOException {

		List<Grade> list = gradeService.findAll();
		System.out.println(list.get(0));
		if (list!=null&&list.size() > 0) {
			StringBuffer buffer = new StringBuffer();
			buffer.append("[");

			for(int i=0;i<list.size();i++){
				if(i==list.size()-1){
					buffer.append("{\"id\":\"" + list.get(i).getName() + "\",\"name\":\"" + list.get(i).getName() + "\"}");
				}else{
					buffer.append("{\"id\":\"" + list.get(i).getName() + "\",\"name\":\"" + list.get(i).getName() + "\"},");
				}
			}

			buffer.append("]");
			String json = buffer.toString();
			JsonUtil.writeJson(json);
		}
		return NONE;
	}

	public String findAllGradesToSearch() throws IOException {
		
		List<Grade> list = gradeService.findAll();
		System.out.println(list.get(0));
		if (list!=null&&list.size() > 0) {
			StringBuffer buffer = new StringBuffer();
			buffer.append("[{\"id\":\"\",\"name\":\"全部年级\",\"selected\":true}");
			// buffer.append("[");

			System.out.println("shou");
			for (Grade grade : list) {
				buffer.append(",{\"id\":\"" + grade.getId() + "\",\"name\":\"" + grade.getName() + "\"}");
				// buffer.append("{\"id\":\""+grade.getName()+"\",\"name\":\""+grade.getName()+"\"}");

			}

			buffer.append("]");
			String json = buffer.toString();
			JsonUtil.writeJson(json);
		}
		return NONE;
	}

}
