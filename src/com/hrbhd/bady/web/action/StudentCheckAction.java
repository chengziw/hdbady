package com.hrbhd.bady.web.action;

import java.awt.image.BufferedImageFilter;

import java.io.IOException;
import java.nio.Buffer;
import java.security.KeyStore.PrivateKeyEntry;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.mail.Flags;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.apache.xmlbeans.impl.xb.xsdschema.impl.PublicImpl;
import org.aspectj.weaver.AjAttribute.PrivilegedAttribute;
import org.hibernate.criterion.Restrictions;
import org.hibernate.type.SetType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.StudentCheck;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.domain.TeacherCheck;
import com.hrbhd.bady.service.IAskService;
import com.hrbhd.bady.service.IClassesService;
import com.hrbhd.bady.service.IStudentCheckService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.TimeUtil;
import com.hrbhd.bady.web.action.base.BaseAction;
import com.mysql.jdbc.StreamingNotifiable;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

@Controller
@Scope("prototype")
public class StudentCheckAction extends BaseAction<StudentCheck> {

	@Autowired
	private IStudentCheckService studentCheckService;

	@Autowired
	private IClassesService classesService;

	private String page;
	private String rows;
	private String tag;
	private String ids;

	private String grade_id;
	private String class_id;
	private String date;
	private String student_name;

	private String type;

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

	public void setIds(String ids) {
		this.ids = ids;
	}

