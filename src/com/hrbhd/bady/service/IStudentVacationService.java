package com.hrbhd.bady.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.StudentVacation;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.util.PageBean;

public interface IStudentVacationService {

	public void pageQuery(PageBean pageBean);

	public StudentVacation findById(String id);

	public void addStudentVacation(StudentVacation model) throws IOException;

	public void checkStudentVacation(StudentVacation model) throws IOException;

	public void termQuery(StudentVacation model, PageBean pageBean, DetachedCriteria detachedCriteria, String student_name, String class_id, String grade_id) throws UnsupportedEncodingException;

	public List<StudentVacation> findByStudentId(String student_id);

	public List<StudentVacation> findAll();

	public void paddStudentVacation(StudentVacation model) throws IOException;

	public void t_checkStudentVacation(StudentVacation model) throws IOException;

	public List<Student> getStudent(Teacher teacher);

	public List<StudentVacation> findByStudentIdAndStatus(String student_id);

}
