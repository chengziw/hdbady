package com.hrbhd.bady.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.hrbhd.bady.domain.StudentCheck;
import com.hrbhd.bady.domain.StudentMonthCheck;
import com.hrbhd.bady.domain.StudentVacation;
import com.hrbhd.bady.util.PageBean;

public interface IStudentMonthCheckService {

	public void pageQuery(PageBean pageBean);

	public StudentMonthCheck findById(String id);

	public void save(StudentMonthCheck studentMonthCheck);

	public void termQuery(StudentMonthCheck model, PageBean pageBean, DetachedCriteria detachedCriteria,
			String class_id, String end_month, String end_year, String grade_id, String start_month, String start_year,
			String status, String student_name) throws UnsupportedEncodingException;

	public List<StudentMonthCheck> findByMonthAndYear(String year_label, String month_label);

}
