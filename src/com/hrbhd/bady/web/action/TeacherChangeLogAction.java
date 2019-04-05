package com.hrbhd.bady.web.action;

import java.io.IOException;

import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.domain.Structure;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.domain.TeacherChangeLog;
import com.hrbhd.bady.domain.TeacherDuty;
import com.hrbhd.bady.service.ITeacherChangeLogService;
import com.hrbhd.bady.service.ITeacherService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.web.action.base.BaseAction;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

@Controller
@Scope("prototype")
public class TeacherChangeLogAction extends BaseAction<TeacherChangeLog> {

	@Autowired
	private ITeacherChangeLogService teacherChangeLogService;

	private String page;
	private String rows;
	private String tag;
	
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
	

	public String pageQuery() throws IOException {

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));

		if ("1".equals(tag)) {
			teacherChangeLogService.termQuery(model, pageBean, detachedCriteria, change_time_start, change_time_end);
		}

		teacherChangeLogService.pageQuery(pageBean);

		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[]{"change_time_name_format"});
		config.setJsonPropertyFilter(new PropertyFilter() {

			@Override
			public boolean apply(Object source, String name, Object value) {
				if (source instanceof Teacher && name.equals("roles")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("asks")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("notices")) {
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
				if (source instanceof Teacher && name.equals("teachers")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("entry_time_name_date")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("classes")) {
					return true;
				}
				if (source instanceof TeacherDuty && name.equals("teachers")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("askTeacherChecks")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("classes")) {
					return true;
				}
				if (source instanceof Structure && name.equals("teachers")) {
					return true;
				}

				return false;
			}
		});

		/*
		 * config.setExcludes(new String[] { "roles" , "notices", "teachers"});
		 * config.setIgnoreDefaultExcludes(false);
		 * config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		 */

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
