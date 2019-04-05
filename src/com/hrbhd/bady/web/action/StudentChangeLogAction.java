package com.hrbhd.bady.web.action;

import java.io.IOException;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.dao.IStudentChangeLogDao;
import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.StudentChangeLog;
import com.hrbhd.bady.service.IAskService;
import com.hrbhd.bady.service.IStudentChangeLogService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.PageBean;
import com.hrbhd.bady.util.TimeUtil;
import com.hrbhd.bady.web.action.base.BaseAction;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

@Controller
@Scope("prototype")
public class StudentChangeLogAction extends BaseAction<StudentChangeLog>{

	@Autowired
	private IStudentChangeLogService studentChangeLogService;
	
	private String tag;
	
	private String page;
	private String rows;
	
	private String change_time_start;
	private String change_time_end;
	
	public void setPage(String page) {
		this.page = page;
	}
	public void setRows(String rows) {
		this.rows = rows;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public void setChange_time_start(String change_time_start) {
		this.change_time_start = change_time_start;
	}
	public void setChange_time_end(String change_time_end) {
		this.change_time_end = change_time_end;
	}

	public String pageQuery() throws IOException{
		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));
		
		detachedCriteria = pageBean.getDetachedCriteria();
		detachedCriteria.addOrder(Order.asc("change_date_name_format"));
		
		if ("1".equals(tag)) {
			studentChangeLogService.termQuery(model,pageBean,detachedCriteria,change_time_start,change_time_end);
		}
		
		studentChangeLogService.pageQuery(pageBean);
		
		//ÒÔºóÅª×ß
		/*List<StudentChangeLog> studentChangeLogs = pageBean.getRows();
		for (StudentChangeLog studentChangeLog : studentChangeLogs) {
			studentChangeLog.setChange_date_name(TimeUtil.getTimeDate(studentChangeLog.getChange_date_name()));
		}*/
		
		System.out.println(pageBean.getRows());
		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[]{"change_date_name_format"});
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
				if (source instanceof Student && name.equals("askStudentChecks")) {
					return true;
				}
				if (source instanceof Student && name.equals("studentChangeLogs")) {
					return true;
				}
				if (source instanceof Student && name.equals("askStudentChecks")) {
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
		JSONArray jsonObject = JSONArray.fromObject(pageBean.getRows(),config);
		
		int total = pageBean.getTotal();
		
		String json1= "{\"total\":"+total+",\"rows\":";
		String json2 = jsonObject.toString();
		String json3 = "}";
		String json = json1 + json2 + json3;
		JsonUtil.writeJson(json);
		System.out.println(json);
	
		return NONE;
	}
}
