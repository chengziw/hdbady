package com.hrbhd.bady.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.hrbhd.bady.dao.INoticeTeacherCheckDao;
import com.hrbhd.bady.dao.base.impl.BaseDaoImpl;
import com.hrbhd.bady.domain.Notice;
import com.hrbhd.bady.domain.NoticeTeacherCheck;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.Teacher;

@Repository
public class NoticeTeacherCheckDaoImpl extends BaseDaoImpl<NoticeTeacherCheck> implements INoticeTeacherCheckDao{

	@Override
	public NoticeTeacherCheck findByNoticeAndTeacher(Notice notice, Teacher teacher) {
		
		Criteria criteria = getSession().createCriteria(NoticeTeacherCheck.class, "n");
		criteria.add(Restrictions.eq("notice_id", notice.getId()));
		criteria.add(Restrictions.eq("teacher_id", teacher.getId()));
		List list = criteria.list();
		if(list!=null){
			return (NoticeTeacherCheck) list.get(0);
		}
		return null;
		
	}

	@Override
	public List<NoticeTeacherCheck> findByNoticeId(String id) {
		
		Criteria criteria = getSession().createCriteria(NoticeTeacherCheck.class, "n");
		criteria.add(Restrictions.eq("notice_id", id));
		List list = criteria.list();
		return list;
		
	}

	@Override
	public List<NoticeTeacherCheck> findByNoticeIdAndCheck(String id) {

		Criteria criteria = getSession().createCriteria(NoticeTeacherCheck.class, "n");
		criteria.add(Restrictions.eq("notice_id", id));
		criteria.add(Restrictions.eq("checked", "True"));
		List list = criteria.list();
		
		return list;
		
	}
	@Override
	public List<NoticeTeacherCheck> findByNoticeIdAndNOCheck(String id){

		Criteria criteria = getSession().createCriteria(NoticeTeacherCheck.class, "n");
		criteria.add(Restrictions.eq("notice_id", id));
		criteria.add(Restrictions.isNull("checked"));
		List list = criteria.list();
		
		return list;
		
	}

	@Override
	public NoticeTeacherCheck findByTeacherAndNotice(String tid, String nid) {
		
		Criteria criteria = getSession().createCriteria(NoticeTeacherCheck.class, "n");
		criteria.add(Restrictions.eq("notice_id", nid));
		criteria.add(Restrictions.eq("teacher_id", tid));
		List list = criteria.list();
		if(list!=null&&list.size()>0){
			return (NoticeTeacherCheck) list.get(0);
		}
		return null;
	}

	@Override
	public List<NoticeTeacherCheck> findByTeacherAndChecked(String teacher_id) {
		
		Criteria criteria = getSession().createCriteria(NoticeTeacherCheck.class, "n");
		criteria.add(Restrictions.eq("teacher_id", teacher_id));
		criteria.add(Restrictions.isNull("checked"));
		List list = criteria.list();
		
		return list;

	}
	

}
