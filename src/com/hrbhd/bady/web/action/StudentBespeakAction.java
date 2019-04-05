package com.hrbhd.bady.web.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.domain.ClassType;
import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.StudentBespeak;
import com.hrbhd.bady.domain.StudentBespeakDesc;
import com.hrbhd.bady.domain.StudentChangeLog;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.service.IGradeService;
import com.hrbhd.bady.service.IStudentBespeakService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.MD5Utils;
import com.hrbhd.bady.util.PageBean;
import com.hrbhd.bady.util.TimeUtil;
import com.hrbhd.bady.web.action.base.BaseAction;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

@Controller
@Scope("prototype")
public class StudentBespeakAction extends BaseAction<StudentBespeak> {

	@Autowired
	private IStudentBespeakService studentBespeakService;
	
	private String page;
	private String rows;
	private String tag;
	private String interests[];
	
	public void setPage(String page) {
		this.page = page;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public void setInterests(String[] interests) {
		this.interests = interests;
	}

	public String pageQuery() throws IOException {
		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));
		if ("1".equals(tag)) {
			studentBespeakService.termQuery(model,pageBean,detachedCriteria);
		}
		studentBespeakService.pageQuery(pageBean);

		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] { "studentBespeakDesc" });
		jsonConfig.setJsonPropertyFilter(new PropertyFilter() {
			
			@Override
			public boolean apply(Object source, String name, Object value) {
				if(source instanceof Classes&&name.equals("studentBespeaks")){
					return true;
				}
				if(source instanceof Classes&&name.equals("classType")){
					return true;
				}
				if(source instanceof Classes&&name.equals("students")){
					return true;
				}
				if (source instanceof Classes && name.equals("classesChangeLogs")) {
					return true;
				}
				if (source instanceof Classes && name.equals("homeWorks")) {
					return true;
				}
				if (source instanceof Classes && name.equals("create_time_format")) {
					return true;
				}
				if (source instanceof Classes && name.equals("cookBooks")) {
					return true;
				}
				if (source instanceof Classes && name.equals("studentChecks")) {
					return true;
				}
				if (source instanceof Classes && name.equals("teacher")) {
					return true;
				}
				if(source instanceof Grade&&name.equals("classes")){
					return true;
				}
				if (source instanceof Grade && name.equals("subjects")) {
					return true;
				}
				return false;
			}
		});
		JSONArray jsonObject = JSONArray.fromObject(pageBean.getRows(), jsonConfig);

		int total = pageBean.getTotal();

		String json1 = "{\"total\":" + total + ",\"rows\":";
		String json2 = jsonObject.toString();
		String json3 = "}";
		String json = json1 + json2 + json3;
		JsonUtil.writeJson(json);
		System.out.println("studentBespeak:" + json);

		return NONE;
	}

	

	public String addBespeakStudent() throws IOException {

		String save_interests[] = { "", "", "", "", "", "" };
		StringBuffer buffer = new StringBuffer();
		if (interests != null) {
			for (int i = 0; i < interests.length; i++) {
				int num = Integer.parseInt(interests[i]);
				save_interests[num] = interests[i];
			}
		}
		for (int i = 0; i < save_interests.length; i++) {
			if (i == save_interests.length - 1) {
				buffer.append(save_interests[i]);
			} else {
				buffer.append(save_interests[i] + ",");
			}
		}
		model.setInterest(buffer.toString());

		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginUser");
		model.setTeacher_name(teacher.getTeacher_name());
		String status_name = model.getStatus_name();
		if ("1".equals(status_name)) {
			model.setStatus_name_text("待去电核实");
		} else if ("2".equals(status_name)) {
			model.setStatus_name_text("待到校报名");
		}
		
		model.setCreate_time_name(TimeUtil.getCurrentDay());
		
		String password = model.getPassword();
		password = MD5Utils.md5(password);
		model.setPassword(password);

		studentBespeakService.addBespeakStudent(model);

		return NONE;

	}

	public String checkBespeakStudent() throws IOException {

		studentBespeakService.checkBespeakStudent(model);

		return NONE;

	}

	public String editBespeakStudent() throws IOException {

		String save_interests[] = { "", "", "", "", "", "" };
		StringBuffer buffer = new StringBuffer();
		if (interests != null) {
			for (int i = 0; i < interests.length; i++) {
				int num = Integer.parseInt(interests[i]);
				save_interests[num] = interests[i];
			}
		}
	
		for (int i = 0; i < save_interests.length; i++) {
			if (i == save_interests.length - 1) {
				buffer.append(save_interests[i]);
			} else {
				buffer.append(save_interests[i] + ",");
			}
		}
		model.setInterest(buffer.toString());

		studentBespeakService.editBespeakStudent(model);

		return NONE;
	}

	public String edit() {

		String id = model.getId();
		StudentBespeak studentBespeak = studentBespeakService.findById(id);
		String interest = studentBespeak.getInterest();
		String[] split = interest.split(",");
		List<String> interests = Arrays.asList(split);
		ServletActionContext.getContext().put("interests", interests);
		ServletActionContext.getContext().getValueStack().set("studentBespeak", studentBespeak);
		return "edit";
	}

	public String check() {

		String id = model.getId();
		StudentBespeak studentBespeak = studentBespeakService.findById(id);
		ServletActionContext.getContext().getValueStack().set("studentBespeak", studentBespeak);
		return "check";
	}

	public String descPageQuery() throws IOException {
		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));

		List<StudentBespeakDesc> studentBespeakDescs = studentBespeakService.descPageQuery(model);

		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] { "studentBespeak" });
		JSONArray jsonObject = JSONArray.fromObject(studentBespeakDescs, jsonConfig);
		// JSONArray jsonObject = JSONObject.fromObject(studentBespeakDescs);
		System.out.println(jsonObject);
		int total = studentBespeakDescs.size();

		// String json =
		// "{\"total\":1,\"rows\":[{\"id\":\"13\",\"bespeak_id\":\"33\",\"teacher_id\":\"1\",\"desctext\":\"\u53d1\u7684\",\"create_time\":\"1485843251\",\"teacher_name\":\"\u5510\u56fd\u8f89(18565689925)\",\"teacher_phone\":\"18565689925\",\"create_time_name\":\"2017-01-31
		// 14:14:11\"}]}";
		String json1 = "{\"total\":" + total + ",\"rows\":";
		String json2 = jsonObject.toString();
		String json3 = "}";
		String json = json1 + json2 + json3;
		JsonUtil.writeJson(json);
		System.out.println(json);

		return NONE;
	}

	public String p_add(){
		
		return "p_add";
	}
	
	public String p_addBespeakStudent() throws IOException{
		
		studentBespeakService.paddBespeakStudent(model);
		
		return NONE;
	}
	
}
