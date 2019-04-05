package com.hrbhd.bady.web.action;

import java.io.IOException;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.junit.validator.PublicClassValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.domain.ClassType;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.domain.TeacherDuty;
import com.hrbhd.bady.service.IAskService;
import com.hrbhd.bady.service.ITeacherDutyService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.web.action.base.BaseAction;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

@Controller
@Scope("prototype")
public class TeacherDutyAction extends BaseAction<TeacherDuty> {

	@Autowired
	private ITeacherDutyService teacherDutyService;
	
	private String page;
	private String rows;

	public void setPage(String page) {
		this.page = page;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	public String pageQuery() throws IOException {

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));

		teacherDutyService.pageQuery(pageBean);

		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[]{"teachers"});
		JSONArray jsonObject = JSONArray.fromObject(pageBean.getRows(),config);

		int total = pageBean.getTotal();

		String json1 = "{\"total\":" + total + ",\"rows\":";
		String json2 = jsonObject.toString();
		String json3 = "}";
		String json = json1 + json2 + json3;
		JsonUtil.writeJson(json);
		return NONE;
	}

	public String addTeacherDuty() throws IOException {

		String json = "";
		// String type_name = model.getType_name();
		String duty_name = model.getDuty_name();
		if (StringUtils.isNotBlank(duty_name)) {

			List<TeacherDuty> list = teacherDutyService.findByDutyName(duty_name);

			if (list.size() > 0) {
				json = "{\"status\": 0, \"info\": \"职务类型名称已存在\"}";
			} else {
				teacherDutyService.addTeacherDuty(model);
				json = "{\"status\": 1, \"info\": \"保存成功\"}";
			}
		} else {
			json = "{\"status\": 0, \"info\": \"请填写职务类型名称\"}";
		}
		JsonUtil.writeJson(json);

		return NONE;
	}

	public String edit() {

		String id = model.getId();
		TeacherDuty teacherDuty = teacherDutyService.findById(id);
		ServletActionContext.getContext().getValueStack().set("teacherDuty", teacherDuty);

		return "edit";
	}

	public String editTeacherDuty() throws IOException {

		String json = "";
		String duty_name = model.getDuty_name();

		if (StringUtils.isNotBlank(duty_name)) {

			String id = model.getId();
			TeacherDuty teacherDuty = teacherDutyService.findById(id);
			String DBduty_name = teacherDuty.getDuty_name();

			List<TeacherDuty> list = teacherDutyService.findByDutyName(duty_name);
			// 不是原本的名字///////也不是数据库中其他名字//
			if (!duty_name.equals(DBduty_name) && list.size() > 0) {
				json = "{\"status\": 0, \"info\": \"职务类型名称已存在\"}";
			} else {
				teacherDutyService.editTeacherDuty(model);
				json = "{\"status\": 1, \"info\": \"保存成功\"}";
			}
		} else {
			json = "{\"status\": 0, \"info\": \"请填写职务类型名称\"}";
		}
		JsonUtil.writeJson(json);

		return NONE;

	}

	public String changeStatus() throws IOException {

		teacherDutyService.changeStatus(model);
		return NONE;
	}

	public String findAllTeacherDuty() throws IOException {
		List<TeacherDuty> list = teacherDutyService.findAllTeacherDuty();
		StringBuffer buffer = new StringBuffer();
		buffer.append("[");
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				if (i == list.size() - 1) {
					buffer.append("{\"id\": \"" + list.get(i).getId() + "\",\"duty_id\": \""
							+ list.get(i).getDuty_name() + "\"}");
				} else {
					buffer.append("{\"id\": \"" + list.get(i).getId() + "\",\"duty_id\": \""
							+ list.get(i).getDuty_name() + "\"},");
				}
			}
		}
		buffer.append("]");
		String json = buffer.toString();
		JsonUtil.writeJson(json);
		return NONE;
	}
	
	public String findAllTeacherDutyToSelect() throws IOException {
		List<TeacherDuty> list = teacherDutyService.findAllTeacherDuty();
		StringBuffer buffer = new StringBuffer();
		buffer.append("[{\"id\": \" \",\"duty_id\": \"全部职务\"},");
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				if (i == list.size() - 1) {
					buffer.append("{\"id\": \"" + list.get(i).getId() + "\",\"duty_id\": \""
							+ list.get(i).getDuty_name() + "\"}");
				} else {
					buffer.append("{\"id\": \"" + list.get(i).getId() + "\",\"duty_id\": \""
							+ list.get(i).getDuty_name() + "\"},");
				}
			}
		}
		buffer.append("]");
		String json = buffer.toString();
		JsonUtil.writeJson(json);
		return NONE;
	}

}
