package com.hrbhd.bady.service;

import java.util.List;

import com.hrbhd.bady.domain.Ask;
import com.hrbhd.bady.domain.AskTeacherCheck;
import com.hrbhd.bady.domain.Teacher;

public interface IAskTeacherCheckService {

	public AskTeacherCheck findByAskAndTeacher(String ask_id, String teacher_id);

	public void setNoticeTeacherCheck(String askTeacherCheckId,String askItemsId);

	public List<AskTeacherCheck> findByChecked(String askItemsId);

	public List<AskTeacherCheck> findByAsk(Ask ask);

	public List<AskTeacherCheck> findChecked(String aid);

	public List<AskTeacherCheck> findByTeacherAndChecked(String teacher_id);

}
