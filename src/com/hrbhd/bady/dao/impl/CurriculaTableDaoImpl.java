package com.hrbhd.bady.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.hrbhd.bady.dao.ICurriculaTableDao;
import com.hrbhd.bady.dao.base.impl.BaseDaoImpl;
import com.hrbhd.bady.domain.CurriculaTable;

@Repository
public class CurriculaTableDaoImpl extends BaseDaoImpl<CurriculaTable> implements ICurriculaTableDao{

	@Override
	public CurriculaTable findByClassId(String cid) {
		
		Criteria criteria = getSession().createCriteria(CurriculaTable.class, "c");
		criteria.add(Restrictions.eq("class_id", cid));
		List list = criteria.list();
		
		if(list!=null&&list.size()>0){
			return (CurriculaTable) list.get(0);
		}
		
		return null;
	}

}
