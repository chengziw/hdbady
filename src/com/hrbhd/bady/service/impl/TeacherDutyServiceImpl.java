package com.hrbhd.bady.service.impl;

import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hrbhd.bady.dao.ITeacherDao;
import com.hrbhd.bady.dao.ITeacherDutyDao;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.domain.TeacherDuty;
import com.hrbhd.bady.service.ITeacherDutyService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.PageBean;

@Service
@Transactional
public class TeacherDutyServiceImpl implements ITeacherDutyService{
	
	@Autowired
	private ITeacherDutyDao teacherDutyDao;
	
	@Autowired
	private ITeacherDao teacherDao;

	@Override
	public TeacherDuty findById(String id) {
		return teacherDutyDao.findById(id);
	}

	@Override
	public void pageQuery(PageBean pageBean) {
		teacherDutyDao.pageQuery(pageBean);
	}

	@Override
	public void save(TeacherDuty model) {
		teacherDutyDao.save(model);
	}

	@Override
	public List<TeacherDuty> findByDutyName(String duty_name) {
		return teacherDutyDao.findByDutyName(duty_name);
	}

	@Override
	public void addTeacherDuty(TeacherDuty model) {

		String duty_name = model.getDuty_name();
		model.setStatus("1");
		model.setStatus_name("正常");
		
		teacherDutyDao.save(model);
	}

	@Override
	public void editTeacherDuty(TeacherDuty model) {

		String id = model.getId();
		String duty_name = model.getDuty_name();
		
		TeacherDuty teacherDuty = teacherDutyDao.findById(id);
		teacherDuty.setDuty_name(duty_name);
	}

	@Override
	public void changeStatus(TeacherDuty model) throws IOException {

		String json = "";
		String id = model.getId();
		TeacherDuty teacherDuty = teacherDutyDao.findById(id);

		String status = teacherDuty.getStatus();
		if ("1".equals(status)) {
			Set<Teacher> teachers = teacherDuty.getTeachers();
			if(teachers!=null&&teachers.size()>0){
				json="{\"status\": 0, \"info\": \"该职务尚有在校教职工，不能停用！\"}";
			}else{
				teacherDuty.setStatus("2");
				teacherDuty.setStatus_name("已停用");
				json ="{\"status\":1}";
			}
			
		} else if ("2".equals(status)) {
			teacherDuty.setStatus("1");
			teacherDuty.setStatus_name("正常");
			json="{\"status\":1}";
		}
		
		JsonUtil.writeJson(json);
	}

	@Override
	public List<TeacherDuty> findAllTeacherDuty() {
		return teacherDutyDao.findAllTeacherDuty();
	}


}
