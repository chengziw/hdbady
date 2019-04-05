package com.hrbhd.bady.dao;

import java.util.List;

import com.hrbhd.bady.dao.base.IBaseDao;
import com.hrbhd.bady.domain.Ask;
import com.hrbhd.bady.domain.AskStudentCheck;
import com.hrbhd.bady.domain.AskTeacherCheck;
import com.hrbhd.bady.domain.Student;

public interface IAskStudentCheckDao extends IBaseDao<AskStudentCheck>{

	public AskStudentCheck findByAskAndStudent(String ask_id, String student_id);

	public List<AskStudentCheck> findByAskIdAndCheck(String id);

	public List<AskStudentCheck> findByAskIdAndNoCheck(String id);

	public List<AskStudentCheck> findByChecked(String askItemsId);

	public List<AskStudentCheck> findByAsk(Ask ask);

	public List<AskStudentCheck> findChecked(String aid);

	public List<AskTeacherCheck> findByStudentAndChecked(String student_id);


}
