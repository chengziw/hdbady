package com.hrbhd.bady.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.hrbhd.bady.dao.ITeacherMonthCheckDao;
import com.hrbhd.bady.dao.base.impl.BaseDaoImpl;
import com.hrbhd.bady.domain.StudentMonthCheck;
import com.hrbhd.bady.domain.TeacherMonthCheck;

@Repository
public class TeacherMonthCheckDaoImpl extends BaseDaoImpl<TeacherMonthCheck> implements ITeacherMonthCheckDao{

	@Override
	public List<TeacherMonthCheck> findByMonthAndYear(String year_label, String month_label) {
		Criteria criteria = getSession().createCriteria(TeacherMonthCheck.class, "s");
		criteria.add(Restrictions.eq("year_label", year_label));
		criteria.add(Restrictions.eq("month_label", month_label));
		List list = criteria.list();
		return list;
	}

}
