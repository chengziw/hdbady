package com.hrbhd.bady.service;

import java.io.IOException;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.hrbhd.bady.domain.Role;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.util.PageBean;

public interface IRoleService {

	public void pageQuery(PageBean pageBean);

	public Role findById(String id);

	public List<Teacher> findHaveRoleTeacher(Role model);

	public void editRoleMember (Role model, String entities)throws IOException;

	public void editRolePower(Role model, String[] modules) throws IOException;

	public List findByName(String name);

	public void save(Role model);

	public void editRoleName(Role model);

	public void delete(Role model);

	public void termQuery(Role model, PageBean pageBean, DetachedCriteria detachedCriteria);

	public void editMemberPageQuery(Role model, String page ,String rows) throws IOException;

}
