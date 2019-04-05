package com.hrbhd.bady.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.domain.TeacherCheck;
import com.hrbhd.bady.util.PageBean;

public interface ITeacherCheckService {

	public void pageQuery(PageBean pageBean);

	public void save(TeacherCheck teacherCheck);

	public void termQuery(TeacherCheck model, PageBean pageBean, DetachedCriteria detachedCriteria, String date,
		 String structure_id, String teacher_name) throws UnsupportedEncodingException;

	public void addTeacherCheck(Teacher teacher, String start_time, String end_time);

	public List<TeacherCheck> findByTeacherAndMonth(Teacher teacher, String check_time);

	public void tregister();

	public TeacherCheck findById(String id);

	public void addTeacherNote(TeacherCheck model) throws IOException;

	public void taddTeacherCheck() throws IOException;

	public List<TeacherCheck> findTeacherCheckByYearAndMonthAndTeacherId(String syear, String smonth, String teacher_id);

	public List<TeacherCheck> findByTeacherAndStatus(String teacher_id, String smonth ,String morningStatus, String afternoonStatus);

	public List<TeacherCheck> findByTeacherAndStatus(String teacher_id, String smonth);


}
