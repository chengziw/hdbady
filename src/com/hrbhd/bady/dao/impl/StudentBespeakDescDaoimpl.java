package com.hrbhd.bady.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hrbhd.bady.dao.IStudentBespeakDescDao;
import com.hrbhd.bady.dao.base.impl.BaseDaoImpl;
import com.hrbhd.bady.domain.StudentBespeakDesc;

@Repository
public class StudentBespeakDescDaoimpl extends BaseDaoImpl<StudentBespeakDesc> implements IStudentBespeakDescDao{

	@Override
	public List<StudentBespeakDesc> findByBespeakId(String id) {
		String sql = "SELECT *FROM t_student_bespeak_desc WHERE bespeak_id="+id+"";
		return getSession().createSQLQuery(sql).list();
		/*String hql = "FROM StudentBespeakDesc s WHERE s.bespeak_id = ?";
		List<StudentBespeakDesc> list = this.getHibernateTemplate().find(hql, id);
		return list;*/
	}

}
