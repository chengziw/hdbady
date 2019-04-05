package com.hrbhd.bady.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.hrbhd.bady.dao.IClassesDao;
import com.hrbhd.bady.dao.base.impl.BaseDaoImpl;
import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.Teacher;

@Repository
public class ClassesDaoImpl extends BaseDaoImpl<Classes> implements IClassesDao {

	@Override
	public List<Classes> findClassByClassName(String class_name) {

		Criteria criteria = getSession().createCriteria(Classes.class, "c");

		List list = criteria.add(Restrictions.eq("class_name", class_name)).list();

		return list;
	}

	@Override
	public List<Classes> findAllClass() {
		Criteria criteria = getSession().createCriteria(Classes.class, "c");
		return criteria.list();
	}

	@Override
	public List<Classes> findClassByClassNameAndGrade(String class_name, String grade_id) {

		Criteria criteria = getSession().createCriteria(Classes.class, "c");

		criteria.add(Restrictions.eq("class_name", class_name));
		criteria.add(Restrictions.eq("grade_id", grade_id));

		List list = criteria.list();

		return list;
	}

	@Override
	public List<Classes> findAllClassByGrade(Grade grade) {

		Criteria criteria = getSession().createCriteria(Classes.class, "c");

		criteria.add(Restrictions.eq("grade.id", grade.getId()));

		List list = criteria.list();

		return list;
	}

	@Override
	public List<Classes> findByGrade(Grade grade) {
		
		String id = grade.getId();
		Criteria criteria = getSession().createCriteria(Classes.class, "c");
		criteria.add(Restrictions.eq("grade", grade));
		List list = criteria.list();
		
		return list;
	}

	@Override
	public Classes findClassesByTeacherId(String id) {
		
		Criteria criteria = getSession().createCriteria(Classes.class, "c");
		criteria.add(Restrictions.eq("teacher_id", id));
		List list = criteria.list();
		Classes classes = null;
		if(list!=null){
			classes = (Classes) list.get(0);
		}
		return classes;
	}

}
