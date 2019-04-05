package com.hrbhd.bady.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.hrbhd.bady.dao.ICurriculaTableItemDao;
import com.hrbhd.bady.dao.base.impl.BaseDaoImpl;
import com.hrbhd.bady.domain.CurriculaTableItem;
import com.hrbhd.bady.domain.Grade;

@Repository
public class CurriculaTableItemDaoImpl extends BaseDaoImpl<CurriculaTableItem> implements ICurriculaTableItemDao{

	@Override
	public List<CurriculaTableItem> findByWCT(CurriculaTableItem curriculaTableItem) {
		
		String week = curriculaTableItem.getWeek();
		String course = curriculaTableItem.getCourse();
		String teacher_id = curriculaTableItem.getTeacher_id();
		
		Criteria criteria = getSession().createCriteria(CurriculaTableItem.class, "c");
		
		criteria.add(Restrictions.eq("week", week));
		criteria.add(Restrictions.eq("course", course));
		criteria.add(Restrictions.eq("teacher_id", teacher_id));
		
		List<CurriculaTableItem> list = criteria.list();
		
		return list;
	}

	@Override
	public List<CurriculaTableItem> findByTeacherId(String id) {
		
		Criteria criteria = getSession().createCriteria(CurriculaTableItem.class, "c");
		criteria.add(Restrictions.eq("teacher_id", id));
		List list = criteria.list();
		
		return list;
	}

	@Override
	public List<CurriculaTableItem> findByCurriculaTableId(String id) {
		
		Criteria criteria = getSession().createCriteria(CurriculaTableItem.class, "c");
		criteria.add(Restrictions.eq("curricula_table_id", id));
		criteria.addOrder(Order.asc("course"));
		criteria.addOrder(Order.asc("week"));
		List list = criteria.list();
		
		return list;
	}

}
