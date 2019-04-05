package com.hrbhd.bady.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.hrbhd.bady.dao.IAskTeacherCheckDao;
import com.hrbhd.bady.dao.base.impl.BaseDaoImpl;
import com.hrbhd.bady.domain.Ask;
import com.hrbhd.bady.domain.AskTeacherCheck;
import com.hrbhd.bady.domain.NoticeStudentCheck;
import com.hrbhd.bady.domain.Teacher;

@Repository
public class AskTeacherCheckDaoImpl extends BaseDaoImpl<AskTeacherCheck> implements IAskTeacherCheckDao{

	@Override
	public AskTeacherCheck findByAskAndTeacher(String ask_id, String teacher_id) {
		Criteria criteria = getSession().createCriteria(AskTeacherCheck.class, "a");
		criteria.add(Restrictions.eq("ask_id", ask_id));
		criteria.add(Restrictions.eq("teacher_id", teacher_id));
		List list = criteria.list();
		if(list!=null&&list.size()>0){
			return (AskTeacherCheck) list.get(0);
		}
		return null;
	}

	@Override
	public List<AskTeacherCheck> findByAskIdAndCheck(String id) {
		Criteria criteria = getSession().createCriteria(AskTeacherCheck.class, "a");
		criteria.add(Restrictions.eq("ask_id", id));
		criteria.add(Restrictions.isNotNull("checked"));
		List list = criteria.list();
		return list;
	}
	
	@Override
	public List<AskTeacherCheck> findByAskIdAndNoCheck(String id){
		Criteria criteria = getSession().createCriteria(AskTeacherCheck.class, "a");
		criteria.add(Restrictions.eq("ask_id", id));
		criteria.add(Restrictions.isNull("checked"));
		List list = criteria.list();
		return list;
	}

	@Override
	public List<AskTeacherCheck> findByChecked(String askItemsId) {
		Criteria criteria = getSession().createCriteria(AskTeacherCheck.class, "a");
		criteria.add(Restrictions.eq("checked", askItemsId));
		List list = criteria.list();
		return list;
	}

	@Override
	public List<AskTeacherCheck> findByAsk(Ask ask) {
		
		String id = ask.getId();
		Criteria criteria = getSession().createCriteria(AskTeacherCheck.class, "a");
		criteria.add(Restrictions.eq("ask_id", id));
		List list = criteria.list();
		
		return list;
	}

	@Override
	public List<AskTeacherCheck> findChecked(String aid) {
		Criteria criteria = getSession().createCriteria(AskTeacherCheck.class, "a");
		criteria.add(Restrictions.isNotNull("checked"));
		criteria.add(Restrictions.eq("ask_id", aid));
		List list = criteria.list();
		return list;
	}

	@Override
	public List<AskTeacherCheck> findByTeacherAndChecked(String teacher_id) {
		
		Criteria criteria = getSession().createCriteria(AskTeacherCheck.class, "a");
		criteria.add(Restrictions.isNull("checked"));
		criteria.add(Restrictions.eq("teacher_id", teacher_id));
		List list = criteria.list();
		
		return list;
	}

}
