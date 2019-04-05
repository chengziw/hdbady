package com.hrbhd.bady.web.action;

import java.awt.image.BufferedImageFilter;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.servlet.ServletInputStream;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.aspectj.apache.bcel.generic.MULTIANEWARRAY;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.CookBook;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.HomeWork;
import com.hrbhd.bady.domain.School;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.service.IClassesService;
import com.hrbhd.bady.service.IGradeService;
import com.hrbhd.bady.service.IHomeWorkService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.MD5Utils;
import com.hrbhd.bady.util.TimeUtil;
import com.hrbhd.bady.web.action.base.BaseAction;

import freemarker.core.Node;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

@Controller
@Scope("prototype")
public class HomeWorkAction extends BaseAction<HomeWork> {

	@Autowired
	private IHomeWorkService homeWorkService;
	@Autowired
	private IClassesService classesService;

	private String page;
	private String rows;
	private String tag;

	private String class_id;
	private String subject_id;

	private String start_time;
	private String end_time;
	private String teacher_name;

	private File fileselect[];
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

	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}

	public void setSubject_id(String subject_id) {
		this.subject_id = subject_id;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}

	public void setFileselect(File[] fileselect) {
		this.fileselect = fileselect;
	}
	
	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	public String pageQuery() throws IOException {

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));
		
		if ("1".equals(tag)) {
			homeWorkService.termQuery(model, pageBean, detachedCriteria, class_id, subject_id, start_time,
					end_time, teacher_name);
		}

		homeWorkService.pageQuery(pageBean);

		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[] { "year_month_day_format" });
		config.setJsonPropertyFilter(new PropertyFilter() {

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

	public String about() {

		String id = model.getId();
		HomeWork homeWork = homeWorkService.findById(id);
		ServletActionContext.getContext().getValueStack().set("homeWork", homeWork);

		return "about";
	}
	
	/*
	 * 手机端操作
	 */
	public String t_homeWork() {
		

		return "t_homeWork";
	}

	/*
	 * 手机端操作
	 */
	public String t_add() {

		return "t_add";
	}

	/*
	 * 手机端操作
	 */
	public String t_addHomeWork() throws IOException {

		homeWorkService.taddHomeWork(fileselect,model);

		//return NONE;
		return "t_homeWork";
	}


	public String t_pageQuery() throws IOException {
		
		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));
		homeWorkService.pageQuery(pageBean);
		List<HomeWork> list = pageBean.getRows();
		//List<HomeWork> list = homeWorkService.findAll();
		HomeWork homeWork = null;
		Classes classes = null;
		Grade grade = null;
		StringBuffer buffer = new StringBuffer();
		buffer.append("{\"hasMore\": true,\"homeworklist\":[");
		for (int i = 0; i < list.size(); i++) {
			homeWork = list.get(i);
			classes = homeWorkService.getClasses(homeWork);
			grade = homeWorkService.getGrade(classes);
			buffer.append("{");
			buffer.append("\"audio_url\":\"url\",");
			buffer.append("\"classlist\": {\"classid\": \"" + classes.getId() + "\",\"classname\": \""
					+ classes.getClass_name() + "\",\"gradeid\": \"" + grade.getId() + "\",\"gradname\": \""
					+ grade.getName() + "\"},");
			buffer.append("\"content\": \"" + classes.getNote() + "\",");
			buffer.append("\"create_time\": \"" + TimeUtil.getCurrentTime() + "\",");
			buffer.append("\"duration\": 0,");
			buffer.append("\"iscurrentterm\": \"true\",");
			buffer.append("\"status\": 1,");
			buffer.append("\"subjectid\": 5,");
			buffer.append("\"homeworkid\": \"" + homeWork.getId() + "\",");
			buffer.append("\"subjectname\": \"数学\",");
			int size = homeWork.getImageUrlSize();
			buffer.append("\"images\": [");
			for (int j = 0; j < size; j++) {
				buffer.append("{");
				buffer.append("\"imgurl\": \"image/homework/" + homeWork.getToImageUrl(j) + "\"");
				if (j == size - 1) {
					buffer.append("}");
				} else {
					buffer.append("},");
				}
			}
			buffer.append("]");
			if (i == list.size() - 1) {
				buffer.append("}");
			} else {
				buffer.append("},");
			}
		}

		buffer.append("],");
		buffer.append("\"servertime\": \"" + TimeUtil.getCurrentTime() + "\"");
		buffer.append("}");

		String json = buffer.toString();
		System.out.println(json);
		JsonUtil.writeJson(json);

		return NONE;
	}

	public String p_homeWork() {
		
		if("1".equals(flag)){
			ServletActionContext.getContext().getValueStack().set("flag", "1");
		}
		
		return "p_homeWork";
	}
	
	public String p_pageQuery() throws IOException {
		
		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));
		homeWorkService.pageQuery(pageBean);
		List<HomeWork> list = pageBean.getRows();
		
		//List<HomeWork> list = homeWorkService.findAll();
		HomeWork homeWork = null;
		Classes classes = null;
		Grade grade = null;
		StringBuffer buffer = new StringBuffer();
		buffer.append("{\"hasMore\": true,\"homeworklist\":[");
		for (int i = 0; i < list.size(); i++) {
			homeWork = list.get(i);
			classes = homeWorkService.getClasses(homeWork);
			grade = homeWorkService.getGrade(classes);
			buffer.append("{");
			buffer.append("\"audio_url\":\"url\",");
			buffer.append("\"classlist\": {\"classid\": \"" + classes.getId() + "\",\"classname\": \""
					+ classes.getClass_name() + "\",\"gradeid\": \"" + grade.getId() + "\",\"gradname\": \""
					+ grade.getName() + "\"},");
			buffer.append("\"content\": \"" + classes.getNote() + "\",");
			buffer.append("\"create_time\": \"" + TimeUtil.getCurrentTime() + "\",");
			buffer.append("\"duration\": 0,");
			buffer.append("\"iscurrentterm\": \"true\",");
			buffer.append("\"status\": 1,");
			buffer.append("\"subjectid\": 5,");
			buffer.append("\"homeworkid\": \"" + homeWork.getId() + "\",");
			buffer.append("\"subjectname\": \"数学\",");
			int size = homeWork.getImageUrlSize();
			buffer.append("\"images\": [");
			for (int j = 0; j < size; j++) {
				buffer.append("{");
				buffer.append("\"imgurl\": \"image/homework/" + homeWork.getToImageUrl(j) + "\"");
				if (j == size - 1) {
					buffer.append("}");
				} else {
					buffer.append("},");
				}
			}
			buffer.append("]");
			if (i == list.size() - 1) {
				buffer.append("}");
			} else {
				buffer.append("},");
			}
		}

		buffer.append("],");
		buffer.append("\"servertime\": \"" + TimeUtil.getCurrentTime() + "\"");
		buffer.append("}");

		String json = buffer.toString();
		System.out.println(json);
		JsonUtil.writeJson(json);

		return NONE;
	}

}
