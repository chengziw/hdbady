package com.hrbhd.bady.dao.impl;

import java.sql.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.hrbhd.bady.dao.IStudentMonthCheckDao;
import com.hrbhd.bady.dao.base.impl.BaseDaoImpl;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.StudentCheck;
import com.hrbhd.bady.domain.StudentMonthCheck;
import com.hrbhd.bady.util.TimeUtil;

@Repository
public class StudentMonthCheckDaoImpl extends BaseDaoImpl<StudentMonthCheck> implements IStudentMonthCheckDao {

	@Override
	public List<StudentMonthCheck> findByMonthAndYear(String year_label, String month_label) {

		Criteria criteria = getSession().createCriteria(StudentMonthCheck.class, "s");
		criteria.add(Restrictions.eq("year_label", year_label));
		criteria.add(Restrictions.eq("month_label", month_label));
		List list = criteria.list();

		return list;
	}

}
