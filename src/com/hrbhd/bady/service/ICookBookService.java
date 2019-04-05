package com.hrbhd.bady.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.CookBook;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.HomeWork;
import com.hrbhd.bady.util.PageBean;

public interface ICookBookService {

	public void pageQuery(PageBean pageBean);

	public CookBook findById(String id);

	public void termQuery(CookBook model, PageBean pageBean, DetachedCriteria detachedCriteria, String class_id,
			String grade_id, String type_id, String start_time, String end_time, String teacher_name);

	public List<CookBook> findAll();

	public void taddCookBook(File[] fileselect) throws IOException;

	public Classes getClasses(CookBook cookBook);

	public Grade getGrade(Classes classes);

}
