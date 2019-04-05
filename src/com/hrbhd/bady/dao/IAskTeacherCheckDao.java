package com.hrbhd.bady.dao;

import java.util.List;

import com.hrbhd.bady.dao.base.IBaseDao;
import com.hrbhd.bady.domain.Ask;
import com.hrbhd.bady.domain.AskTeacherCheck;
import com.hrbhd.bady.domain.Teacher;

public interface IAskTeacherCheckDao extends IBaseDao<AskTeacherCheck>{

	public AskTeacherCheck findByAskAndTeacher(String ask_id, String teacher_id);

	public List<AskTeacherCheck> findByAskIdAndCheck(String id);

	public List<AskTeacherCheck> findByAskIdAndNoCheck(String id);

	public List<AskTeacherCheck> findByChecked(String askItemsId);

	public List<AskTeacherCheck> findByAsk(Ask ask);

	public List<AskTeacherCheck> findChecked(String aid);

	public List<AskTeacherCheck> findByTeacherAndChecked(String teacher_id);

}
