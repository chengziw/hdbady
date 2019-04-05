package com.hrbhd.bady.web.action;

import java.io.IOException;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.aspectj.apache.bcel.generic.ReturnaddressType;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;

import org.springframework.stereotype.Controller;

import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.Structure;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.StudentVacation;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.domain.TeacherDuty;
import com.hrbhd.bady.domain.TeacherVacation;
import com.hrbhd.bady.service.ITeacherVacationService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.TimeUtil;
import com.hrbhd.bady.web.action.base.BaseAction;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

@Controller
@Scope("prototype")
public class TeacherVacationAction extends BaseAction<TeacherVacation> {

	@Autowired
	private ITeacherVacationService teacherVacationService;

	private String page;
	private String rows;
	private String tag;

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

	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}

	public String pageQuery() throws IOException {

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));

		
		if ("1".equals(tag)) {
			teacherVacationService.termQuery(model, pageBean, detachedCriteria, teacher_name);
		}

		teacherVacationService.pageQuery(pageBean);

		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[] { "apply_time_format" });
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
				if (source instanceof Teacher && name.equals("askTeacherChecks")) {
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

	public String add() {

		return "add";
	}

	public String addTeacherVacation() throws IOException {

		teacherVacationService.addTeacherVacation(model);

		return NONE;
	}

	public String check() {

		String id = model.getId();
		TeacherVacation teacherVacation = teacherVacationService.findById(id);
		ServletActionContext.getContext().getValueStack().set("teacherVacation", teacherVacation);

		return "check";
	}

	public String checkTeacherVacation() throws IOException {

		teacherVacationService.checkTeacherVacation(model);

		return NONE;
	}

	public String destroy() {

		String id = model.getId();
		TeacherVacation teacherVacation = teacherVacationService.findById(id);
		ServletActionContext.getContext().getValueStack().set("teacherVacation", teacherVacation);

		return "destroy";
	}

	public String destroyTeacherVacation() throws IOException {

		teacherVacationService.destroyTeacherVacation(model);

		return NONE;
	}

	/**
	 * ÊÖ»ú¶Ë²Ù×÷
	 */
	public String t_teacherVacation() {

		return "t_teacherVacation";
	}

	public String t_addTeacherVacation() throws IOException {

		teacherVacationService.taddTeacherVacation(model);

		return NONE;
		//return "t_teacherVacation";
	}

	public String t_pageQuery() throws IOException {
		
		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginTeacher");
		String teacher_id = teacher.getId();
		
		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));
		
		detachedCriteria = pageBean.getDetachedCriteria();
		detachedCriteria.add(Restrictions.eq("teacher_id", teacher_id));
		
		teacherVacationService.pageQuery(pageBean);
		List<TeacherVacation> list = pageBean.getRows();

		//List<TeacherVacation> list = teacherVacationService.findAll();
		TeacherVacation teacherVacation = null;
		StringBuffer buffer = new StringBuffer();
		buffer.append("{\"hasMore\":true,\"qingjiaList\": [");
		for (int i = 0; i < list.size(); i++) {
			teacherVacation = list.get(i);
			buffer.append("{");
			
			buffer.append("\"yuanyin\":\"" + teacherVacation.getTypeLabel(teacherVacation.getType()) + "\",");
			buffer.append("\"startTime\":\"" + teacherVacation.getStart_time() + "\",");
			buffer.append("\"endTime\":\"" + teacherVacation.getEnd_time() + "\",");
			buffer.append("\"check\":\"" + teacherVacation.getStatus_label() + "\",");
			buffer.append("\"content\":\"" + teacherVacation.getReason() + "\"");

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

}
