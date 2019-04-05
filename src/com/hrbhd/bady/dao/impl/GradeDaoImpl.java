package com.hrbhd.bady.dao.impl;

import java.util.List;


import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.hrbhd.bady.dao.IGradeDao;
import com.hrbhd.bady.dao.base.impl.BaseDaoImpl;
import com.hrbhd.bady.domain.ClassType;
import com.hrbhd.bady.domain.Grade;

@Repository
public class GradeDaoImpl extends BaseDaoImpl<Grade>implements IGradeDao {

	@Override
	public List<Grade> findByName(String name) {

		Criteria criteria = getSession().createCriteria(Grade.class, "g");
		List<Grade> list = criteria.add(Restrictions.eq("name", name)).list();

		return list;
	}

	@Override
	public List<Grade> findAllGrades() {
		
		Criteria criteria = getSession().createCriteria(Grade.class, "g");
		List<Grade> list = criteria.add(Restrictions.eq("status", "1")).list();

		return list;
		//奶奶的,用了下面之后web层出现类型转换异常.
		//String sql = "SELECT *FROM t_grade WHERE STATUS ='1';";
		//return getSession().createSQLQuery(sql).list();
		
	}

	@Override
	public List<Grade> findAllGradesByStatus() {
		Criteria criteria = getSession().createCriteria(Grade.class, "g");
		List<Grade> list = criteria.add(Restrictions.eq("status", "1")).list();
		return list;
	}
	
	

}
