package com.hrbhd.bady.dao;
import java.util.List;

import com.hrbhd.bady.dao.base.IBaseDao;
import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.StudentChangeLog;

public interface IStudentDao extends IBaseDao<Student>{

	public List findAllClass();
	
	public List<Student>  findStudentByStudent_noAndGrade_idAndClass_id(String student_no,String grade_id,String class_id);

	public List<Student> findStudentNumberByGrade_idAndClass_id(String grade, String class_name);

	public List<Student> findByGrade_idAndClass_id(String grade_id, String class_id);

	public List<Student> findByClasses(Classes classes);

	public List<Student> findStudentByStudent_noAndClasses(String student_no, String class_id);

	public List<Student> finByLikeName(String student_name);

	public List<Student> findByPhone(String phone);

	public List<Student> findByPhoneAndPassword(String phone, String password);
	
	public List<Student> findStudentByPhone(String phone);

}

