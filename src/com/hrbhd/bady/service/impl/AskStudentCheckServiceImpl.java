package com.hrbhd.bady.service.impl;

import java.util.List;

import org.openxmlformats.schemas.drawingml.x2006.main.STTextUnderlineType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hrbhd.bady.dao.IAskStudentCheckDao;
import com.hrbhd.bady.domain.Ask;
import com.hrbhd.bady.domain.AskStudentCheck;
import com.hrbhd.bady.domain.AskTeacherCheck;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.service.IAskStudentCheckService;

@Service
@Transactional
public class AskStudentCheckServiceImpl implements IAskStudentCheckService{

	@Autowired
	private IAskStudentCheckDao askStudentCheckDao;

	@Override
	public AskStudentCheck findByAskAndStudent(String ask_id, String student_id) {
		return askStudentCheckDao.findByAskAndStudent(ask_id,student_id);
	}

	@Override
	public void setaskStudentCheck(String askStudentCheckId, String askItemsId) {
		AskStudentCheck askStudentCheck = askStudentCheckDao.findById(askStudentCheckId);
		askStudentCheck.setChecked(askItemsId);
	}

	@Override
	public List<AskStudentCheck> findByAsk(Ask ask) {
		return askStudentCheckDao.findByAsk(ask);
	}

	@Override
	public List<AskStudentCheck> findByChecked(String askItemsId) {
		return askStudentCheckDao.findByChecked(askItemsId);
	}

	@Override
	public List<AskStudentCheck> findChecked(String aid) {
		return askStudentCheckDao.findChecked(aid);
	}

	@Override
	public List<AskTeacherCheck> findByStudentAndChecked(String student_id) {
		return askStudentCheckDao.findByStudentAndChecked(student_id);
	}
}
