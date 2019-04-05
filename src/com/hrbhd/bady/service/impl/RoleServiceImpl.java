package com.hrbhd.bady.service.impl;

import java.awt.image.BufferedImageFilter;

import java.io.IOException;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.mail.Folder;
import javax.mail.Flags.Flag;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hrbhd.bady.dao.IElementDao;
import com.hrbhd.bady.dao.IPageDao;
import com.hrbhd.bady.dao.IRoleDao;
import com.hrbhd.bady.dao.IStructureDao;
import com.hrbhd.bady.dao.ITeacherDao;
import com.hrbhd.bady.domain.Element;
import com.hrbhd.bady.domain.Page;
import com.hrbhd.bady.domain.Role;
import com.hrbhd.bady.domain.Structure;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.domain.TeacherDuty;
import com.hrbhd.bady.service.IRoleService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.PageBean;
import com.hrbhd.bady.util.TreeBuilder;
import com.hrbhd.bady.web.action.TeacherAction;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
@Transactional
public class RoleServiceImpl implements IRoleService {

	@Autowired
	private IRoleDao roleDao;
	@Autowired
	private IPageDao pageDao;
	@Autowired
	private IElementDao elementDao;
	@Autowired
	private ITeacherDao teacherDao;
	@Autowired
	private IStructureDao structureDao;

	@Override
	public void pageQuery(PageBean pageBean) {
		roleDao.pageQuery(pageBean);
	}

	@Override
	public Role findById(String id) {
		return roleDao.findById(id);
	}

	@Override
	public List<Teacher> findHaveRoleTeacher(Role model) {
		String id = model.getId();
		Role userRole = roleDao.findById(id);
		Set<Teacher> teachers = userRole.getTeachers();
		List<Teacher> list = new ArrayList<Teacher>(teachers);
		return list;
	}

	@Override
	public void editRoleMember(Role model, String entities) throws IOException {

		String id = model.getId();
		Role role = roleDao.findById(id);
		// Set<Teacher> teachers = userRole.getTeachers();
		Set<Teacher> teachers = new HashSet<Teacher>();

		JSONArray jsonArray = JSONArray.fromObject(entities);
		for (int i = 0; i < jsonArray.size(); i++) {

			JSONObject jsonObject = jsonArray.getJSONObject(i);

			String tid = jsonObject.getString("id");
			// String teacherName = jsonObject.getString("teacherName");
			Teacher teacher = teacherDao.findById(tid);
			teachers.add(teacher);
		}
		role.setTeachers(teachers);
		String json = "{\"errMeg\":\"\"}";
		JsonUtil.writeJson(json);
	}

	@Override
	public void editRolePower(Role model, String[] modules) throws IOException {

		String id = model.getId();
		Role role = roleDao.findById(id);
		Set<Element> elements = new HashSet<Element>();
		Set<Page> pages = new HashSet<Page>();
		if (modules != null && modules.length > 0) {
			for (String code : modules) {
				Element element = elementDao.findByCode(code);
				elements.add(element);
			}
		}
		role.setElements(elements);

		List<Page> list = pageDao.findAll();
		for (Page page : list) {
			pages.add(page);
		}
		role.setPages(pages);

		String json = "{\"errMeg\":\"\"}";
		JsonUtil.writeJson(json);
	}

	@Override
	public List findByName(String name) {
		return roleDao.findByName(name);
	}

	@Override
	public void save(Role model) {
		roleDao.save(model);
	}

	@Override
	public void editRoleName(Role model) {

		String id = model.getId();
		Role role = roleDao.findById(id);

		String name = model.getName();
		String note = model.getNote();

		role.setName(name);
		role.setNote(note);

	}

	@Override
	public void delete(Role model) {
		roleDao.delete(model);
	}

	@Override
	public void termQuery(Role model, PageBean pageBean, DetachedCriteria detachedCriteria) {

		String type = model.getType();
		if (!"".equals(type)) {
			if ("88".equals(type)) {
				detachedCriteria.add(Restrictions.eq("type", type));
			} else {
				detachedCriteria.add(Restrictions.ne("type", "88"));
			}
		}

	}

