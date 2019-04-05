package com.hrbhd.bady.service;

import java.util.List;

import com.hrbhd.bady.domain.Ask;
import com.hrbhd.bady.domain.AskStudentCheck;
import com.hrbhd.bady.domain.AskTeacherCheck;
import com.hrbhd.bady.domain.Student;

public interface IAskStudentCheckService {

	public AskStudentCheck findByAskAndStudent(String ask_id, String student_id);

	public void setaskStudentCheck(String askStudentCheckId, String askItemsId);

	public List<AskStudentCheck> findByAsk(Ask ask);

	public List<AskStudentCheck> findByChecked(String askItemsId);

	public List<AskStudentCheck> findChecked(String aid);

	public List<AskTeacherCheck> findByStudentAndChecked(String student_id);

}
