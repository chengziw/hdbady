package com.hrbhd.bady.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hrbhd.bady.dao.IAskTeacherCheckDao;
import com.hrbhd.bady.domain.Ask;
import com.hrbhd.bady.domain.AskTeacherCheck;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.service.IAskTeacherCheckService;

@Service
@Transactional
public class AskTeacherCheckServiceImpl implements IAskTeacherCheckService{

	@Autowired
	private IAskTeacherCheckDao askTeacherCheckDao;

	@Override
	public AskTeacherCheck findByAskAndTeacher(String ask_id, String teacher_id) {
		return askTeacherCheckDao.findByAskAndTeacher(ask_id,teacher_id);
	}

	@Override
	public void setNoticeTeacherCheck(String askTeacherCheckId, String askItemsId) {
		AskTeacherCheck askTeacherCheck = askTeacherCheckDao.findById(askTeacherCheckId);
		askTeacherCheck.setChecked(askItemsId);
	}

	@Override
	public List<AskTeacherCheck> findByChecked(String askItemsId) {
		return askTeacherCheckDao.findByChecked(askItemsId);
	}

	@Override
	public List<AskTeacherCheck> findByAsk(Ask ask) {
		return askTeacherCheckDao.findByAsk(ask);
	}

	@Override
	public List<AskTeacherCheck> findChecked(String aid) {
		return askTeacherCheckDao.findChecked(aid);
	}

	@Override
	public List<AskTeacherCheck> findByTeacherAndChecked(String teacher_id) {
		return askTeacherCheckDao.findByTeacherAndChecked(teacher_id);
	}
}
