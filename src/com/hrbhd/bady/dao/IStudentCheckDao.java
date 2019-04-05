package com.hrbhd.bady.dao;

import java.util.List;

import com.hrbhd.bady.dao.base.IBaseDao;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.StudentCheck;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.domain.TeacherCheck;

public interface IStudentCheckDao extends IBaseDao<StudentCheck>{

	public List<StudentCheck> getCheckStudent(String syear, String smonth);

	public List<StudentCheck> findByStudentAndMonth(Student student, String check_time);

	public StudentCheck findByStudentIdAndDate(String student_id);

	public List<StudentCheck> findByclassIdAndDay(String id);

	public List<StudentCheck> findStudentCheckByYearAndMonthAndStudentId(String syear, String smonth,
			String student_id);

	public StudentCheck findByStudentAndDay(Student student, String currentDay);

	public List<TeacherCheck> findByStudentAndStatus(String student_id, String smonth);

	public List<TeacherCheck> findByStudentAndStatus(String student_id, String smonth, String morningStatus,
			String afternoonStatus);

	public List<StudentCheck> findByclassIdAndDayAndStatus(String class_id, String status, String currentDay);

}
