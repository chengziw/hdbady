package com.hrbhd.bady.service;

import java.util.List;

import com.hrbhd.bady.domain.Notice;
import com.hrbhd.bady.domain.NoticeStudentCheck;
import com.hrbhd.bady.domain.NoticeTeacherCheck;
import com.hrbhd.bady.domain.Student;

public interface INoticeStudentCheckService {

	public NoticeStudentCheck findById(String noticeCheckId);

	public void setNoticeStudentCheck(String noticeCheckId);

	public NoticeStudentCheck findByNoticeAndStudent(Notice notice, Student student);

	public List<NoticeTeacherCheck> findByStudentAndChecked(String student_id);


}
