package com.hrbhd.bady.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.hrbhd.bady.dao.IElementDao;
import com.hrbhd.bady.dao.base.impl.BaseDaoImpl;
import com.hrbhd.bady.domain.Element;
import com.hrbhd.bady.domain.Grade;

@Repository
public class ElementDaoImpl extends BaseDaoImpl<Element> implements IElementDao{

	@Override
	public Element findByCode(String code) {
		
		Criteria criteria = getSession().createCriteria(Element.class, "e");
		List<Element> list = criteria.add(Restrictions.eq("code", code)).list();

		return list.get(0);
	}

}
