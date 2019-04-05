package com.hrbhd.bady.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.type.StringRepresentableType;

import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.StudentCheck;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.domain.TeacherCheck;
import com.hrbhd.bady.util.PageBean;

public interface IStudentCheckService {

	public void pageQuery(PageBean pageBean);

	public void save(StudentCheck studentCheck);

	public void termQuery(StudentCheck model, PageBean pageBean, DetachedCriteria detachedCriteria, String grade_id,
			String class_id, String date, String student_name) throws UnsupportedEncodingException;

	public void termQuery2(StudentCheck model, PageBean pageBean, DetachedCriteria detachedCriteria, String grade_id,
			String class_id) throws UnsupportedEncodingException;

	public void comeSchoolStudentEnter(StudentCheck model, String ids) throws IOException;

	public void goSchoolStudentEnter(StudentCheck model, String ids) throws IOException;

	public List<StudentCheck> getCheckStudent(String syear, String smonth);

	public void addStudentCheck(Student student, String start_time, String end_time);

	public List<StudentCheck> findAll();

	public List<StudentCheck> getStudentCheck(Classes classes);

	public List<StudentCheck> findByStudentAndMonth(Student student, String check_time);

	public StudentCheck findById(String id);

	public void addStudentNote(StudentCheck model) throws IOException;

	public List<StudentCheck> findByclassIdAndDay(String id);

	public void taddStudentCheck(String student_id) throws IOException;

	public List<StudentCheck> findStudentCheckByYearAndMonthAndStudentId(String syear, String smonth,
			String student_id);

	public void paddStudentCheck() throws IOException;

	public List<TeacherCheck> findByStudentAndStatus(String student_id, String smonth);

	public List<TeacherCheck> findByStudentAndStatus(String student_id, String smonth, String morningStatus, String afternoonStatus);

	public List<StudentCheck> findByclassIdAndDayAndStatus(String class_id, String status, String currentDay);
	

}
