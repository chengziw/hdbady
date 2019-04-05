package com.hrbhd.bady.dao.impl;

import java.sql.Date;
import java.sql.Time;
import java.util.Calendar;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.hrbhd.bady.dao.ITeacherCheckDao;
import com.hrbhd.bady.dao.base.impl.BaseDaoImpl;
import com.hrbhd.bady.domain.StudentCheck;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.domain.TeacherCheck;
import com.hrbhd.bady.util.TimeUtil;

@Repository
public class TeacherCheckDaoImpl extends BaseDaoImpl<TeacherCheck> implements ITeacherCheckDao {

	@Override
	public List<TeacherCheck> getCheckStudent(String syear, String smonth) {
		Criteria criteria = getSession().createCriteria(TeacherCheck.class, "t");

		int year = Integer.parseInt(syear);
		int month = Integer.parseInt(smonth);

		int monthDay = TimeUtil.getMonthLastDay(year, month);
		/*
		 * if(month<10){ smonth="0"+smonth; }
		 */
		String start_date = syear + "-" + smonth + "-" + "1";
		String end_date = syear + "-" + smonth + "-" + monthDay;

		Date start_date_format = TimeUtil.getDate(start_date);
		criteria.add(Restrictions.ge("date_label_format", start_date_format));

		Date end_date_format = TimeUtil.getDate(end_date);
		criteria.add(Restrictions.le("date_label_format", end_date_format));

		criteria.addOrder(Order.asc("date_label"));

		List list = criteria.list();

		return list;
	}

	@Override
	public List<TeacherCheck> findByTeacherAndMonth(Teacher teacher, String check_time) {

		Criteria criteria = getSession().createCriteria(TeacherCheck.class, "t");
		// criteria.createAlias("Teacher", "t");

		String id = teacher.getId();
		String[] split = check_time.split("-");
		String year_label = split[0];
		String month_label = split[1];

		criteria.add(Restrictions.eq("teacher_id", id));
		criteria.add(Restrictions.eq("year_label", year_label));
		criteria.add(Restrictions.eq("month_label", month_label));
		criteria.addOrder(Order.asc("date_label"));

		List list = criteria.list();

		return list;
	}

	@Override
	public TeacherCheck findByTeacherAndDay(Teacher teacher, String currentDay) {

		String id = teacher.getId();
		Criteria criteria = getSession().createCriteria(TeacherCheck.class, "t");

		criteria.add(Restrictions.eq("teacher_id", id));
		criteria.add(Restrictions.eq("date_label", currentDay));
		List list = criteria.list();

		if (list != null && list.size() > 0) {
			return (TeacherCheck) list.get(0);
		}
		return null;
	}

	@Override
	public List<TeacherCheck> findTeacherCheckByYearAndMonthAndTeacherId(String syear, String smonth,
			String teacher_id) {

		Criteria criteria = getSession().createCriteria(TeacherCheck.class, "t");

		criteria.add(Restrictions.eq("teacher_id", teacher_id));
		criteria.add(Restrictions.eq("year_label", syear));
		criteria.add(Restrictions.eq("month_label", smonth));
		criteria.addOrder(Order.asc("date_label"));

		List list = criteria.list();

		return list;
	}

	@Override
	public List<TeacherCheck> findByTeacherAndStatus(String teacher_id,String smonth, String morningStatus, String afternoonStatus) {
		
		Criteria criteria = getSession().createCriteria(TeacherCheck.class, "t");
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
	public List<TeacherCheck> findByTeacherAndStatus(String teacher_id,String smonth) {
		
		Criteria criteria = getSession().createCriteria(TeacherCheck.class, "t");
		criteria.add(Restrictions.ne("month_label", smonth));
		criteria.add(Restrictions.ne("morningStatus", "1"));
		criteria.add(Restrictions.ne("morningStatus", "2"));
		criteria.add(Restrictions.ne("morningStatus", "3"));
		
		List list = criteria.list();

		return list;
	}

}
