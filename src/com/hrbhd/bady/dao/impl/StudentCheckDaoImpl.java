package com.hrbhd.bady.dao.impl;

import java.sql.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.propertyeditors.CurrencyEditor;
import org.springframework.stereotype.Repository;

import com.hrbhd.bady.dao.IStudentCheckDao;
import com.hrbhd.bady.dao.base.impl.BaseDaoImpl;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.StudentCheck;
import com.hrbhd.bady.domain.StudentMonthCheck;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.domain.TeacherCheck;
import com.hrbhd.bady.util.TimeUtil;

@Repository
public class StudentCheckDaoImpl extends BaseDaoImpl<StudentCheck> implements IStudentCheckDao{

	@Override
	public List<StudentCheck> getCheckStudent(String syear, String smonth) {
		Criteria criteria = getSession().createCriteria(StudentCheck.class, "s");
		
		int year = Integer.parseInt(syear);
		int month = Integer.parseInt(smonth);
	
		int monthDay = TimeUtil.getMonthLastDay(year,month);
		/*if(month<10){
			smonth="0"+smonth;
		}*/
		String start_date = syear+"-"+smonth+"-"+"1";
		String end_date = syear+"-"+smonth+"-"+monthDay;

		Date start_date_format = TimeUtil.getDate(start_date);
		criteria.add(Restrictions.ge("date_label_format", start_date_format));

		Date end_date_format = TimeUtil.getDate(end_date);
		criteria.add(Restrictions.le("date_label_format", end_date_format));
		
		criteria.addOrder(Order.asc("date_label"));
		
		List list = criteria.list();
		
		return list;
	}

	@Override
	public List<StudentCheck> findByStudentAndMonth(Student student, String check_time) {

		Criteria criteria = getSession().createCriteria(StudentCheck.class, "s");
		
		String id = student.getId();
		String[] split = check_time.split("-");
		String year_label = split[0];
		String month_label = split[1];
		
		criteria.add(Restrictions.eq("student_id", id));
		criteria.add(Restrictions.eq("year_label", year_label));
		criteria.add(Restrictions.eq("month_label", month_label));
		
		List list = criteria.list();
		
		return list;
		
	}

	@Override
	public StudentCheck findByStudentIdAndDate(String student_id) {

		Criteria criteria = getSession().createCriteria(StudentCheck.class, "s");
		String currentDay = TimeUtil.getCurrentDay();
		criteria.add(Restrictions.eq("student_id", student_id));
		criteria.add(Restrictions.eq("date_label", currentDay));
		
		List list = criteria.list();
		StudentCheck studentCheck = null;
		if(list!=null){
			studentCheck = (StudentCheck) list.get(0);
		}
		return studentCheck;
	}

	@Override
	public List<StudentCheck> findByclassIdAndDay(String id) {
		
		Criteria criteria = getSession().createCriteria(StudentCheck.class, "s");
		String currentDay = TimeUtil.getCurrentDay();
		criteria.add(Restrictions.eq("classes.id", id));
		criteria.add(Restrictions.eq("date_label", currentDay));
		
		List list = criteria.list();
		return list;
	}

	@Override
	public List<StudentCheck> findStudentCheckByYearAndMonthAndStudentId(String syear, String smonth,
			String student_id) {
		
		Criteria criteria = getSession().createCriteria(StudentCheck.class, "t");
		
		criteria.add(Restrictions.eq("student_id", student_id));
		criteria.add(Restrictions.eq("year_label", syear));
		criteria.add(Restrictions.eq("month_label", smonth));
		criteria.addOrder(Order.asc("date_label"));
		
		List list = criteria.list();
		
		return list;
	}

	@Override
	public StudentCheck findByStudentAndDay(Student student, String currentDay) {
		
		String id = student.getId();
		Criteria criteria = getSession().createCriteria(StudentCheck.class, "s");
		
		criteria.add(Restrictions.eq("student_id", id));
		criteria.add(Restrictions.eq("date_label", currentDay));
		List list = criteria.list();
		
		if(list!=null&&list.size()>0){
			return (StudentCheck) list.get(0);
		}
		return null;
	}

	@Override
	public List<TeacherCheck> findByStudentAndStatus(String student_id, String smonth) {
		
		Criteria criteria = getSession().createCriteria(StudentCheck.class, "s");
		criteria.add(Restrictions.ne("month_label", smonth));
		criteria.add(Restrictions.ne("morningStatus", "1"));
		criteria.add(Restrictions.ne("morningStatus", "2"));
		criteria.add(Restrictions.ne("morningStatus", "3"));
		
		List list = criteria.list();
		
		return null;
	}

	@Override
	public List<TeacherCheck> findByStudentAndStatus(String student_id, String smonth, String morningStatus,
			String afternoonStatus) {
		
		Criteria criteria = getSession().createCriteria(StudentCheck.class, "s");
		criteria.add(Restrictions.ne("month_label", smonth));
		/*
		 * criteria.setProjection(Projections.rowCount());
		 * criteria.setProjection(Projections.count("morningStatus"));
		 * criteria.setProjection(Projections.count("afternoonStatus"));
		 */
		if (!"".equals(morningStatus)) {
			criteria.add(Restrictions.eq("morningStatus", morningStatus));
		}
		if (!"".equals(afternoonStatus)) {
			criteria.add(Restrictions.eq("afternoonStatus", afternoonStatus));
		}
		List list = criteria.list();

		return list;
	}

	@Override
	public List<StudentCheck> findByclassIdAndDayAndStatus(String class_id, String status, String currentDay) {
		
		Criteria criteria = getSession().createCriteria(StudentCheck.class, "s");
		criteria.add(Restrictions.eq("classes_id", class_id));
		criteria.add(Restrictions.eq("date_label", currentDay));
		criteria.add(Restrictions.eq("status", status));
		List list = criteria.list();
		
		return list;
	}

}
