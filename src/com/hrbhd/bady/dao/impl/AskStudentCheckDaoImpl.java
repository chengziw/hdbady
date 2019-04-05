package com.hrbhd.bady.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.hrbhd.bady.dao.IAskStudentCheckDao;
import com.hrbhd.bady.dao.base.impl.BaseDaoImpl;
import com.hrbhd.bady.domain.Ask;
import com.hrbhd.bady.domain.AskStudentCheck;
import com.hrbhd.bady.domain.AskTeacherCheck;
import com.hrbhd.bady.domain.Student;

@Repository
public class AskStudentCheckDaoImpl extends BaseDaoImpl<AskStudentCheck> implements IAskStudentCheckDao{

	@Override
	public AskStudentCheck findByAskAndStudent(String ask_id, String student_id) {
		Criteria criteria = getSession().createCriteria(AskStudentCheck.class, "a");
		criteria.add(Restrictions.eq("ask_id", ask_id));
		criteria.add(Restrictions.eq("student_id", student_id));
		List list = criteria.list();
		if(list!=null){
			return (AskStudentCheck) list.get(0);
		}
		return null;
	}

	@Override
	public List<AskStudentCheck> findByAskIdAndCheck(String id) {
		Criteria criteria = getSession().createCriteria(AskStudentCheck.class, "a");
		criteria.add(Restrictions.eq("ask_id", id));
		criteria.add(Restrictions.isNotNull("checked"));
		List list = criteria.list();
		return list;
	}
	
	@Override
	public List<AskStudentCheck> findByAskIdAndNoCheck(String id){
		Criteria criteria = getSession().createCriteria(AskStudentCheck.class, "a");
		criteria.add(Restrictions.eq("ask_id", id));
		criteria.add(Restrictions.isNull("checked"));
		List list = criteria.list();
		return list;
	}

	@Override
	public List<AskStudentCheck> findByChecked(String askItemsId) {
		Criteria criteria = getSession().createCriteria(AskStudentCheck.class, "a");
		criteria.add(Restrictions.eq("checked", askItemsId));
		List list = criteria.list();
		return list;
	}

	@Override
	public List<AskStudentCheck> findByAsk(Ask ask) {
		
		String id = ask.getId();
		Criteria criteria = getSession().createCriteria(AskStudentCheck.class, "a");
		criteria.add(Restrictions.eq("ask_id", id));
		List list = criteria.list();
		
		return list;
	}

	@Override
	public List<AskStudentCheck> findChecked(String aid) {
		Criteria criteria = getSession().createCriteria(AskStudentCheck.class, "a");
		criteria.add(Restrictions.isNotNull("checked"));
		criteria.add(Restrictions.eq("ask_id", aid));
		List list = criteria.list();
		return list;
	}

	@Override
	public List<AskTeacherCheck> findByStudentAndChecked(String student_id) {
		Criteria criteria = getSession().createCriteria(AskStudentCheck.class, "a");
		criteria.add(Restrictions.eq("student_id", student_id));
		criteria.add(Restrictions.isNull("checked"));
		List list = criteria.list();
		return list;
	}


}
