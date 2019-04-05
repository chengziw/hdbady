package com.hrbhd.bady.dao;

import java.util.List;

import com.hrbhd.bady.dao.base.IBaseDao;
import com.hrbhd.bady.domain.Notice;
import com.hrbhd.bady.domain.NoticeStudentCheck;
import com.hrbhd.bady.domain.NoticeTeacherCheck;
import com.hrbhd.bady.domain.Student;

public interface INoticeStudentCheckDao extends IBaseDao<NoticeStudentCheck>{

	public NoticeStudentCheck findByNoticeAndStudent(Notice notice, Student student);

	public List<NoticeStudentCheck> findByNoticeIdAndNoCheck(String id);

	public List<NoticeStudentCheck> findByNoticeIdAndCheck(String id);

	public List<NoticeTeacherCheck> findByStudentAndChecked(String student_id);

}
