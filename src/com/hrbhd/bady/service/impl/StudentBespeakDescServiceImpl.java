package com.hrbhd.bady.service.impl;

import java.util.List;
import java.util.Set;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hrbhd.bady.dao.IStudentBespeakDescDao;
import com.hrbhd.bady.domain.StudentBespeak;
import com.hrbhd.bady.domain.StudentBespeakDesc;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.service.IStudentBespeakDescService;
import com.hrbhd.bady.service.IStudentBespeakService;
import com.hrbhd.bady.util.PageBean;
import com.hrbhd.bady.util.TimeUtil;

@Service
@Transactional
public class StudentBespeakDescServiceImpl implements IStudentBespeakDescService {

	@Autowired
	private IStudentBespeakDescDao studentBespeakDescDao;
	
	@Autowired
	private IStudentBespeakService studentBespeakService; 

	@Override
	public void save(StudentBespeakDesc model) {
		studentBespeakDescDao.save(model);
	}

	@Override
	public void addDesc(StudentBespeakDesc model) {
		String id = model.getId();
		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginUser");
		String teacher_name = teacher.getTeacher_name();
		model.setTeacher_name(teacher_name);
		String create_time_name = TimeUtil.getCurrentTime();
		model.setCreate_time_name(create_time_name);
		model.setId(null);
		StudentBespeak studentBespeak = studentBespeakService.findById(id);
		Set<StudentBespeakDesc> studentBespeakDesc = studentBespeak.getStudentBespeakDesc();
		studentBespeakDesc.add(model);
		model.setStudentBespeak(studentBespeak);
	}

	@Override
	public void pageQuery(PageBean pageBean) {
		studentBespeakDescDao.pageQuery(pageBean);
	}

	@Override
	public List<StudentBespeakDesc> findByBespeakId(String id) {
		
		return studentBespeakDescDao.findByBespeakId(id);
	}
}
