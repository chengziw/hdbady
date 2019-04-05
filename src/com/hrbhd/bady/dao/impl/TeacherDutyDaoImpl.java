package com.hrbhd.bady.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.hrbhd.bady.dao.ITeacherDutyDao;
import com.hrbhd.bady.dao.base.impl.BaseDaoImpl;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.TeacherDuty;

@Repository
public class TeacherDutyDaoImpl extends BaseDaoImpl<TeacherDuty> implements ITeacherDutyDao{

	@Override
	public List<TeacherDuty> findByDutyName(String duty_name) {
		Criteria criteria = getSession().createCriteria(TeacherDuty.class, "t");
		List list = criteria.add(Restrictions.eq("duty_name", duty_name)).list();

		return list;
	}

	@Override
	public List<TeacherDuty> findAllTeacherDuty() {
		Criteria criteria = getSession().createCriteria(TeacherDuty.class, "t");
		List list = criteria.add(Restrictions.eq("status", "1")).list();
		return list;
	}

}
