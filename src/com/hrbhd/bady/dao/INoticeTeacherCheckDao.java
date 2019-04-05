package com.hrbhd.bady.dao;

import java.util.List;

import com.hrbhd.bady.dao.base.IBaseDao;
import com.hrbhd.bady.domain.Notice;
import com.hrbhd.bady.domain.NoticeTeacherCheck;
import com.hrbhd.bady.domain.Teacher;

public interface INoticeTeacherCheckDao extends IBaseDao<NoticeTeacherCheck>{

	public NoticeTeacherCheck findByNoticeAndTeacher(Notice notice, Teacher teacher);

	public List<NoticeTeacherCheck> findByNoticeId(String id);

	public List<NoticeTeacherCheck> findByNoticeIdAndCheck(String id);

	public List<NoticeTeacherCheck> findByNoticeIdAndNOCheck(String id);

	public NoticeTeacherCheck findByTeacherAndNotice(String tid, String nid);

	public List<NoticeTeacherCheck> findByTeacherAndChecked(String teacher_id);

}
