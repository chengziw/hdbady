package com.hrbhd.bady.web.action;

import java.io.IOException;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;

import javax.servlet.Servlet;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.hrbhd.bady.dao.impl.RoleDaoImpl;
import com.hrbhd.bady.domain.Element;
import com.hrbhd.bady.domain.Role;
import com.hrbhd.bady.domain.Structure;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.service.IElementService;
import com.hrbhd.bady.service.IGradeService;
import com.hrbhd.bady.service.IRoleService;
import com.hrbhd.bady.service.IStructureService;
import com.hrbhd.bady.service.ITeacherService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.TimeUtil;
import com.hrbhd.bady.web.action.base.BaseAction;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

public class RoleAction extends BaseAction<Role> {

	@Autowired
	private IRoleService roleService;
	@Autowired
	private IElementService elementService;
	@Autowired
	private IStructureService structureService;
	@Autowired
	private ITeacherService teacherService;

	private String page;
	private String rows;
	private String tag;

	private String entities;
	private String[] modules;

	private String flag;// 区分校验和保存

	public void setPage(String page) {
		this.page = page;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	public void setEntities(String entities) {
		this.entities = entities;
	}

	public void setModules(String[] modules) {
		this.modules = modules;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String pageQuery() throws IOException {

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));

		if ("1".equals(tag)) {
			roleService.termQuery(model, pageBean, detachedCriteria);
		}

		roleService.pageQuery(pageBean);

		JsonConfig config = new JsonConfig();

		config.setExcludes(new String[] { "pages", "elements", "teachers" });
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

	public String delete() {

		String id = model.getId();
		Role role = roleService.findById(id);
		ServletActionContext.getContext().getValueStack().set("role", role);

		return "delete";
	}

	public String editPower() {

		String id = model.getId();
		Role role = roleService.findById(id);
		ServletActionContext.getContext().getValueStack().set("role", role);

		List<Element> allList = elementService.findAll();
		// Element[] allelements = (Element[]) allList.toArray();
		Element[] allelements = new Element[allList.size()];
		Set<Element> sets = role.getElements();
		if (sets != null && sets.size() > 0) {
			List<Element> list = new ArrayList<>(sets);
			// Element[] elements = (Element[]) list.toArray();
			Element[] elements = new Element[list.size()];
			sets.toArray(elements);

			for (int i = 0; i < elements.length; i++) {
				int eindex = Integer.parseInt(elements[i].getEindex()) - 1;
				allelements[eindex] = elements[i];
			}

		}
		ServletActionContext.getContext().getValueStack().set("allelements", allelements);

		return "editPower";
	}

	public String editName() {

		String id = model.getId();
		Role role = roleService.findById(id);
		ServletActionContext.getContext().getValueStack().set("role", role);

		return "editName";
	}

	public String editMember() {

		String id = model.getId();
		Role userRole = roleService.findById(id);

		ServletActionContext.getContext().getValueStack().set("userRole", userRole);

		return "editMember";
	}

	public String editMemberPageQuery() throws IOException {

		roleService.editMemberPageQuery(model, page ,rows);

		return NONE;
	}

	public String addRole() throws IOException {

		String json = "";
		String name = model.getName();
		List list = roleService.findByName(name);

		if (list != null && list.size() > 0) {
			json = "{\"flag\":false}";
		} else {
			if ("1".equals(flag)) {
				Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginUser");
				model.setType("88");
				// model.setScope("待更改");// 管理的数据范围
				model.setType_label("用户自定义");
				model.setCreate_time(TimeUtil.getCurrentDay());
				model.setTeacher_name(teacher.getTeacher_name() + "创建");
				roleService.save(model);
				json = "{\"errMeg\":\"\"}";
			} else {
				json = "{\"flag\":true}";
			}
		}

		JsonUtil.writeJson(json);

		return NONE;
	}

	public String deleteRole() throws IOException {

		// String id = model.getId();
		roleService.delete(model);
		String json = "{\"errMeg\":\"\"}";
		JsonUtil.writeJson(json);

		return NONE;
	}

	public String editRolePower() throws IOException {

		if (modules != null && modules.length > 0) {
			for (String string : modules) {
				System.out.println(string);
			}
		}
		roleService.editRolePower(model, modules);

		return NONE;
	}

	public String editRoleName() throws IOException {

		String json = "";
		String id = model.getId();
		String name = model.getName();
		List list = roleService.findByName(name);
		Role role = roleService.findById(id);
		String DBname = role.getName();

		if (!name.equals(DBname) && list != null && list.size() > 0) {
			json = "{\"flag\":false}";
		} else {
			if (!"1".equals(flag)) {
				Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginUser");
				roleService.editRoleName(model);
				json = "{\"errMeg\":\"\"}";
			} else {
				json = "{\"flag\":true}";
			}
		}

		JsonUtil.writeJson(json);

		/*
		 * String json = ""; String name = model.getName(); String id =
		 * model.getId(); Role role = roleService.findById(id); String DBname =
		 * role.getName(); List list = roleService.findByName(name);
		 * 
		 * if (!name.equals(DBname) && list.size() > 0) { json =
		 * "{\"flag\":false}"; } else { roleService.editRoleName(model); json =
		 * "{\"flag\":true}"; } JsonUtil.writeJson(json);
		 */

		return NONE;
	}

	public String editRoleMember() throws IOException {

		roleService.editRoleMember(model, entities);

		return NONE;
	}

	public String getRoleTeacher() {

		return NONE;
	}

	public String findHaveRoleTeacher() throws IOException {

		String id = model.getId();
		Role userRole = roleService.findById(id);
		Set<Teacher> teachers = userRole.getTeachers();

		int total = 0;
		StringBuffer buffer = new StringBuffer();
		List<Teacher> list = roleService.findHaveRoleTeacher(model);
		// List<Teacher> list = new ArrayList<Teacher>(teachers);
		if (list != null && list.size() > 0) {
			total = list.size();
			for (int i = 0; i < list.size(); i++) {
				if("admin".equals(list.get(i).getPhone())){
					continue;
				}
				if (i == list.size() - 1) {
					buffer.append("{\"id\": \"" + list.get(i).getId() + "\",\"teacherName\": \""
							+ list.get(i).getTeacher_name() + "\"}");
				} else {
					buffer.append("{\"id\": \"" + list.get(i).getId() + "\",\"teacherName\": \""
							+ list.get(i).getTeacher_name() + "\"},");
				}
			}
		}

		String json1 = "{\"total\":" + total + ",\"rows\":[";
		String json2 = buffer.toString();
		String json3 = "]}";
		String json = json1 + json2 + json3;
		JsonUtil.writeJson(json);
		return NONE;
	}

}
