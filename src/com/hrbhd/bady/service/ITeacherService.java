package com.hrbhd.bady.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;
import java.util.Set;

import org.hibernate.criterion.DetachedCriteria;

import com.hrbhd.bady.domain.Page;
import com.hrbhd.bady.domain.Structure;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.StudentCheck;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.util.PageBean;

public interface ITeacherService {

	public void pageQuery(PageBean pageBean);

	public void save(Teacher model);

	public Teacher findById(String id);

	public void leaveTeacher(Teacher model, String TEACHER_LEAVE);

	public void retireTeacher(Teacher model, String TEACHER_RETIRE);

	public void editTeacher(Teacher model);

	public void vacationTeacher(Teacher model, String TEACHER_VACATION);

	public void shiftTeacher(Teacher model, String TEACHER_SHIFT);

	public void resumeTeacher(Teacher model, String TEACHER_RESUME);

	public void multiplexTeacher(Teacher model);
	
	public List<Teacher> resolveTeacher(Teacher model, File file) throws FileNotFoundException, IOException ;

	public List findTeacher(String teacher_name);

	public List findAll();

	public List<Teacher> findByPhone(String phone);

	public List<Teacher> findByPhoneAndPassword(String phone, String password);

	public List<Teacher> findAllTeacherByStatus();

	public Set<String> getPagePower(Teacher teacher);

	public Set<String> getElementPower(Teacher teacher);

	public List<Teacher> findByDutyName(String duty_name);

	public List<Teacher> findByStructureName(String structure_name);

	public List<Teacher> findByStructure(Structure structure);

	public void termQuery(Teacher model, PageBean pageBean, DetachedCriteria detachedCriteria, String entry_time_start,
			String entry_time_end);

	public void addTeacher(Teacher model, String TEACHER_ADD);

	public List<Teacher> findAllTeacherLikeTeacherName(String teacher_name);
		
	public String findAllTeacherToCurriculaTableAdd();

	public void editSelf(Teacher model) throws IOException;

	public void editPassword(Teacher model,String new_password, String new_password_copy) throws IOException;

	public StudentCheck findByStudentIdAndDate(String student_id);

	public void changeInfo(Teacher model,String type);

	public void setTeacherLoginTime(String id);

	public List<Teacher> findByWorknumber(String worknumber);

	public List<Teacher> findAllTeacherByStatusAndName(String teacher_name);

}
