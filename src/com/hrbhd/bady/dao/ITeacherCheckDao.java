package com.hrbhd.bady.dao;

import java.util.List;

import com.hrbhd.bady.dao.base.IBaseDao;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.domain.TeacherCheck;

public interface ITeacherCheckDao extends IBaseDao<TeacherCheck>{

	public List<TeacherCheck> getCheckStudent(String syear, String smonth);

	public List<TeacherCheck> findByTeacherAndMonth(Teacher teacher, String check_time);

	public TeacherCheck findByTeacherAndDay(Teacher teacher, String currentDay);

	public List<TeacherCheck> findTeacherCheckByYearAndMonthAndTeacherId(String syear, String smonth, String teacher_id);

	public List<TeacherCheck> findByTeacherAndStatus(String teacher_id,String smonth, String morningStatus, String afternoonStatus);

	public List<TeacherCheck> findByTeacherAndStatus(String teacher_id ,String smonth);


}
