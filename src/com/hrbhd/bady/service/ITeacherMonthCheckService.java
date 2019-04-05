package com.hrbhd.bady.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.hrbhd.bady.domain.TeacherMonthCheck;
import com.hrbhd.bady.util.PageBean;

public interface ITeacherMonthCheckService {

	public void pageQuery(PageBean pageBean);

	public void save(TeacherMonthCheck teacherMonthCheck);

	public void termQuery(TeacherMonthCheck model, PageBean pageBean, DetachedCriteria detachedCriteria,
			String start_year, String start_month, String end_year, String end_month, String status,
			String structure_id, String teacher_name) throws UnsupportedEncodingException;

	public TeacherMonthCheck findById(String id);

	public List<TeacherMonthCheck> findByMonthAndYear(String year_label, String month_label);

}
