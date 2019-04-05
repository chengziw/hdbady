package com.hrbhd.bady.service;

import java.io.IOException;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.Subject;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.util.PageBean;

public interface ISubjectService {

	public void pageQuery(PageBean pageBean);

	public Subject findById(String id);

	public void save(Subject model);

	public void addSubject(Subject model, String[] grade_id);

	public void editSubject(Subject model, String[] grade_id);

	public void changeStatus(Subject model) throws IOException;

	public List<Subject> findByName(String name);

	public List<Subject> findAll();

	public String findAllSubjectToCurriculaTableAdd();

	public void termQuery(Subject model, PageBean pageBean, DetachedCriteria detachedCriteria);

	public List<Subject> findByStatus();

	public Classes getClasses(Teacher teacher);
}
