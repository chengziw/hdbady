package com.hrbhd.bady.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.hrbhd.bady.dao.ITeacherVacationDao;
import com.hrbhd.bady.dao.base.impl.BaseDaoImpl;
import com.hrbhd.bady.domain.StudentVacation;
import com.hrbhd.bady.domain.TeacherVacation;

@Repository
public class TeacherVacationDaoImpl extends BaseDaoImpl<TeacherVacation> implements ITeacherVacationDao{

	@Override
	public List<TeacherVacation> findByTeacherId(String id) {
		
		Criteria criteria = getSession().createCriteria(TeacherVacation.class, "sv");
		criteria.createAlias("teacher", "t");
		List<TeacherVacation> list = criteria.add(Restrictions.eq("t.id", id)).list();

		return list;
	}

}
