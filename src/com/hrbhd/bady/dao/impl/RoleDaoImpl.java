package com.hrbhd.bady.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.hrbhd.bady.dao.IRoleDao;
import com.hrbhd.bady.dao.base.impl.BaseDaoImpl;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.Role;

@Repository
public class RoleDaoImpl extends BaseDaoImpl<Role> implements IRoleDao{

	@Override
	public List findByName(String name) {
		
		Criteria criteria = getSession().createCriteria(Role.class, "r");
		List<Role> list = criteria.add(Restrictions.eq("name", name)).list();
		
		return list;
	}

}
