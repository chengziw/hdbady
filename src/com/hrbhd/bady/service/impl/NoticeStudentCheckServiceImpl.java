package com.hrbhd.bady.service.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hrbhd.bady.dao.INoticeStudentCheckDao;
import com.hrbhd.bady.domain.Notice;
import com.hrbhd.bady.domain.NoticeStudentCheck;
import com.hrbhd.bady.domain.NoticeTeacherCheck;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.service.INoticeStudentCheckService;

@Service
@Transactional
public class NoticeStudentCheckServiceImpl implements INoticeStudentCheckService{

	@Autowired
	private INoticeStudentCheckDao noticeStudentCheckDao;

	@Override
	public NoticeStudentCheck findById(String noticeCheckId) {
		return noticeStudentCheckDao.findById(noticeCheckId);
	}

	@Override
	public void setNoticeStudentCheck(String noticeCheckId) {
		NoticeStudentCheck noticeStudentCheck = noticeStudentCheckDao.findById(noticeCheckId);
		noticeStudentCheck.setChecked("True");
	}

	@Override
	public NoticeStudentCheck findByNoticeAndStudent(Notice notice, Student student) {
		return noticeStudentCheckDao.findByNoticeAndStudent(notice,student);
	}

	@Override
	public List<NoticeTeacherCheck> findByStudentAndChecked(String student_id) {
		return noticeStudentCheckDao.findByStudentAndChecked(student_id);
	}
}
