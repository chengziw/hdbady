package com.hrbhd.bady.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.hrbhd.bady.domain.ClassType;
import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.util.PageBean;

public interface IClassesService {

	public void pageQuery(PageBean pageBean);

	public Classes findById(String id);

	public List<Classes> findClassByClassName(String class_name);

	public void editClass(Classes model) throws IOException;

	public void deleteClass(Classes model,String CLASSES_DELETE);

	public void addClass(Classes model,String CLASSES_ADD);

	public List<Classes> findAllClass();

	public List<Classes> findClassByClassNameAndGrade(String class_name, String grade_id);

	public List<Classes> findAllClassByGrade(Grade grade);

	public List<Classes> findAll();

	public void setStudentNumbers(List<Classes> list);

	public List<Classes> findByGrade(Grade grade);

	public void termQuery(Classes model, PageBean pageBean, DetachedCriteria detachedCriteria) throws UnsupportedEncodingException;

	public Classes findClassesByTeacherId(String id);

	public Teacher getTeacher(Classes classes);

}
