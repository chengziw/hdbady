package com.hrbhd.bady.web.action;

import java.io.IOException;
import java.nio.Buffer;
import java.util.Arrays;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.aspectj.weaver.reflect.ReflectionBasedReferenceTypeDelegate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;

import org.springframework.stereotype.Controller;

import com.hrbhd.bady.domain.ClassType;
import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.Subject;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.service.IAskService;
import com.hrbhd.bady.service.IGradeService;
import com.hrbhd.bady.service.ISubjectService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.TimeUtil;
import com.hrbhd.bady.web.action.base.BaseAction;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

@Controller
@Scope("prototype")
public class SubjectAction extends BaseAction<Subject> {

	@Autowired
	private ISubjectService subjectService;
	@Autowired
	private IGradeService gradeService;

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

	private String[] grade_id;

	public void setGrade_id(String[] grade_id) {
		this.grade_id = grade_id;
	}

	public String pageQuery() throws IOException {

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));

		
		if ("1".equals(tag)) {
			subjectService.termQuery(model, pageBean, detachedCriteria); 
		}
		 
		subjectService.pageQuery(pageBean);

		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[]{"grades"});
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
		Subject subject = subjectService.findById(id);
		ServletActionContext.getContext().getValueStack().set("subject", subject);

		//String grade_name = subject.getGrade_name();
		//String[] split = grade_name.split(",");
		//List grade = Arrays.asList(split);
		// List classType = classTypeService.findAll();
		//ServletActionContext.getContext().put("grade", grade);

		return "edit";
	}

	public String editSubject() throws IOException {

		String json = "";
		String name = model.getName();
		if (StringUtils.isNotBlank(name)) {

			String id = model.getId();
			Subject subject = subjectService.findById(id);
			// String DBtype_name = classType.getType_name();
			String DBname = subject.getName();

			List<Subject> list = subjectService.findByName(name);
			// 不是原本的名字/////////////也不是数据库中其他名字//
			if (!name.equals(DBname) && list.size() > 0) {
				json = "{\"status\": 0,\"info\": \"学科名称已存在！\"}";
			} else {
				subjectService.editSubject(model, grade_id);
				json = "{\"status\": 1, \"info\": \"提交成功\"}";
			}
		} else {
			json = "{\"status\": 0, \"info\": \"请填写学科名称\"}";
		}
		JsonUtil.writeJson(json);
		return NONE;

	}

	public String changeStatus() throws IOException {

		subjectService.changeStatus(model);

		return NONE;
	}

	public String add() {

		List<Grade> grade = gradeService.findAll();
		ServletActionContext.getContext().put("grade", grade);

		return "add";
	}

	public String addSubject() throws IOException {

		String json = "";
		String name = model.getName();

		if (StringUtils.isNotBlank(name)) {

			// List <ClassType> list =
			// classTypeService.findByTypeName(type_name);
			List<Subject> list = subjectService.findByName(name);

			if (list.size() > 0) {
				json = "{\"status\": 0,\"info\": \"学科名称已存在！\"}";
			} else {
				subjectService.addSubject(model, grade_id);
				json = "{\"status\": 1, \"info\": \"提交成功\"}";
			}
		} else {
			json = "{\"status\": 0, \"info\": \"请填写学科名称\"}";
		}

		JsonUtil.writeJson(json);

		return NONE;
	}

	public String findAllSubjectToSearch() throws IOException {

		List<Subject> list = subjectService.findAll();

		if (list.size() > 0) {
			StringBuffer buffer = new StringBuffer();
			buffer.append("[{\"id\":\"全部科目\",\"name\":\"全部科目\"},");
			// buffer.append("[");
			for (int i = 0; i < list.size(); i++) {
				buffer.append("{\"id\":\"" + list.get(i).getId() + "\",\"name\":\"" + list.get(i).getName() + "\"},");
				if (i == list.size() - 1) {
					buffer.append(
							"{\"id\":\"" + list.get(i).getId() + "\",\"name\":\"" + list.get(i).getName() + "\"}");
				}
			}

			buffer.append("]");
			String json = buffer.toString();
			JsonUtil.writeJson(json);
			System.out.println(json);
		}

		return NONE;
	}

	public String findAllSubject() throws IOException {

		List<Subject> list = subjectService.findByStatus();

		if (list.size() > 0) {
			StringBuffer buffer = new StringBuffer();
			buffer.append("[{\"id\":\"\",\"name\":\"请选择科目\"},");
			// buffer.append("[");
			for (int i = 0; i < list.size(); i++) {
				buffer.append("{\"id\":\"" + list.get(i).getName() + "\",\"name\":\"" + list.get(i).getName() + "\"},");
				if (i == list.size() - 1) {
					buffer.append(
							"{\"id\":\"" + list.get(i).getName() + "\",\"name\":\"" + list.get(i).getName() + "\"}");
				}
			}

			buffer.append("]");
			String json = buffer.toString();
			JsonUtil.writeJson(json);
			System.out.println(json);
		}

		return NONE;
	}
	
	public String t_findAllSubjectToHomeWorkAdd() throws IOException{
		
		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginTeacher");
		Classes classes = subjectService.getClasses(teacher);
		Grade grade = classes.getGrade();
		List<Subject> list = subjectService.findByStatus();
		
		StringBuffer buffer = new StringBuffer();
		buffer.append("{");
		buffer.append("\"ok\":\"true\",");
		buffer.append("\"servertime\":\""+TimeUtil.getCurrentTime()+"\",");
		buffer.append("\"subjectlist\":[");
		
		for(int i = 0;i<list.size();i++){
			Subject subject = list.get(i);
			buffer.append("{");
			
			buffer.append("\"subjectid\":\""+subject.getId()+"\",");
			buffer.append("\"subjectname\":\""+subject.getName()+"\",");
			
			buffer.append("\"classlist\": {");
			buffer.append("\"classid\": \""+classes.getId()+"\",");
			buffer.append("\"classname\": \""+classes.getClass_name()+"\",");
			buffer.append("\"gradeid\":\""+grade.getId()+"\",");
			buffer.append("\"gradename\":\""+grade.getName()+"\"");
			buffer.append("}");
				
			if(i==list.size()-1){
				buffer.append("}");
			}else{
				buffer.append("},");
			}
		}
		
		buffer.append("]");
		buffer.append("}");
		
		String json = buffer.toString();
		JsonUtil.writeJson(json);
		
		return NONE;
	}
	
	
	public String p_findAllSubjectToHomeWorkAdd() throws IOException{
		
		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginTeacher");
		Classes classes = teacher.getClasses();
		Grade grade = classes.getGrade();
		List<Subject> list = subjectService.findByStatus();
		
		StringBuffer buffer = new StringBuffer();
		buffer.append("{");
		buffer.append("\"ok\":\"true\",");
		buffer.append("\"servertime\":\""+TimeUtil.getCurrentTime()+"\",");
		buffer.append("\"subjectlist\":[");
		
		for(int i = 0;i<list.size();i++){
			Subject subject = list.get(i);
			buffer.append("{");
			
			buffer.append("\"subjectid\":\""+subject.getId()+"\",");
			buffer.append("\"subjectname\":\""+subject.getName()+"\",");
			
			buffer.append("\"classlist\": {");
			buffer.append("\"classid\": \""+classes.getId()+"\",");
			buffer.append("\"classname\": \""+classes.getClass_name()+"\",");
			buffer.append("\"gradeid\":\""+grade.getId()+"\",");
			buffer.append("\"gradename\":\""+grade.getName()+"\"");
			buffer.append("}");
				
			if(i==list.size()-1){
				buffer.append("}");
			}else{
				buffer.append("},");
			}
		}
		
		buffer.append("]");
		buffer.append("}");
		
		String json = buffer.toString();
		JsonUtil.writeJson(json);
		
		return NONE;
	}

}
