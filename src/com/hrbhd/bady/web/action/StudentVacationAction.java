package com.hrbhd.bady.web.action;

import java.awt.Window.Type;

import java.awt.image.BufferedImageFilter;
import java.io.IOException;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.xmlbeans.impl.xb.xsdschema.impl.PublicImpl;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.StudentVacation;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.domain.TeacherVacation;
import com.hrbhd.bady.service.IAskService;
import com.hrbhd.bady.service.IStudentService;
import com.hrbhd.bady.service.IStudentVacationService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.LogUtil;
import com.hrbhd.bady.util.TimeUtil;
import com.hrbhd.bady.web.action.base.BaseAction;
import com.mysql.jdbc.StreamingNotifiable;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

@Controller
@Scope("prototype")
public class StudentVacationAction extends BaseAction<StudentVacation> {

	@Autowired
	private IStudentVacationService studentVacationService;
	@Autowired
	private IStudentService studentService;

	private String page;
	private String rows;
	private String tag;

	private String student_name;
	private String class_id;
	private String grade_id;

	private String flag;

	public void setPage(String page) {
		this.page = page;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}

	public void setGrade_id(String grade_id) {
		this.grade_id = grade_id;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String pageQuery() throws IOException {

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));

		if ("1".equals(tag)) {
			studentVacationService.termQuery(model, pageBean, detachedCriteria, student_name, class_id, grade_id);
		}

