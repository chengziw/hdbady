package com.hrbhd.bady.web.action;

import java.awt.image.BufferedImageFilter;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;


import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Scope;
import org.springframework.jdbc.support.CustomSQLExceptionTranslatorRegistrar;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.dao.ISubjectDao;
import com.hrbhd.bady.domain.ClassType;
import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.CurriculaTable;
import com.hrbhd.bady.domain.CurriculaTableItem;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.Schedule;
import com.hrbhd.bady.domain.Structure;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.domain.TeacherDuty;
import com.hrbhd.bady.service.ICurriculaTableItemService;
import com.hrbhd.bady.service.ICurriculaTableService;
import com.hrbhd.bady.service.IScheduleService;
import com.hrbhd.bady.service.ISubjectService;
import com.hrbhd.bady.service.ITeacherService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.web.action.base.BaseAction;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.JSONUtils;
import net.sf.json.util.PropertyFilter;

@Controller
@Scope("prototype")
public class CurriculaTableAction extends BaseAction<CurriculaTable> {

	@Autowired
	private ICurriculaTableService curriculaTableService;
	@Autowired
	private ICurriculaTableItemService curriculaTableItemService;
	@Autowired
	private IScheduleService scheduleService;
	@Autowired
	private ITeacherService teacherService;
	@Autowired
	private ISubjectService subjectService;

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

	private String[] ids;
	private String[] weeks;
	private String[] courses;
	private String[] subject_names;
	private String[] teacher_ids;
	private String[] teacher_names;

	public void setIds(String[] ids) {
		this.ids = ids;
	}

	public void setWeeks(String[] weeks) {
		this.weeks = weeks;
	}

	public void setCourses(String[] courses) {
		this.courses = courses;
	}

	public void setSubject_names(String[] subject_names) {
		this.subject_names = subject_names;
	}

	public void setTeacher_ids(String[] teacher_ids) {
		this.teacher_ids = teacher_ids;
	}

	public void setTeacher_names(String[] teacher_names) {
		this.teacher_names = teacher_names;
	}

