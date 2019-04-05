package com.hrbhd.bady.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.hrbhd.bady.domain.TeacherVacation;
import com.hrbhd.bady.util.PageBean;

public interface ITeacherVacationService {

	public void pageQuery(PageBean pageBean);

	public void addTeacherVacation(TeacherVacation model) throws IOException;

	public TeacherVacation findById(String id);

	public void checkTeacherVacation(TeacherVacation model) throws IOException;

	public void destroyTeacherVacation(TeacherVacation model) throws IOException;

	public void termQuery(TeacherVacation model, PageBean pageBean, DetachedCriteria detachedCriteria,
			String teacher_name) throws UnsupportedEncodingException;

	public List<TeacherVacation> findByTeacherId(String id);
	
	public void taddTeacherVacation(TeacherVacation model) throws IOException;

	public List<TeacherVacation> findAll();

}
