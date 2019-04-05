package com.hrbhd.bady.web.action;

import java.io.IOException;
import java.util.List;

import javax.resource.spi.LazyEnlistableConnectionManager;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.components.Else;
import org.hibernate.criterion.Restrictions;
import org.junit.validator.PublicClassValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.domain.Structure;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.domain.TeacherCheck;
import com.hrbhd.bady.domain.TeacherDuty;
import com.hrbhd.bady.service.ITeacherCheckService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.TimeUtil;
import com.hrbhd.bady.web.action.base.BaseAction;
import com.mchange.v2.async.StrandedTaskReporting;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

@Controller
@Scope("prototype")
public class TeacherCheckAction extends BaseAction<TeacherCheck>{
	
	@Autowired
	private ITeacherCheckService teacherCheckService;
	
	private String page;
	private String rows;
	private String tag;
	
	private String date;	
	private String structure_id;
	private String teacher_name;

	public void setPage(String page) {
		this.page = page;
	}
	public void setRows(String rows) {
		this.rows = rows;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	
	public void setDate(String date) {
		this.date = date;
	}

	public void setStructure_id(String structure_id) {
		this.structure_id = structure_id;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}

	public String pageQuery() throws IOException {

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));
		
		detachedCriteria = pageBean.getDetachedCriteria();
		detachedCriteria.setProjection(null);
		detachedCriteria.createAlias("teacher", "t");
		detachedCriteria.add(Restrictions.ne("t.phone", "admin"));

		if ("1".equals(tag)) {
			teacherCheckService.termQuery(model, pageBean, detachedCriteria, date, structure_id, teacher_name);
		}

		teacherCheckService.pageQuery(pageBean);

		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[]{"date_label_format","teacherMonthCheck"});
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
				if (source instanceof Teacher && name.equals("entry_time_name_date")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("teachers")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("classes")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("askTeacherChecks")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("classes")) {
					return true;
				}
				if (source instanceof TeacherDuty && name.equals("teachers")) {
					return true;
				}
				if (source instanceof Structure && name.equals("teachers")) {
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
	
	
	public String tregister(){
		
		teacherCheckService.tregister();
		
		return NONE;
	}

	public String addNote(){
		
		String id = model.getId();
		TeacherCheck teacherCheck = teacherCheckService.findById(id);
		ServletActionContext.getContext().getValueStack().set("teacherCheck", teacherCheck);
		
		return "note";
	}
	
	public String addTeacherNote() throws IOException{
		
		teacherCheckService.addTeacherNote(model);
		
		return NONE;
	}
	
	/**
	 * ΩÃ ¶∂À«©µΩ
	 * @return
	 * @throws IOException
	 */
	public String t_addTeacherCheck() throws IOException{
		
		teacherCheckService.taddTeacherCheck();
		
		return NONE;
	}
	
}
