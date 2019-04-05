package com.hrbhd.bady.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.LinkedList;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.StudentChangeLog;
import com.hrbhd.bady.domain.StudentImageUrl;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.util.PageBean;
import com.hrbhd.bady.util.TimeUtil;

public interface IStudentService {
	
	public List<Student> findAll();

	public void termQuery(Student model, PageBean pageBean, DetachedCriteria detachedCriteria, String start_date, String end_date) throws UnsupportedEncodingException;
	
	public void pageQuery(PageBean pageBean);

	public List findAllClass();

	public void changeStatus(Student model);

	public Student findById(String id);

	public void save(Student student);

	public void update(Student student);

	public void delete(Student model);

	public List<Student> findStudentByStudent_noAndGrade_idAndClass_id(String student_no,String grade_id,String class_id);

	public void batchAllotStudent(Student model, String studentIds,String STUDENT_ALLOT) throws IOException;;

	public void batchEnterStudent(Student model, String studentIds, String STUDENT_ENTER) throws IOException;

	public void editStudent(Student model);

	public void enterStudent(Student model);

	public void changeGrader(Student model);

	public void leaveSchool(Student model);

	public void backSchool(Student model);

	public void termQuery(Student model, PageBean pageBean, DetachedCriteria detachedCriteria);

	public List<Student> resolveStudent(Student model, File file)throws FileNotFoundException, IOException;

	public void addStudent(Student model, String[] interests, String STUDENT_EDIT) throws IOException;

	public List<Student> findByGrade_idAndClass_id(String grade_id, String class_id);

	public List<Student> findByClasses(Classes classes);

	public List<Student> findStudentByStudent_noAndClasses(String student_no, String class_id);

	public List<Student> finByLikeName(String student_name);

	public Classes getClasses(Student student);

	public List<Student> findByPhone(String phone);

	public List<Student> findByPhoneAndPassword(String phone, String password);

	public List<StudentImageUrl> getImageUrl(Student student);

	public List<Student> getStudent(Teacher teacher);

	public void importPicture(Student model, File[] fileselect) throws FileNotFoundException, IOException;

	public void changeInfo(Student model, String type);

	public void exportStudent(String class_ids, String[] filed, String statuss) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, IOException;

}
