package com.hrbhd.bady.service;

import java.io.UnsupportedEncodingException;

import org.hibernate.criterion.DetachedCriteria;

import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.ClassesChangeLog;
import com.hrbhd.bady.util.PageBean;

public interface IClassesChangeLogService {

	public void pageQuery(PageBean pageBean);
	
	public void addLog(Classes classes, String state);

	public void termQuery(ClassesChangeLog model, PageBean pageBean, DetachedCriteria detachedCriteria, 
			String start_date, String end_date) throws UnsupportedEncodingException;

}
