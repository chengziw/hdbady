package com.hrbhd.bady.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.HomeWork;
import com.hrbhd.bady.util.PageBean;

public interface IHomeWorkService {

	public void pageQuery(PageBean pageBean);

	public HomeWork findById(String id);

	public void termQuery(HomeWork model, PageBean pageBean, DetachedCriteria detachedCriteria, String class_id,
			 String subject_id, String start_time, String end_time, String teacher_name) throws UnsupportedEncodingException;

	public void taddHomeWork(File[] fileselect ,HomeWork model) throws IOException;

	public List<HomeWork> findAll();

	public Classes getClasses(HomeWork homeWork);

	public Grade getGrade(Classes classes);

}
