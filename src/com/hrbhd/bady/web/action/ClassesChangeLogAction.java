package com.hrbhd.bady.web.action;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;

import com.hrbhd.bady.domain.ClassType;
import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.ClassesChangeLog;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.service.IClassesChangeLogService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.web.action.base.BaseAction;
import com.mysql.jdbc.StreamingNotifiable;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

public class ClassesChangeLogAction extends BaseAction<ClassesChangeLog> {

	@Autowired
	private IClassesChangeLogService classesChangeLogService;

	private String page;
	private String rows;
	private String tag;

	private String start_date;
	private String end_date;

	public void setPage(String page) {
		this.page = page;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String pageQuery() throws IOException {

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));

		if ("1".equals(tag)) {
			classesChangeLogService.termQuery(model, pageBean, detachedCriteria, start_date,
					end_date);
		}

		classesChangeLogService.pageQuery(pageBean);

		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[] { "create_time_format" });
		config.setJsonPropertyFilter(new PropertyFilter() {

			@Override
			public boolean apply(Object source, String name, Object value) {
				if (source instanceof Classes && name.equals("students")) {
					return true;
				}
				if (source instanceof Classes && name.equals("studentBespeaks")) {
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
				if (source instanceof Classes && name.equals("cookBooks")) {
					return true;
				}
				if (source instanceof Classes && name.equals("studentChecks")) {
					return true;
				}
				if (source instanceof Classes && name.equals("teacher")) {
					return true;
				}
				if (source instanceof Classes && name.equals("studentChecks")) {
					return true;
				}
				if (source instanceof ClassType && name.equals("classes")) {
					return true;
				}
				if (source instanceof Grade && name.equals("classes")) {
					return true;
				}
				if (source instanceof Grade && name.equals("subjects")) {
					return true;
				}
				System.out.println(source.getClass().getName());
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
}
