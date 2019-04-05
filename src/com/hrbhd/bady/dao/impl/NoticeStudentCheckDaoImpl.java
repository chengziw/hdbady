package com.hrbhd.bady.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.hrbhd.bady.dao.INoticeStudentCheckDao;
import com.hrbhd.bady.dao.base.impl.BaseDaoImpl;
import com.hrbhd.bady.domain.Notice;
import com.hrbhd.bady.domain.NoticeStudentCheck;
import com.hrbhd.bady.domain.NoticeTeacherCheck;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.web.action.base.BaseAction;

@Repository
public class NoticeStudentCheckDaoImpl extends BaseDaoImpl<NoticeStudentCheck> implements INoticeStudentCheckDao{

	@Override
	public NoticeStudentCheck findByNoticeAndStudent(Notice notice, Student student) {

		Criteria criteria = getSession().createCriteria(NoticeStudentCheck.class, "n");
		criteria.add(Restrictions.eq("notice_id", notice.getId()));
		criteria.add(Restrictions.eq("student_id", student.getId()));
		List list = criteria.list();
		if(list!=null){
			return (NoticeStudentCheck) list.get(0);
		}
		return null;
	}

	@Override
	public List<NoticeStudentCheck> findByNoticeIdAndNoCheck(String id) {
		Criteria criteria = getSession().createCriteria(NoticeStudentCheck.class, "n");
		criteria.add(Restrictions.eq("notice_id", id));
		criteria.add(Restrictions.isNull("checked"));
		List list = criteria.list();
		return list;
	}

	@Override
	public List<NoticeStudentCheck> findByNoticeIdAndCheck(String id) {
		Criteria criteria = getSession().createCriteria(NoticeStudentCheck.class, "n");
		criteria.add(Restrictions.eq("notice_id", id));
		criteria.add(Restrictions.eq("checked", "True"));
		List list = criteria.list();
		return list;
	}

	@Override
	public List<NoticeTeacherCheck> findByStudentAndChecked(String student_id) {
		Criteria criteria = getSession().createCriteria(NoticeStudentCheck.class, "n");
		criteria.add(Restrictions.eq("student_id", student_id));
		criteria.add(Restrictions.isNull("checked"));
		List list = criteria.list();
		return list;
	}

}