	public void setGrade_id(String grade_id) {
		this.grade_id = grade_id;
	}

	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String pageQuery() throws IOException {

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));

		if ("1".equals(tag)) {
			studentCheckService.termQuery(model, pageBean, detachedCriteria, grade_id, class_id, date, student_name);
		}

		studentCheckService.pageQuery(pageBean);

		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[] { "date_label_format", "studentMonthCheck" });
		config.setJsonPropertyFilter(new PropertyFilter() {

			@Override
			public boolean apply(Object source, String name, Object value) {

				if (source instanceof Student && name.equals("asks")) {
					return true;
				}
				if (source instanceof Student && name.equals("notices")) {
					return true;
				}
				if (source instanceof Student && name.equals("grade")) {
					return true;
				}
				if (source instanceof Student && name.equals("enter_date_time")) {
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
				if (source instanceof Classes && name.equals("students")) {
					return true;
				}
				if (source instanceof Classes && name.equals("studentBespeaks")) {
					return true;
				}
				if (source instanceof Classes && name.equals("classType")) {
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
				if (source instanceof Classes && name.equals("curriculaTable")) {
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

	public String batchCome() {

		return "batchCome";
	}

	public String batchGo() {

		return "batchGo";
	}

	public String comeSchoolStudent() throws IOException {

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));

		String currentDay = TimeUtil.getCurrentDay();
		Date start_date_format = TimeUtil.getDate(currentDay);
		detachedCriteria = pageBean.getDetachedCriteria();
		// detachedCriteria.setProjection(null);
		detachedCriteria.add(Restrictions.eq("date_label_format", start_date_format));
		detachedCriteria.add(Restrictions.eq("status", "2"));

		if ("1".equals(tag)) {
			studentCheckService.termQuery2(model, pageBean, detachedCriteria, grade_id, class_id);
		}

		studentCheckService.pageQuery(pageBean);

		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[] { "date_label_format", "studentMonthCheck", "classes" });
		config.setJsonPropertyFilter(new PropertyFilter() {

			@Override
			public boolean apply(Object source, String name, Object value) {

				if (source instanceof Student && name.equals("asks")) {
					return true;
				}
				if (source instanceof Student && name.equals("notices")) {
					return true;
				}
				if (source instanceof Student && name.equals("grade")) {
					return true;
				}
				if (source instanceof Student && name.equals("enter_date_time")) {
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
				if (source instanceof Classes && name.equals("students")) {
					return true;
				}
				if (source instanceof Classes && name.equals("studentBespeaks")) {
					return true;
				}
				if (source instanceof Classes && name.equals("classType")) {
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
				if (source instanceof Classes && name.equals("curriculaTable")) {
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

	public String comeSchoolStudentEnter() throws IOException {

		studentCheckService.comeSchoolStudentEnter(model, ids);

		return NONE;
	}

	public String goSchoolStudent() throws IOException {

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));

		String currentDay = TimeUtil.getCurrentDay();
		Date start_date_format = TimeUtil.getDate(currentDay);
		detachedCriteria = pageBean.getDetachedCriteria();
		// detachedCriteria.setProjection(null);
		detachedCriteria.add(Restrictions.eq("date_label_format", start_date_format));
		detachedCriteria.add(Restrictions.eq("status", "3"));

		if ("1".equals(tag)) {
			studentCheckService.termQuery2(model, pageBean, detachedCriteria, grade_id, class_id);
		}

		studentCheckService.pageQuery(pageBean);

		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[] { "date_label_format", "studentMonthCheck", "classes" });
		config.setJsonPropertyFilter(new PropertyFilter() {

			@Override
			public boolean apply(Object source, String name, Object value) {

				if (source instanceof Student && name.equals("asks")) {
					return true;
				}
				if (source instanceof Student && name.equals("notices")) {
					return true;
				}
				if (source instanceof Student && name.equals("grade")) {
					return true;
				}
				if (source instanceof Student && name.equals("enter_date_time")) {
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
				if (source instanceof Classes && name.equals("students")) {
					return true;
				}
				if (source instanceof Classes && name.equals("studentBespeaks")) {
					return true;
				}
				if (source instanceof Classes && name.equals("classType")) {
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
				if (source instanceof Classes && name.equals("curriculaTable")) {
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

	public String goSchoolStudentEnter() throws IOException {

		studentCheckService.goSchoolStudentEnter(model, ids);

		return NONE;
	}

	public String addNote() {

		String id = model.getId();
		StudentCheck studentCheck = studentCheckService.findById(id);
		ServletActionContext.getContext().getValueStack().set("studentCheck", studentCheck);

		return "note";
	}

	public String addStudentNote() throws IOException {

		studentCheckService.addStudentNote(model);

		return NONE;
	}

	/**
	 * 教师在教师端帮助学生签到页面数据的查询
	 * @return
	 * @throws IOException
	 */
	public String t_pageQuery() throws IOException {

		// TODO
		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginTeacher");
		Classes classes = teacher.getClasses();
		List<StudentCheck> list = null;
		StudentCheck studentCheck = null;
		Student student = null;
		if (classes != null) {
			String id = classes.getId();
			list = studentCheckService.findByclassIdAndDay(id);
		}
		boolean flag = false;
		StringBuffer buffer = new StringBuffer();
		buffer.append("{\"nianjibanhao\":{");
		if (classes != null && classes.getGrade() != null) {
			buffer.append("\"nianji\":\"" + classes.getGrade().getName() + "\",");
		} else {
			buffer.append("\"nianji\":\"\",");
		}
		if (classes != null) {
			buffer.append("\"banhao\":\"" + classes.getClass_name() + "\"},");
		} else {
			buffer.append("\"banhao\":\"\"},");
		}

		if (list == null) {
			buffer.deleteCharAt(buffer.length() - 1);
		}

		if (list != null && list.size() > 0) {
			buffer.append("\"arrive\":{");
			buffer.append("\"finsheds\": [");
			for (int i = 0; i < list.size(); i++) {
				studentCheck = list.get(i);
				student = studentCheck.getStudent();
				if ("3".equals(studentCheck.getStatus())) {
					buffer.append("{");
					buffer.append("\"isVacated\": \"False\",");
					buffer.append("\"sexLabel\": \"" + student.getSex() + "\",");
					buffer.append("\"studentId\": \"" + student.getId() + "\",");
					buffer.append("\"studentNumber\": \"" + student.getStudent_no()+ "\",");
					buffer.append("\"studentName\": \"" + student.getName() + "\"");
					buffer.append("},");
					flag = true;
				}
			}
			if (flag) {
				buffer.deleteCharAt(buffer.length() - 1);
				flag = false;
			}
			buffer.append("],");
			buffer.append("\"unfinsheds\": [");

			for (int i = 0; i < list.size(); i++) {
				studentCheck = list.get(i);
				student = studentCheck.getStudent();
				if ("2".equals(studentCheck.getStatus())) {
					buffer.append("{");
					buffer.append("\"isVacated\": \"False\",");
					buffer.append("\"sexLabel\": \"" + student.getSex() + "\",");
					buffer.append("\"studentId\": \"" + student.getId() + "\",");
					buffer.append("\"studentNumber\": \"" + student.getStudent_no()+ "\",");
					buffer.append("\"studentName\": \"" + student.getName() + "\"");
					buffer.append("},");
					flag = true;
				}
			}
			if (flag) {
				buffer.deleteCharAt(buffer.length() - 1);
				flag = false;
			}
			buffer.append("]");
			buffer.append("},");

			buffer.append("\"leave\":{");
			buffer.append("\"finsheds\": [");
			for (int i = 0; i < list.size(); i++) {
				studentCheck = list.get(i);
				student = studentCheck.getStudent();
				if ("4".equals(studentCheck.getStatus())) {
					buffer.append("{");
					buffer.append("\"isVacated\": \"False\",");
					buffer.append("\"sexLabel\": \"" + student.getSex() + "\",");
					buffer.append("\"studentId\": \"" + student.getId() + "\",");
					buffer.append("\"studentNumber\": \"" + student.getStudent_no()+ "\",");
					buffer.append("\"studentName\": \"" + student.getName() + "\"");
					buffer.append("},");
					flag = true;
				}
			}
			if (flag) {
				buffer.deleteCharAt(buffer.length() - 1);
				flag = false;
			}
			buffer.append("],");
			buffer.append("\"unfinsheds\": [");
			for (int i = 0; i < list.size(); i++) {
				studentCheck = list.get(i);
				if ("3".equals(studentCheck.getStatus())) {
					buffer.append("{");
					buffer.append("\"isVacated\": \"False\",");
					buffer.append("\"sexLabel\": \"" + student.getSex() + "\",");
					buffer.append("\"studentId\": \"" + student.getId() + "\",");
					buffer.append("\"studentNumber\": \"" + student.getStudent_no()+ "\",");
					buffer.append("\"studentName\": \"" + student.getName() + "\"");
					buffer.append("},");
					flag = true;
				}
			}
			if (flag) {
				buffer.deleteCharAt(buffer.length() - 1);
				flag = false;
			}
			buffer.append("]");
		}
		buffer.append("},");

		buffer.append("\"ok\": \"True\",");
		buffer.append("\"serverTime\": \"" + TimeUtil.getCurrentTime() + "\"");
		buffer.append("}");

		String json = buffer.toString();
		JsonUtil.writeJson(json);

		return NONE;
	}

	/**
	 * 老师在教师端帮助学生签到页面的打开
	 * @return
	 */
	public String t_studentComeAndGo() {

		if ("1".equals(flag)) {
			ServletActionContext.getContext().getValueStack().set("flag", "1");
		}

		return "t_studentComeAndGo";
	}

	/**
	 * 老师在教师端帮助学生签到
	 * @return
	 * @throws IOException 
	 */
	public String t_addStudentCheck() throws IOException {

		String student_id = model.getStudent_id();
		studentCheckService.taddStudentCheck(student_id);

		return NONE;
	}

	/**
	 * 家长在家长端帮助学生签到
	 * @return
	 */
	public String p_addStudentCheck() throws IOException {

		studentCheckService.paddStudentCheck();

		return NONE;
	}

}