	@Override
	public void editMemberPageQuery(Role model ,String page ,String rows) throws IOException {

		int size = 0;
		String json = "";
		StringBuffer buffer = new StringBuffer();
		
		String structure_id = model.getStructure_id();
		String teacher_name = model.getTeacher_name();
		
		List<Teacher> tlist = teacherDao.findAll();
		size = tlist.size();
		
		if (structure_id == null && teacher_name == null) {
			
			DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Teacher.class);
			PageBean pageBean = new PageBean();
			pageBean.setDetachedCriteria(detachedCriteria);
			pageBean.setCurrentPage(Integer.parseInt(page));
			pageBean.setPageSize(Integer.parseInt(rows));
			teacherDao.pageQuery(pageBean);
			teachers = pageBean.getRows();
			
		} else {
			// ½øÈë
			if ("".equals(structure_id)) {
				structure_id = "1";
			}
			Structure structure = structureDao.findById(structure_id);
			List<Structure> slist = structureDao.findByParentId(structure_id);
			if (slist != null && slist.size() > 0) {

				List<Teacher> recursion = recursion(structure);

			} else {
				if (structure != null) {
					teachers = new ArrayList<Teacher>(structure.getTeachers());
				}
			}

			if (StringUtils.isNotBlank(teacher_name)) {

				boolean flag = true;
				teacher_name = new String(teacher_name.getBytes("iso8859-1"), "utf-8");
				for (Teacher teacher : teachers) {
					String phone = teacher.getPhone();
					if("admin".equals(phone)){
						continue;
					}
					String teacher_name2 = teacher.getTeacher_name();
					if (teacher_name.equals(teacher_name2)) {
						teachers = new ArrayList<Teacher>();
						teachers.add(teacher);
						flag = false;
						size = teachers.size();
					}
				}
				if (flag) {
					teachers = new ArrayList<Teacher>();
					size = teachers.size();
				}
			}
			//
		}
		buffer.append("{\"total\": "+size+",\"rows\": [");
		for (Teacher teacher : teachers) {
			String phone = teacher.getPhone();
			if("admin".equals(phone)){
				continue;
			}
			buffer.append("{");

			buffer.append("\"id\": \"" + teacher.getId() + "\",");
			buffer.append("\"teacherName\": \"" + teacher.getTeacher_name() + "\",");
			TeacherDuty teacherDuty = teacher.getTeacherDuty();
			if (teacherDuty != null) {
				buffer.append("\"dutyName\": \"" + teacherDuty.getDuty_name() + "\",");
			} else {
				buffer.append("\"dutyName\": \"\",");
			}
			buffer.append("\"sexName\": \"" + teacher.getSex_name() + "\",");
			buffer.append("\"phone\": \"" + teacher.getPhone() + "\"");

			buffer.append("},");
		}
		if (teachers != null && teachers.size() > 0) {
			buffer.deleteCharAt(buffer.length() - 1);
		}
		buffer.append("]}");
		teachers = new ArrayList<Teacher>();

		json = buffer.toString();
		JsonUtil.writeJson(json);
	}

	private List<Teacher> teachers = new ArrayList<Teacher>();

	// µÝ¹é²Ù×÷
	public List<Teacher> recursion(Structure structure) {
		String id = structure.getId();
		Set<Teacher> sTeachers = structure.getTeachers();
		if (sTeachers != null && sTeachers.size() > 0) {
			List<Teacher> lTeachers = new ArrayList<>(sTeachers);
			teachers.addAll(lTeachers);
		}
		List<Structure> list = structureDao.findByParentId(id);
		if (list != null && list.size() > 0) {
			for (Structure structure2 : list) {
				recursion(structure2);
			}
		}
		return teachers;
	}

	public List<Teacher> noRepeat(List<Teacher> list) {

		Set<Teacher> s = new TreeSet<Teacher>(new Comparator<Teacher>() {
			@Override
			public int compare(Teacher o1, Teacher o2) {
				return o1.getId().compareTo(o2.getId());
			}
		});
		s.addAll(list);
		return new ArrayList<Teacher>(s);

	}

}
