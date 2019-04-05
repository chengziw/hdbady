package com.hrbhd.bady.web.action;

import java.awt.image.BufferedImageFilter;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletInputStream;

import org.apache.struts2.ServletActionContext;
import org.aspectj.apache.bcel.generic.ReturnaddressType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.CookBook;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.HomeWork;
import com.hrbhd.bady.service.ICookBookService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.MD5Utils;
import com.hrbhd.bady.util.TimeUtil;
import com.hrbhd.bady.web.action.base.BaseAction;
import com.mchange.v2.async.StrandedTaskReporting;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

@Controller
@Scope("prototype")
public class CookBookAction extends BaseAction<CookBook> {

	@Autowired
	private ICookBookService cookBookService;

	private String page;
	private String rows;
	private String tag;

	private String class_id;
	private String grade_id;
	private String type_id;

	private String start_time;
	private String end_time;
	private String teacher_name;
	
	private File fileselect[];

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

	public void setGrade_id(String grade_id) {
		this.grade_id = grade_id;
	}

	public void setType_id(String type_id) {
		this.type_id = type_id;
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
	
	public String pageQuery() throws IOException {

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));

		if ("1".equals(tag)) {
			cookBookService.termQuery(model, pageBean, detachedCriteria, class_id, grade_id, type_id, start_time,
					end_time, teacher_name);
		}

		cookBookService.pageQuery(pageBean);

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
		CookBook cookBook = cookBookService.findById(id);
		ServletActionContext.getContext().getValueStack().set("cookBook", cookBook);

		return "about";
	}

	public String importPicture() throws IOException {

		ServletInputStream in = ServletActionContext.getRequest().getInputStream();
		// FileInputStream in=new FileInputStream(file);
		String fileName = MD5Utils.md5(System.currentTimeMillis() + "");
		File file = new File("E:\\" + fileName + ".png");
		System.out.println(file.getAbsolutePath());
		if (!file.exists())
			file.createNewFile();
		FileOutputStream out = new FileOutputStream(file);
		int c;
		byte buffer[] = new byte[1024];
		while ((c = in.read(buffer)) != -1) {
			for (int i = 0; i < c; i++)
				out.write(buffer[i]);
		}
		in.close();
		out.close();

		return NONE;
	}

	/**
	 * 手机端操作
	 * 
	 * @return
	 */
	public String t_cookBook() {

		return "t_cookBook";
	}

	/**
	 * 手机端操作
	 */
	public String t_add() {

		return "t_add";
	}
	
	/*
	 * 手机端操作
	 */
	public String t_addCookBook() throws IOException {

		cookBookService.taddCookBook(fileselect);
	
		//return NONE;
		return "t_cookBook";
		
	}

	public String t_pageQuery() throws IOException {
		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));
		cookBookService.pageQuery(pageBean);
		List<CookBook> list = pageBean.getRows();
		
		//List<CookBook> list = cookBookService.findAll();
		CookBook cookBook = null;
		Classes classes = null;
		Grade grade = null;
		StringBuffer buffer = new StringBuffer();
		buffer.append("{\"hasMore\": true,\"cookbookList\":[");
		for (int i = 0; i < list.size(); i++) {
			cookBook = list.get(i);
			classes = cookBookService.getClasses(cookBook);
		    grade = cookBookService.getGrade(classes);
		    
			buffer.append("{");
			buffer.append("\"audio_url\":\"url\",");
			buffer.append(
					"\"classlist\": {\"classid\": \"" + classes.getId() + "\",\"classname\": \"" + classes.getClass_name()
							+ "\",\"gradeid\": \"" + grade.getId() + "\",\"gradname\": \"" + grade.getName() + "\"},");
			buffer.append("\"content\": \"" + classes.getNote() + "\",");
			buffer.append("\"create_time\": \"" + TimeUtil.getCurrentTime() + "\",");
			buffer.append("\"duration\": 0,");
			buffer.append("\"iscurrentterm\": \"true\",");
			buffer.append("\"status\": 1,");
			buffer.append("\"subjectid\": 5,");
			buffer.append("\"subjectname\": \"数学\",");
			int size = cookBook.getImageUrlSize();
			buffer.append("\"images\": [");
			for (int j = 0; j < size; j++) {
				buffer.append("{");
				buffer.append("\"imgurl\": \"image/cookbook/"+cookBook.getToImageUrl(j)+"\"");
				if (j == size-1) {
					buffer.append("}");
				} else {
					buffer.append("},");
				}
			}
			buffer.append("]");
			if (i == list.size()-1) {
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
	
	public String p_cookBook() {

		return "p_cookBook";
	}
	
	public String p_pageQuery() throws IOException {
		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));
		cookBookService.pageQuery(pageBean);
		List<CookBook> list = pageBean.getRows();
		
		//List<CookBook> list = cookBookService.findAll();
		CookBook cookBook = null;
		Classes classes = null;
		Grade grade = null;
		StringBuffer buffer = new StringBuffer();
		buffer.append("{\"hasMore\": true,\"cookbookList\":[");
		for (int i = 0; i < list.size(); i++) {
			cookBook = list.get(i);
			classes = cookBookService.getClasses(cookBook);
		    grade = cookBookService.getGrade(classes);
		    
			buffer.append("{");
			buffer.append("\"audio_url\":\"url\",");
			buffer.append(
					"\"classlist\": {\"classid\": \"" + classes.getId() + "\",\"classname\": \"" + classes.getClass_name()
							+ "\",\"gradeid\": \"" + grade.getId() + "\",\"gradname\": \"" + grade.getName() + "\"},");
			buffer.append("\"content\": \"" + classes.getNote() + "\",");
			buffer.append("\"create_time\": \"" + TimeUtil.getCurrentTime() + "\",");
			buffer.append("\"duration\": 0,");
			buffer.append("\"iscurrentterm\": \"true\",");
			buffer.append("\"status\": 1,");
			buffer.append("\"subjectid\": 5,");
			buffer.append("\"subjectname\": \"数学\",");
			int size = cookBook.getImageUrlSize();
			buffer.append("\"images\": [");
			for (int j = 0; j < size; j++) {
				buffer.append("{");
				buffer.append("\"imgurl\": \"image/cookbook/"+cookBook.getToImageUrl(j)+"\"");
				if (j == size-1) {
					buffer.append("}");
				} else {
					buffer.append("},");
				}
			}
			buffer.append("]");
			if (i == list.size()-1) {
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