		studentVacationService.pageQuery(pageBean);

		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[] { "apply_time_format" });
		config.setJsonPropertyFilter(new PropertyFilter() {

			@Override
			public boolean apply(Object source, String name, Object value) {

				if (source instanceof Student && name.equals("enter_date_time")) {
					return true;
				}
				if (source instanceof Student && name.equals("asks")) {
					return true;
				}
				if (source instanceof Student && name.equals("notices")) {
					return true;
				}
				if (source instanceof Student && name.equals("grade")) {
					return true;
				}
				if (source instanceof Student && name.equals("studentVacations")) {
					return true;
				}
				if (source instanceof Student && name.equals("studentChecks")) {
					return true;
				}
				if (source instanceof Student && name.equals("studentMonthChecks")) {
					return true;
				}
				if (source instanceof Student && name.equals("studentChangeLogs")) {
					return true;
				}
				if (source instanceof Student && name.equals("askStudentChecks")) {
					return true;
				}
				if (source instanceof Student && name.equals("noticeStudentChecks")) {
					return true;
				}
				if (source instanceof Student && name.equals("studentImageUrls")) {
					return true;
				}
				if (source instanceof Student && name.equals("enter_date_time")) {
					return true;
				}
				if (source instanceof Classes && name.equals("students")) {
					return true;
				}
				if (source instanceof Classes && name.equals("studentBespeaks")) {
					return true;
				}
				if (source instanceof Classes && name.equals("classType")) {
					return true;
				}
				if (source instanceof Classes && name.equals("curriculaTable")) {
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
				if (source instanceof Classes && name.equals("homeWorks")) {
					return true;
				}
				if (source instanceof Classes && name.equals("cookBooks")) {
					return true;
				}
				if (source instanceof Classes && name.equals("teacher")) {
					return true;
				}
				if (source instanceof Classes && name.equals("studentChecks")) {
					return true;
				}
				if (source instanceof Grade && name.equals("classes")) {
					return true;
				}
				if (source instanceof Grade && name.equals("subjects")) {
					return true;
				}
				return false;
			}
		});

		JSONArray jsonObject = JSONArray.fromObject(pageBean.getRows(), config);

		int total = pageBean.getTotal();

		String json1 = "{\"total\":" + total + ",\"rows\":";
		String json2 = jsonObject.toString();
		String json3 = "}";
		String json = json1 + json2 + json3;
		JsonUtil.writeJson(json);
		return NONE;
	}

	public String add() {

		return "add";
	}

	public String findAllStudent() throws IOException {

		// String student_name = model.getStudent_name();
		List<Student> list = studentService.finByLikeName(student_name);
		// List<Student> list = studentService.findAll();
		StringBuffer buffer = new StringBuffer();
		Student student = null;
		Classes classes = null;
		Grade grade = null;
		int total = 0;

		for (int i = 0; i < list.size(); i++) {
			student = list.get(i);
			total++;
			buffer.append("{");
			buffer.append("\"id\": \" " + student.getId() + "\",");
			buffer.append("\"student_name\": \"" + student.getName() + "\",");
			buffer.append("\"sex_name\": \"" + student.getSex() + "\",");
			buffer.append("\"phone\": \"" + student.getPhone() + "\",");
			buffer.append("\"birthday_name\": \"" + student.getYearMonthDay() + "\",");
			if (student.getClasses() != null) {
				buffer.append("\"class_name\": \"" + student.getClasses().getClass_name() + "\",");
			} else {
				buffer.append("\"class_name\": \"\",");
			}
			if (student.getClasses() != null && student.getClasses().getGrade() != null) {
				buffer.append("\"grade_name\": \"" + student.getClasses().getGrade().getName() + "\",");
			} else {
				buffer.append("\"grade_name\": \"\",");
			}
			buffer.append("\"parent_name\": \"" + student.getParent_name() + "\"");

			if (i == list.size() - 1) {
				buffer.append("}");
			} else {
				buffer.append("},");
			}

		}

		String json1 = "{\"total\":" + total + ",\"rows\":[";
		String json2 = buffer.toString();
		String json3 = "]}";
		String json = json1 + json2 + json3;
		JsonUtil.writeJson(json);

		return NONE;
	}

	public String addStudentVacation() throws IOException {

		/*
		 * String student_id = model.getStudent().getId(); student_id =
		 * student_id.trim(); Student student =
		 * studentService.findById(student_id);
		 */

		studentVacationService.addStudentVacation(model);

		return NONE;
	}

	public String check() {

		String id = model.getId();
		StudentVacation studentVacation = studentVacationService.findById(id);
		ServletActionContext.getContext().getValueStack().set("studentVacation", studentVacation);

		return "check";
	}

	public String checkStudentVacation() throws IOException {

		studentVacationService.checkStudentVacation(model);

		return NONE;
	}

	public String t_pageQuery() throws IOException {

		/*
		 * detachedCriteria = pageBean.getDetachedCriteria();
		 * detachedCriteria.addOrder(Order.desc("day_label"));
		 * if("1".equals(flag)){
		 * 
		 * } pageBean.setCurrentPage(Integer.parseInt(page));
		 * pageBean.setPageSize(Integer.parseInt(rows));
		 * 
		 * if ("1".equals(tag)) { studentVacationService.termQuery(model,
		 * pageBean, detachedCriteria, student_name, class_id, grade_id); }
		 * List<StudentVacation> list = pageBean.getRows();
		 */
		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginTeacher");
		// List<Student> list = studentVacationService.getStudent(teacher);

		List<StudentVacation> list = studentVacationService.findAll();

		StudentVacation studentVacation = null;
		Student student = null;
		StringBuffer buffer = new StringBuffer();
		buffer.append("{");

		// Î´ÔÄµÄÇë¼Ù
		buffer.append("\"shijia\":[");
		boolean flag = false;
		for (int i = 0; i < list.size(); i++) {
			studentVacation = list.get(i);
			student = studentVacation.getStudent();
			String typee = studentVacation.getTypee();
			String status = studentVacation.getStatus();
			if ("1".equals(typee) && "1".equals(status)) {
				buffer.append("{");
				buffer.append("\"sexLabel\": \"" + student.getSex() + "\",");
				buffer.append("\"studentId\": \"" + studentVacation.getId() + "\",");
				buffer.append("\"studentName\": \"" + student.getName() + "\",");
				buffer.append("\"starttime\":\"" + studentVacation.getStart_time() + "\",");
				buffer.append("\"endtime\":\"" + studentVacation.getEnd_time() + "\"");
				buffer.append("},");
				flag = true;
			}
		}
		if (flag) {
			buffer.deleteCharAt(buffer.length() - 1);
			flag = false;
		}
		buffer.append("],");
		buffer.append("\"bingjia\":[");
		for (int i = 0; i < list.size(); i++) {
			studentVacation = list.get(i);
			String typee = studentVacation.getTypee();
			String status = studentVacation.getStatus();
			if ("2".equals(typee) && "1".equals(status)) {
				buffer.append("{");
				buffer.append("\"sexLabel\": \"" + student.getSex() + "\",");
				buffer.append("\"studentId\": \"" + studentVacation.getId() + "\",");
				buffer.append("\"studentName\": \"" + student.getName() + "\",");
				buffer.append("\"starttime\":\"" + studentVacation.getStart_time() + "\",");
				buffer.append("\"endtime\":\"" + studentVacation.getEnd_time() + "\"");
				buffer.append("},");
				flag = true;
			}

		}
		if (flag) {
			buffer.deleteCharAt(buffer.length() - 1);
			flag = false;
		}
		buffer.append("],");
		/*
		 * buffer.append("\"qitajia\":["); for (int i = 0; i < list.size(); i++)
		 * { studentVacation = list.get(i); String typee =
		 * studentVacation.getTypee(); String status =
		 * studentVacation.getStatus(); if ("3".equals(typee) &&
		 * "1".equals(status)) { buffer.append("{");
		 * buffer.append("\"sexLabel\": \"" + student.getSex() + "\",");
		 * buffer.append("\"studentId\": \"" + studentVacation.getId() + "\",");
		 * buffer.append("\"studentName\": \"" + student.getName() + "\",");
		 * buffer.append("\"starttime\":\"" + studentVacation.getStart_time() +
		 * "\","); buffer.append("\"endtime\":\"" +
		 * studentVacation.getEnd_time() + "\""); buffer.append("},"); flag =
		 * true; } } if (flag) { buffer.deleteCharAt(buffer.length() - 1); flag
		 * = false; } buffer.append("],");
		 */

		// ÒÑÔÄµÄÇë¼Ù
		buffer.append("\"yiyueshijia\":[");
		for (int i = 0; i < list.size(); i++) {
			studentVacation = list.get(i);
			student = studentVacation.getStudent();
			String typee = studentVacation.getTypee();
			String status = studentVacation.getStatus();
			if ("1".equals(typee) && "3".equals(status)) {
				buffer.append("{");
				buffer.append("\"sexLabel\": \"" + student.getSex() + "\",");
				buffer.append("\"studentId\": \"" + studentVacation.getId() + "\",");
				buffer.append("\"studentName\": \"" + student.getName() + "\",");
				buffer.append("\"starttime\":\"" + studentVacation.getStart_time() + "\",");
				buffer.append("\"endtime\":\"" + studentVacation.getEnd_time() + "\"");
				buffer.append("},");
				flag = true;
			}
		}
		if (flag) {
			buffer.deleteCharAt(buffer.length() - 1);
			flag = false;
		}
		buffer.append("],");
		buffer.append("\"yiyuebingjia\":[");
		for (int i = 0; i < list.size(); i++) {
			studentVacation = list.get(i);
			String typee = studentVacation.getTypee();
			String status = studentVacation.getStatus();
			if ("2".equals(typee) && "3".equals(status)) {
				buffer.append("{");
				buffer.append("\"sexLabel\": \"" + student.getSex() + "\",");
				buffer.append("\"studentId\": \"" + studentVacation.getId() + "\",");
				buffer.append("\"studentName\": \"" + student.getName() + "\",");
				buffer.append("\"starttime\":\"" + studentVacation.getStart_time() + "\",");
				buffer.append("\"endtime\":\"" + studentVacation.getEnd_time() + "\"");
				buffer.append("},");
				flag = true;
			}

		}
		if (flag) {
			buffer.deleteCharAt(buffer.length() - 1);
			flag = false;
		}
		buffer.append("]");
		/*
		 * buffer.append("\"yiyueqitajia\":["); for (int i = 0; i < list.size();
		 * i++) { studentVacation = list.get(i); String typee =
		 * studentVacation.getTypee(); String status =
		 * studentVacation.getStatus(); if ("3".equals(typee) &&
		 * "3".equals(status)) { buffer.append("{");
		 * buffer.append("\"sexLabel\": \"" + student.getSex() + "\",");
		 * buffer.append("\"studentId\": \"" + studentVacation.getId() + "\",");
		 * buffer.append("\"studentName\": \"" + student.getName() + "\",");
		 * buffer.append("\"starttime\":\"" + studentVacation.getStart_time() +
		 * "\","); buffer.append("\"endtime\":\"" +
		 * studentVacation.getEnd_time() + "\""); buffer.append("},"); flag =
		 * true; } } if (flag) { buffer.deleteCharAt(buffer.length() - 1); flag
		 * = false; } buffer.append("]");
		 */

		buffer.append("}");

		String json = buffer.toString();
		JsonUtil.writeJson(json);

		return NONE;
	}


	public String p_studentVacation() {

		return "p_studentVacation";
	}
	
	public String p_addStudentVacation() throws IOException {

		studentVacationService.paddStudentVacation(model);

		return NONE;
		//return "p_studentVacation";
	}

	public String p_pageQuery() throws IOException {

		Student student = (Student) ServletActionContext.getRequest().getSession().getAttribute("loginParent");
		String student_id = student.getId();

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));

		detachedCriteria = pageBean.getDetachedCriteria();
		detachedCriteria.add(Restrictions.eq("student_id", student_id));

		studentVacationService.pageQuery(pageBean);
		List<StudentVacation> list = pageBean.getRows();

		StudentVacation studentVacation = null;
		StringBuffer buffer = new StringBuffer();
		buffer.append("{\"hasMore\":true,\"qingjiaList\": [");
		for (int i = 0; i < list.size(); i++) {
			studentVacation = list.get(i);
			buffer.append("{");

			buffer.append("\"yuanyin\":\"" + studentVacation.getTypeLabel(studentVacation.getTypee()) + "\",");
			buffer.append("\"startTime\":\"" + studentVacation.getStart_time() + "\",");
			buffer.append("\"endTime\":\"" + studentVacation.getEnd_time() + "\",");
			buffer.append("\"check\":\"" + studentVacation.getStatus_label() + "\",");
			buffer.append("\"content\":\"" + studentVacation.getReason() + "\"");

			if (i == list.size() - 1) {
				buffer.append("}");
			} else {
				buffer.append("},");
			}
		}
		buffer.append("]}");

		String json = buffer.toString();
		JsonUtil.writeJson(json);

		return NONE;
	}

	public String t_checkStudentVacation() throws IOException {

		studentVacationService.t_checkStudentVacation(model);

		return NONE;
	}

	public String t_studentVacationCheck() {

		if ("1".equals(flag)) {
			ServletActionContext.getContext().getValueStack().set("flag", "1");
		}

		return "t_studentVacationCheck";
	}

}
