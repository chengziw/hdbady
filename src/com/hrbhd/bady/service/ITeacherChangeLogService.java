package com.hrbhd.bady.service;

import java.io.UnsupportedEncodingException;

import org.hibernate.criterion.DetachedCriteria;

import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.domain.TeacherChangeLog;
import com.hrbhd.bady.util.PageBean;

public interface ITeacherChangeLogService {

	public void pageQuery(PageBean pageBean);
	
	public void addLog(Teacher teacher, String state);

	public void termQuery(TeacherChangeLog model, PageBean pageBean, DetachedCriteria detachedCriteria,
			String change_time_start,
			String change_time_end) throws UnsupportedEncodingException;

}
