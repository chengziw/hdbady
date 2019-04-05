package com.hrbhd.bady.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.hrbhd.bady.dao.IStudentVacationDao;
import com.hrbhd.bady.dao.base.impl.BaseDaoImpl;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.StudentVacation;

@Repository
public class StudentVacationDaoImpl extends BaseDaoImpl<StudentVacation> implements IStudentVacationDao{

	@Override
	public List<StudentVacation> findByStudentId(String student_id) {
		
		Criteria criteria = getSession().createCriteria(StudentVacation.class, "sv");
		List<StudentVacation> list = criteria.add(Restrictions.eq("student.id", student_id)).list();

		return list;
	}
	
	
	@Override
	public List<StudentVacation> findByStudentIdAndStatus(String student_id) {
		
		Criteria criteria = getSession().createCriteria(StudentVacation.class, "sv");
		criteria.add(Restrictions.eq("student.id", student_id));
		criteria.add(Restrictions.eq("status", "1"));
		List list = criteria.list();
		
		return list;
	}

}
