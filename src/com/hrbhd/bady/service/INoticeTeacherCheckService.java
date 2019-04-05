package com.hrbhd.bady.service;

import java.util.List;

import com.hrbhd.bady.domain.Notice;
import com.hrbhd.bady.domain.NoticeTeacherCheck;
import com.hrbhd.bady.domain.Teacher;

public interface INoticeTeacherCheckService {

	public NoticeTeacherCheck findById(String noticeCheckId);

	public void setNoticeTeacherCheck(String noticeCheckId);

	public NoticeTeacherCheck findByNoticeAndTeacher(Notice notice, Teacher teacher);

	public List<NoticeTeacherCheck> findByTeacherAndChecked(String teacher_id);



}
