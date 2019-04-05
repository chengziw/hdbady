package com.hrbhd.bady.web.action;

import java.io.IOException;

import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ddf.EscherSerializationListener;
import org.apache.struts2.components.If;
import org.aspectj.weaver.AjAttribute.PrivilegedAttribute;
import org.hibernate.transform.ResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.domain.ClassType;
import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.StudentBespeak;
import com.hrbhd.bady.domain.StudentCheck;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.domain.TeacherDuty;
import com.hrbhd.bady.service.IClassesChangeLogService;
import com.hrbhd.bady.service.IClassesService;
import com.hrbhd.bady.service.IGradeService;
import com.hrbhd.bady.service.ITeacherService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.web.action.base.BaseAction;
import com.opensymphony.xwork2.ActionContext;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

@Controller
@Scope("prototype")
public class ClassesAction extends BaseAction<Classes> {

	@Autowired
	private IClassesService classesService;
	@Autowired
	private IGradeService gradeService;
	@Autowired
	private ITeacherService teacherService;
	@Autowired
	private IClassesChangeLogService classesChangeLogService;

	private String page;
	private String rows;
	private String tag;

	// TODO下面几个没斜线的还没有做完
	private static final String CLASSES_ADD = "创建";//
	private static final String CLASSES_UPGRADE = "升级";
	private static final String CLASSES_FINISHSCHOOL = "毕业";
	private static final String CLASSES_DELETE = "删除";//
	private static final String CLASSES_CHANG_TEACHER = "班主任变动";

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
			classesService.termQuery(model, pageBean, detachedCriteria);
		}

		classesService.pageQuery(pageBean);

		// 查询班级学生人数
		List<Classes> list = pageBean.getRows();
		classesService.setStudentNumbers(list);
		//
		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[] { "students", "studentBespeaks", "curriculaTable", "classesChangeLogs" ,"homeWorks","cookBooks","studentChecks"});
		config.setJsonPropertyFilter(new PropertyFilter() {

			@Override
			public boolean apply(Object source, String name, Object value) {
				if (source instanceof Grade && name.equals("classes")) {
					return true;
				}
				if (source instanceof Grade && name.equals("subjects")) {
					return true;
				}
				if (source instanceof ClassType && name.equals("classes")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("roles")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("asks")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("notices")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("teacherDuty")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("structure")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("teacherVacations")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("teacherChecks")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("teacherMonthChecks")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("entry_time_name_date")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("classes")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("askTeacherChecks")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("noticeTeacherChecks")) {
					return true;
				}
			
				String name2 = source.getClass().getName();
				System.out.println("////////////////////////////////////////////////");
				System.out.println(name2);
				System.out.println("////////////////////////////////////////////////");
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

	public String edit() {

		String id = model.getId();
		Classes classes = classesService.findById(id);
		Teacher teacher = classesService.getTeacher(classes);
		//Teacher teacher = classes.getTeacher();
		ActionContext.getContext().getValueStack().set("classes", classes);
		ActionContext.getContext().getValueStack().set("teacher", teacher);
		return "edit";
	}

	public String delete() {

		String id = model.getId();
		Classes classes = classesService.findById(id);
		ActionContext.getContext().getValueStack().set("classes", classes);
		return "delete";
	}

	public String findClassByClassNameAndGradeId() throws IOException {

		String json = "";
		String id = model.getId();
		// String grade = model.getGrade();
		// Grade grade = model.getGrade();
		// String grade_name = grade.getName();
		String class_name = model.getClass_name();

		if (id != null) {

			String grade_id = model.getGrade_id();
			Classes classes = classesService.findById(id);
			String DBclass_name = classes.getClass_name();
			List<Classes> list = classesService.findClassByClassNameAndGrade(class_name, grade_id);
			if (!class_name.equals(DBclass_name) && list.size() > 0) {
				json = "{\"flag\":false}";
			} else {
				//classesService.editClass(model);
				json = "{\"flag\":true}";
			}

		} else {
			String grade_id = model.getGrade_id();
			List<Classes> list = classesService.findClassByClassNameAndGrade(class_name, grade_id);
			if (list != null && list.size() > 0) {
				json = "{\"flag\":flase}";
			} else {
				json = "{\"flag\":true}";
			}
		}

		JsonUtil.writeJson(json);
		return NONE;
	}

	public String addClass() throws IOException {

		String json ="";
		String class_name = model.getClass_name();
		String grade_id = model.getGrade_id();
		String teacher_id = model.getTeacher_id();
		List<Classes> list = classesService.findClassByClassNameAndGrade(class_name, grade_id);
		if(list!=null&&list.size()>0){
			json = "{\"errMeg\":\"在该年级下已经存在此班级名称\"}";
			JsonUtil.writeJson(json);
			return NONE;
		}
		Teacher teacher = teacherService.findById(teacher_id);
		String class_id = teacher.getClass_id();
		if(StringUtils.isNotBlank(class_id)){
			json = "{\"errMeg\":\"该老师已有所属班级\"}";
			JsonUtil.writeJson(json);
			return NONE;
		}

		classesService.addClass(model, CLASSES_ADD);
		String id = model.getId();
		Classes classes = classesService.findById(id);
		classesChangeLogService.addLog(classes, CLASSES_ADD);
		json = "{\"errMeg\":\"\"}";
		JsonUtil.writeJson(json);

		return NONE;
	}

	public String editClass() throws IOException {
		
		String json ="";
		String id = model.getId();
		String class_name = model.getClass_name();
		String teacher_id = model.getTeacher_id();
		Classes classes = classesService.findById(id);
		String grade_id = classes.getGrade_id();
		String DBclass_name = classes.getClass_name();
		List<Classes> list = classesService.findClassByClassNameAndGrade(class_name, grade_id);
		if(!DBclass_name.equals(class_name)&&list!=null&&list.size()>0){
			json = "{\"errMeg\":\"在该年级下已经存在此班级名称\"}";
			JsonUtil.writeJson(json);
			return NONE;
		}
		
		Teacher teacher = teacherService.findById(teacher_id);
		String class_id = teacher.getClass_id();
		if(!id.equals(class_id)&&StringUtils.isNotBlank(class_id)){
			json = "{\"errMeg\":\"该老师已有所属班级\"}";
			JsonUtil.writeJson(json);
			return NONE;
		}

		classesService.editClass(model);

		return NONE;
	}

	public String deleteClass() throws IOException {
		classesService.deleteClass(model, CLASSES_DELETE);
		String json = "{\"errMeg\":\"\"}";
		JsonUtil.writeJson(json);
		return NONE;
	}

	public String findAllClass() throws IOException {

		List<Classes> list = classesService.findAllClass();
		System.out.println(list.get(0));
		if (list != null && list.size() > 0) {
			StringBuffer buffer = new StringBuffer();
			buffer.append("[{\"id\":\"\",\"name\":\"请选择\",\"selected\":true}");
			// buffer.append("[");

			System.out.println("shou");
			for (Classes classes : list) {
				buffer.append(
						",{\"id\":\"" + classes.getClass_name() + "\",\"name\":\"" + classes.getClass_name() + "\"}");
				// buffer.append("{\"id\":\""+classes.getClass_name()+"\",\"name\":\""+classes.getClass_name()+"\"}");

			}

			buffer.append("]");
			String json = buffer.toString();
			JsonUtil.writeJson(json);
		}
		return NONE;
	}
	
	public String findAllClassToSearch() throws IOException {

		List<Classes> list = classesService.findAllClass();
		System.out.println(list.get(0));
		if (list != null && list.size() > 0) {
			StringBuffer buffer = new StringBuffer();
			buffer.append("[{\"id\":\"\",\"name\":\"全部班级\",\"selected\":true}");
			// buffer.append("[");

			System.out.println("shou");
			for (Classes classes : list) {
				buffer.append(
						",{\"id\":\"" + classes.getId() + "\",\"name\":\"" + classes.getClass_name() + "\"}");
				// buffer.append("{\"id\":\""+classes.getClass_name()+"\",\"name\":\""+classes.getClass_name()+"\"}");

			}

			buffer.append("]");
			String json = buffer.toString();
			JsonUtil.writeJson(json);
		}
		return NONE;
	}
	
	public String findAllClassToLogSearch() throws IOException {

		List<Classes> list = classesService.findAllClass();
		System.out.println(list.get(0));
		if (list != null && list.size() > 0) {
			StringBuffer buffer = new StringBuffer();
			buffer.append("[{\"id\":\"\",\"name\":\"全部班级\",\"selected\":true}");
			// buffer.append("[");

			System.out.println("shou");
			for (Classes classes : list) {
				buffer.append(
						",{\"id\":\"" + classes.getClass_name() + "\",\"name\":\"" + classes.getClass_name() + "\"}");
				// buffer.append("{\"id\":\""+classes.getClass_name()+"\",\"name\":\""+classes.getClass_name()+"\"}");

			}

			buffer.append("]");
			String json = buffer.toString();
			JsonUtil.writeJson(json);
		}
		return NONE;
	}


	public String findAllClassByGrade() throws IOException {

		// String grade = model.getGrade();
		Grade grade = model.getGrade();
		String grade_name = grade.getName();
		grade_name = new String(grade_name.getBytes("iso8859-1"), "utf-8");
		List<Classes> list = classesService.findAllClassByGrade(grade);

		if (list != null && list.size() > 0) {
			StringBuffer buffer = new StringBuffer();
			buffer.append("[{\"id\":\"\",\"name\":\"请选择\"}");

			System.out.println("shou");
			for (Classes classes : list) {
				buffer.append(
						",{\"id\":\"" + classes.getClass_name() + "\",\"name\":\"" + classes.getClass_name() + "\"}");
			}

			buffer.append("]");
			String json = buffer.toString();
			System.out.println(json);
			JsonUtil.writeJson(json);
		}
		

		return NONE;
	}

	public String findAllClassByGradeId() throws IOException {

		// String grade = model.getGrade();//
		/*
		 * Grade grade = model.getGrade(); String grade_name = grade.getName();
		 * grade_name = new String(grade_name.getBytes("iso8859-1"),"utf-8");
		 * List<Classes> list = classesService.findAllClassByGrade(grade_name);
		 */
		String grade_id = model.getId();
		grade_id = new String(grade_id.getBytes("iso8859-1"), "utf-8");
		Grade grade = gradeService.findById(grade_id);
		List<Classes> list = classesService.findByGrade(grade);

		if (list != null && list.size() > 0) {
			StringBuffer buffer = new StringBuffer();
			buffer.append("[{\"id\":\"\",\"name\":\"请选择\"}");

			System.out.println("shou");
			for (Classes classes : list) {
				buffer.append(",{\"id\":\"" + classes.getId() + "\",\"name\":\"" + classes.getClass_name() + "\"}");
			}

			buffer.append("]");
			String json = buffer.toString();
			System.out.println(json);
			JsonUtil.writeJson(json);
		}

		return NONE;
	}

	public String findAllClassByGradeToSelect() throws IOException {

		// String grade = model.getGrade();//
		Grade grade = model.getGrade();
		String grade_name = grade.getName();
		grade_name = new String(grade_name.getBytes("iso8859-1"), "utf-8");
		List<Classes> list = classesService.findAllClassByGrade(grade);

		if (list != null && list.size() > 0) {
			StringBuffer buffer = new StringBuffer();
			buffer.append("[");

			for (int i = 0; i < list.size(); i++) {
				if (i == list.size() - 1) {
					buffer.append("{\"id\":\"" + list.get(i).getClass_name() + "\",\"name\":\""
							+ list.get(i).getClass_name() + "\"}");
				} else {
					buffer.append("{\"id\":\"" + list.get(i).getClass_name() + "\",\"name\":\""
							+ list.get(i).getClass_name() + "\"},");
				}
			}

			buffer.append("]");

			String json = buffer.toString();
			System.out.println(json);
			JsonUtil.writeJson(json);
		}

		return NONE;
	}

	public String findAllClassByGradeIdToSearch() throws IOException {

		/*
		 * Grade grade = model.getGrade(); String grade_name = grade.getName();
		 * grade_name = new String(grade_name.getBytes("iso8859-1"),"utf-8");
		 * List<Classes> list = classesService.findAllClassByGrade(grade);
		 * 
		 * if(list!=null&&list.size()>0){ StringBuffer buffer = new
		 * StringBuffer();
		 * buffer.append("[{\"id\":\"\",\"name\":\"全部班级\",\"selected\":true}");
		 * 
		 * System.out.println("shou"); for (Classes classes : list) {
		 * buffer.append(",{\"id\":\""+classes.getClass_name()+"\",\"name\":\""+
		 * classes.getClass_name()+"\"}"); }
		 * 
		 * buffer.append("]"); String json = buffer.toString();
		 * System.out.println(json); JsonUtil.writeJson(json); }
		 */

		String grade_id = model.getId();
		Grade grade = gradeService.findById(grade_id);
		List<Classes> list = classesService.findByGrade(grade);

		if (list != null && list.size() > 0) {
			StringBuffer buffer = new StringBuffer();
			buffer.append("[{\"id\":\"\",\"name\":\"全部班级\"}");

			System.out.println("shou");
			for (Classes classes : list) {
				buffer.append(",{\"id\":\"" + classes.getId() + "\",\"name\":\"" + classes.getClass_name() + "\"}");
			}

			buffer.append("]");
			String json = buffer.toString();
			System.out.println(json);
			JsonUtil.writeJson(json);

		}
		else{
			StringBuffer buffer = new StringBuffer();
			buffer.append("[{\"id\":\"\",\"name\":\"没有班级\"}]");
			String json = buffer.toString();
			System.out.println(json);
			JsonUtil.writeJson(json);
		}
		return NONE;
	}

	/**
	 * 手机端操作
	 * @return
	 */
	public String t_classRing(){
		
		return "t_classRing";
	}
	
}
