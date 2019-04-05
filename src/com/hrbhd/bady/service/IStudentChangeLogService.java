package com.hrbhd.bady.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.envers.Audited;

import com.hrbhd.bady.dao.IStudentChangeLogDao;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.StudentChangeLog;
import com.hrbhd.bady.util.PageBean;

public interface IStudentChangeLogService {

	public List<StudentChangeLog> findAll();

	public void addLog(Student student, String state);
	
	public void pageQuery(PageBean pageBean);
	
	public void termQuery(StudentChangeLog model, PageBean pageBean, DetachedCriteria detachedCriteria, String change_time_start,
			String change_time_end);
}
