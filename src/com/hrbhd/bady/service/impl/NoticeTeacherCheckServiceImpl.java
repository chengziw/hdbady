package com.hrbhd.bady.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hrbhd.bady.dao.INoticeTeacherCheckDao;
import com.hrbhd.bady.dao.impl.NoticeTeacherCheckDaoImpl;
import com.hrbhd.bady.domain.Notice;
import com.hrbhd.bady.domain.NoticeTeacherCheck;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.service.INoticeTeacherCheckService;

@Service
@Transactional
public class NoticeTeacherCheckServiceImpl implements INoticeTeacherCheckService {

	@Autowired
	private INoticeTeacherCheckDao noticeTeacherCheckDao;

	@Override
	public NoticeTeacherCheck findById(String noticeCheckId) {
		return noticeTeacherCheckDao.findById(noticeCheckId);
	}

	@Override
	public void setNoticeTeacherCheck(String noticeCheckId) {
		NoticeTeacherCheck noticeTeacherCheck = noticeTeacherCheckDao.findById(noticeCheckId);
		noticeTeacherCheck.setChecked("True");
	}

	@Override
	public NoticeTeacherCheck findByNoticeAndTeacher(Notice notice, Teacher teacher) {
		return noticeTeacherCheckDao.findByNoticeAndTeacher(notice, teacher);
	}

	@Override
	public List<NoticeTeacherCheck> findByTeacherAndChecked(String teacher_id) {
		return noticeTeacherCheckDao.findByTeacherAndChecked(teacher_id);
	}
}
