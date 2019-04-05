package com.hrbhd.bady.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.hrbhd.bady.dao.ISubjectDao;
import com.hrbhd.bady.dao.base.impl.BaseDaoImpl;
import com.hrbhd.bady.domain.ClassType;
import com.hrbhd.bady.domain.Subject;

@Repository
public class SubjectDaoImpl extends BaseDaoImpl<Subject> implements ISubjectDao{

	@Override
	public List<Subject> findByName(String name) {
		Criteria criteria = getSession().createCriteria(Subject.class, "s");
		List list = criteria.add(Restrictions.eq("name", name)).list();
	
		return list;
	}

	@Override
	public List<Subject> findByStatus() {
		Criteria criteria = getSession().createCriteria(Subject.class, "s");
		List list = criteria.add(Restrictions.eq("status", "1")).list();
	
		return list;
	}

}
