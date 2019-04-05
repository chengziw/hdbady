package com.hrbhd.bady.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.hrbhd.bady.dao.IClassTypeDao;
import com.hrbhd.bady.dao.base.impl.BaseDaoImpl;
import com.hrbhd.bady.domain.ClassType;
import com.hrbhd.bady.domain.Classes;

@Repository
public class ClassTypeDaoImpl extends BaseDaoImpl<ClassType> implements IClassTypeDao{

	@Override
	public List <ClassType> findByTypeName(String type_name) {
		
		Criteria criteria = getSession().createCriteria(ClassType.class, "c");
		List list = criteria.add(Restrictions.eq("type_name", type_name)).list();
	
		return list;
	}

	@Override
	public List<ClassType> findByStatus() {
		Criteria criteria = getSession().createCriteria(ClassType.class, "c");
		List list = criteria.add(Restrictions.eq("status", "1")).list();
		return list;
	}

}