	public String pageQuery() throws IOException {

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));

		if ("1".equals(tag)) {
			curriculaTableService.termQuery(model, pageBean, detachedCriteria);
		}

		curriculaTableService.pageQuery(pageBean);

		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] { "curriculaTableItems" });
		jsonConfig.setJsonPropertyFilter(new PropertyFilter() {

			@Override
			public boolean apply(Object source, String name, Object value) {
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
				if (source instanceof Grade && name.equals("classes")) {
					return true;
				}
				if (source instanceof Grade && name.equals("subjects")) {
					return true;
				}
				String name2 = source.getClass().getName();
				System.out.println("////////////////////////////////////////////////");
				System.out.println(name2);
				System.out.println("////////////////////////////////////////////////");
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
		return NONE;

	}

	public String add() {

		List<Schedule> list = scheduleService.findAll();
		if (list != null && list.size() > 0) {
			Schedule schedule = list.get(0);

			int dayNum = Integer.parseInt(schedule.getDayNum());
			int morning_has_num = Integer.parseInt(schedule.getMorning_has_num());
			int afternoon_has_num = Integer.parseInt(schedule.getAfternoon_has_num());
			String week_type_label = schedule.getWeek_type_label();

			ServletActionContext.getContext().put("dayNum", dayNum);
			ServletActionContext.getContext().put("morning_has_num", morning_has_num);
			ServletActionContext.getContext().put("afternoon_has_num", afternoon_has_num);
			ServletActionContext.getContext().put("week_type_label", week_type_label);
			
			String start_end_time = schedule.getStart_end_time();
			String[] start_end_times = start_end_time.split(",");
			ServletActionContext.getContext().put("start_end_times", start_end_times);

			String[][] teacherinputs = new String[morning_has_num + afternoon_has_num][dayNum];
			for (int i = 0; i < morning_has_num + afternoon_has_num; i++) {
				for (int j = 0; j < dayNum; j++) {
					teacherinputs[i][j] = "teacherinput" + i + j;
				}
			}
			ServletActionContext.getContext().put("teacherinputs", teacherinputs);

			String teacherJson = teacherService.findAllTeacherToCurriculaTableAdd();
			ServletActionContext.getContext().put("teacherJson", teacherJson);

			String subjectJson = subjectService.findAllSubjectToCurriculaTableAdd();
			ServletActionContext.getContext().put("subjectJson", subjectJson);

		}
		return "add";
	}

	public String look() {

		String id = model.getId();
		CurriculaTable curriculaTable = curriculaTableService.findById(id);

		int dayNum = Integer.parseInt(curriculaTable.getDayNum());
		int morning_has_num = Integer.parseInt(curriculaTable.getMorning_has_num());
		int afternoon_has_num = Integer.parseInt(curriculaTable.getAfternoon_has_num());
		String week_type_label = curriculaTable.getWeek_type_label();

		ServletActionContext.getContext().put("dayNum", dayNum);
		ServletActionContext.getContext().put("morning_has_num", morning_has_num);
		ServletActionContext.getContext().put("afternoon_has_num", afternoon_has_num);
		ServletActionContext.getContext().put("week_type_label", week_type_label);

		String start_end_time = curriculaTable.getStart_end_time();
		String[] start_end_times = start_end_time.split(",");
		ServletActionContext.getContext().put("start_end_times", start_end_times);

		List<CurriculaTableItem> items = curriculaTableService.getCurriculaTableItems(model);

		System.out.println(items.size());

		int k = 0;
		int l = 0;
		String[][] teacher_names = new String[morning_has_num + afternoon_has_num][dayNum];
		String[][] subject_names = new String[morning_has_num + afternoon_has_num][dayNum];
		for (int i = 0; i < morning_has_num + afternoon_has_num; i++) {
			for (int j = 0; j < dayNum; j++) {
				teacher_names[i][j] = items.get(k++).getTeacher_name();
				subject_names[i][j] = items.get(l++).getSubject_name();
			}
		}

		ServletActionContext.getContext().put("teacher_names", teacher_names);
		ServletActionContext.getContext().put("subject_names", subject_names);

		return "look";
	}

	public String edit() {

		String id = model.getId();
		CurriculaTable curriculaTable = curriculaTableService.findById(id);
		ServletActionContext.getContext().getValueStack().set("curriculaTable", curriculaTable);

		int dayNum = Integer.parseInt(curriculaTable.getDayNum());
		int morning_has_num = Integer.parseInt(curriculaTable.getMorning_has_num());
		int afternoon_has_num = Integer.parseInt(curriculaTable.getAfternoon_has_num());
		String week_type_label = curriculaTable.getWeek_type_label();
		
		ServletActionContext.getContext().put("dayNum", dayNum);
		ServletActionContext.getContext().put("morning_has_num", morning_has_num);
		ServletActionContext.getContext().put("afternoon_has_num", afternoon_has_num);
		ServletActionContext.getContext().put("week_type_label", week_type_label);

		String start_end_time = curriculaTable.getStart_end_time();
		String[] start_end_times = start_end_time.split(",");
		ServletActionContext.getContext().put("start_end_times", start_end_times);

		String[][] teacherinputs = new String[morning_has_num + afternoon_has_num][dayNum];
		for (int i = 0; i < morning_has_num + afternoon_has_num; i++) {
			for (int j = 0; j < dayNum; j++) {
				teacherinputs[i][j] = "teacherinput" + i + j;
			}
		}
		ServletActionContext.getContext().put("teacherinputs", teacherinputs);

		List<CurriculaTableItem> items = curriculaTableService.getCurriculaTableItems(model);

		int k = 0;
		int l = 0;
		int m = 0;
		
		String[][] teacher_names = new String[morning_has_num + afternoon_has_num][dayNum];
		String[][] subject_names = new String[morning_has_num + afternoon_has_num][dayNum];
		String[][] weeks = new String[morning_has_num+afternoon_has_num][dayNum];
		String[][] course = new String[morning_has_num+afternoon_has_num][dayNum];
		String[][] ids = new String[morning_has_num + afternoon_has_num][dayNum];
		for (int i = 0; i < morning_has_num + afternoon_has_num; i++) {
			for (int j = 0; j < dayNum; j++) {
				teacher_names[i][j] = items.get(k++).getTeacher_name();
				subject_names[i][j] = items.get(l++).getSubject_name();
				ids[i][j] = items.get(m++).getId();
			}
		}

		ServletActionContext.getContext().put("teacher_names", teacher_names);
		ServletActionContext.getContext().put("subject_names", subject_names);
		ServletActionContext.getContext().put("ids", ids);

		String teacherJson = teacherService.findAllTeacherToCurriculaTableAdd();
		ServletActionContext.getContext().put("teacherJson", teacherJson);

		String subjectJson = subjectService.findAllSubjectToCurriculaTableAdd();
		ServletActionContext.getContext().put("subjectJson", subjectJson);

		/*
		 * String class_name = curriculaTable.getClass_name(); String grade_name
		 * = curriculaTable.getGrade_name(); Classes classes =
		 * classesService.findById(class_name); Grade grade =
		 * gradeService.findById(grade_name); class_name =
		 * classes.getClass_name(); grade_name = grade.getName();
		 * ServletActionContext.getContext().put("class_name", class_name);
		 * ServletActionContext.getContext().put("grade_name", grade_name);
		 */

		return "edit";
	}

	public String deleteCurriculaTable() throws IOException {

		curriculaTableService.deleteCurriculaTable(model);

		return NONE;
	}

	public String publishCurriculaTable() throws IOException {

		curriculaTableService.publishCurriculaTable(model);

		return NONE;
	}

	public String addCurriculaTable() throws IOException {

		curriculaTableService.addCurriculaTable(model, weeks, courses, subject_names, teacher_ids, teacher_names);

		return NONE;
	}

	public String editCurriculaTable() throws IOException {

		curriculaTableService.editCurriculaTable(model, ids, subject_names, teacher_ids, teacher_names);

		return NONE;
	}

	/**
	 * ÊÖ»ú¶Ë²Ù×÷
	 * 
	 * @return
	 */
	public String t_classCurricula() {

		return "t_classCurricula";
	}

	public String p_classCurricula() {

		return "p_classCurricula";
	}
	
	public String t_look() throws IOException {
		
		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginTeacher");
		Classes classes = curriculaTableService.getClasses(teacher);
		if(classes==null){
			return NONE;
		}
		String cid = classes.getId();
		CurriculaTable curriculaTable = curriculaTableService.findByClassId(cid);
		if(curriculaTable==null){
			return NONE;
		}
		String id = curriculaTable.getId();
		List<CurriculaTableItem> list = curriculaTableItemService.findByCurriculaTableId(id);
		//TODO
		//String id = model.getId();
		//CurriculaTable curriculaTable = curriculaTableService.findById(id);
		//List<CurriculaTableItem> list = curriculaTableItemService.findByCurriculaTableId(id);

		int dayNum = Integer.parseInt(curriculaTable.getDayNum());
		int morning_has_num = Integer.parseInt(curriculaTable.getMorning_has_num());
		int afternoon_has_num = Integer.parseInt(curriculaTable.getAfternoon_has_num());
		String week_type_label = curriculaTable.getWeek_type_label();
		
		int k = 0;
		StringBuffer buffer = new StringBuffer();
		
		buffer.append("{");
		
		buffer.append("\"dayNum\": \""+dayNum+"\",");     
		buffer.append("\"week_type_label\": \""+week_type_label+"\",");  
		buffer.append("\"morning_has_num\": \""+morning_has_num+"\",");  
		buffer.append("\"afternoon_has_num\": \""+afternoon_has_num+"\",");
		
		buffer.append("\"rows\": [");
		
		for(int i=0;i<dayNum;i++){
			for(int j=0;j<morning_has_num+afternoon_has_num;j++){
				
				CurriculaTableItem curriculaTableItem = list.get(k);
				String teacher_name = curriculaTableItem.getTeacher_name();
				String subject_name = curriculaTableItem.getSubject_name();
				
				buffer.append("{");
				buffer.append("\"teacher_name\": \""+teacher_name+"\",");
				buffer.append("\"afternoon_has_num\": \""+subject_name+"\"");
				buffer.append("},");
				
				k++;
			}
		}
		
		buffer.deleteCharAt(buffer.length()-1);

		buffer.append("]");
		buffer.append("}");

		String json = buffer.toString();
		JsonUtil.writeJson(json);
		
		return NONE;
	}
	
	
	public String p_look() throws IOException {
		
		Student student = (Student) ServletActionContext.getRequest().getSession().getAttribute("loginParent");
		Classes classes = curriculaTableService.getClasses(student);
		if(classes==null){
			return NONE;
		}
		String cid = classes.getId();
		CurriculaTable curriculaTable = curriculaTableService.findByClassId(cid);
		if(curriculaTable==null){
			return NONE;
		}
		String id = curriculaTable.getId();
		List<CurriculaTableItem> list = curriculaTableItemService.findByCurriculaTableId(id);
		//TODO
		//String id = model.getId();
		//CurriculaTable curriculaTable = curriculaTableService.findById(id);
		//List<CurriculaTableItem> list = curriculaTableItemService.findByCurriculaTableId(id);

		int dayNum = Integer.parseInt(curriculaTable.getDayNum());
		int morning_has_num = Integer.parseInt(curriculaTable.getMorning_has_num());
		int afternoon_has_num = Integer.parseInt(curriculaTable.getAfternoon_has_num());
		String week_type_label = curriculaTable.getWeek_type_label();
		
		int k = 0;
		StringBuffer buffer = new StringBuffer();
		
		buffer.append("{");
		
		buffer.append("\"dayNum\": \""+dayNum+"\",");     
		buffer.append("\"week_type_label\": \""+week_type_label+"\",");  
		buffer.append("\"morning_has_num\": \""+morning_has_num+"\",");  
		buffer.append("\"afternoon_has_num\": \""+afternoon_has_num+"\",");
		
		buffer.append("\"rows\": [");
		
		for(int i=0;i<dayNum;i++){
			for(int j=0;j<morning_has_num+afternoon_has_num;j++){
				
				CurriculaTableItem curriculaTableItem = list.get(k);
				String teacher_name = curriculaTableItem.getTeacher_name();
				String subject_name = curriculaTableItem.getSubject_name();
				
				buffer.append("{");
				buffer.append("\"teacher_name\": \""+teacher_name+"\",");
				buffer.append("\"afternoon_has_num\": \""+subject_name+"\"");
				buffer.append("},");
				
				k++;
			}
		}
		
		buffer.deleteCharAt(buffer.length()-1);

		buffer.append("]");
		buffer.append("}");

		String json = buffer.toString();
		JsonUtil.writeJson(json);
		
		return NONE;
	}
	
	
}
