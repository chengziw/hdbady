package com.hrbhd.bady.service.impl;

import java.io.IOException;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.junit.Test.None;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hrbhd.bady.dao.ITeacherCheckDao;
import com.hrbhd.bady.dao.ITeacherDao;
import com.hrbhd.bady.dao.ITeacherVacationDao;
import com.hrbhd.bady.dao.base.impl.BaseDaoImpl;
import com.hrbhd.bady.domain.StudentVacation;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.domain.TeacherVacation;
import com.hrbhd.bady.service.ITeacherCheckService;
import com.hrbhd.bady.service.ITeacherVacationService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.PageBean;
import com.hrbhd.bady.util.TimeUtil;

@Service
@Transactional
public class TeacherVacationServiceImpl extends BaseDaoImpl<TeacherVacation> implements ITeacherVacationService{

	@Autowired
	private ITeacherVacationDao teacherVacationDao;
	@Autowired
	private ITeacherDao teacherDao;
	@Autowired
	private ITeacherCheckService teacherCheckService;

	@Override
	public void pageQuery(PageBean pageBean) {
		teacherVacationDao.pageQuery(pageBean);
	}

	@Override
	public void addTeacherVacation(TeacherVacation model) throws IOException {
		
		String teacher_id = model.getTeacher_id();
		Teacher teacher = teacherDao.findById(teacher_id);
		model.setTeacher(teacher);
		
		model.setStatus_label("待批准");
		model.setStatus("1");
		model.setCheck_status("1");
		
		Teacher loginTeacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginUser");
		model.setApply_name(loginTeacher.getTeacher_name());
		model.setApply_phone(teacher.getPhone());
		model.setApply_time(TimeUtil.getCurrentTime());
		
		
		String start_time = model.getStart_time();
		String end_time = model.getEnd_time();
		String currentDay = TimeUtil.getCurrentDay();
		Long start_time_format = TimeUtil.getTimeStamp(start_time);
		Long end_time_format = TimeUtil.getTimeStamp(end_time);
		long current_time = TimeUtil.getTimeStamp(currentDay);
		
		
		boolean flag = false; 
		List<TeacherVacation> list = teacherVacationDao.findByTeacherId(teacher_id);
		TeacherVacation incude = null;
		for (TeacherVacation teacherVacation : list) {
		
			String start_time2 = teacherVacation.getStart_time();
			String end_time2 = teacherVacation.getEnd_time();
			long start_time_format2 = TimeUtil.getTimeStamp(start_time2);
			long end_time_format2 = TimeUtil.getTimeStamp(end_time2);
			
//			if(start_time_format>=start_time_format2&&start_time_format<=end_time_format2){
//				incude = teacherVacation;
//				flag = true;
//			}
//			if(end_time_format>=start_time_format2&&end_time_format<=end_time_format2){
//				incude = teacherVacation;
//				flag = true;
//			}
//			if(start_time_format<=start_time_format2&&end_time_format<=end_time_format2){
//				incude = teacherVacation;
//				flag = true;
//			}
			if(start_time_format<start_time_format2&&end_time_format>start_time_format2){
				incude = teacherVacation;
				flag = true;
			}
			if(start_time_format>start_time_format2&&start_time_format<end_time_format2){
				incude = teacherVacation;
				flag = true;
			}
			
		}
		
		String json = "";
		if(start_time_format<current_time){
			json = "{\"errMeg\": \"选择的时间已经过去\"}";
		}else if(start_time_format>end_time_format){
		    json = "{\"errMeg\": \"请假开始日期不能大于结束日期\"}";
		}else if(flag){
			json = "{\"errMeg\": \"该教师在本次请假时间内已请假！请假时间："+incude.getStart_time()+" 至 "+incude.getEnd_time()+"\"}";
		}else{
			
			teacherVacationDao.save(model);
			teacherCheckService.addTeacherCheck(teacher,start_time,end_time);
		    json = "{\"errMeg\":\"\"}";
		}
		
		JsonUtil.writeJson(json);
	
	}

	@Override
	public TeacherVacation findById(String id) {
		return teacherVacationDao.findById(id);
	}

	@Override
	public void checkTeacherVacation(TeacherVacation model) throws IOException {
		
		String id = model.getId();
		TeacherVacation teacherVacation = teacherVacationDao.findById(id);
		
		Teacher loginTeacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginUser");
		teacherVacation.setCheck_techer_name(loginTeacher.getTeacher_name());
		teacherVacation.setCheck_time(TimeUtil.getCurrentTime());
		
		if("2".equals(model.getStatus())){
			teacherVacation.setStatus("2");
			teacherVacation.setStatus_label("未通过");
			teacherVacation.setCheck_status("3");
			teacherVacation.setCheck_note(model.getCheck_note());
		}
		if("3".equals(model.getStatus())){
			teacherVacation.setStatus("3");
			teacherVacation.setStatus_label("已批准");
			teacherVacation.setCheck_status("2");
		}

		String json="{\"errMeg\":\"\"}";
		JsonUtil.writeJson(json);
	}

	@Override
	public void destroyTeacherVacation(TeacherVacation model) throws IOException {
		
		String id = model.getId();
		TeacherVacation teacherVacation = teacherVacationDao.findById(id);
		
		if("4".equals(model.getStatus())){
			teacherVacation.setStatus("4");
			teacherVacation.setStatus_label("未销假");
			teacherVacation.setCheck_status("3");
			teacherVacation.setCheck_note(model.getCheck_note());
		}
		if("5".equals(model.getStatus())){
			teacherVacation.setStatus("5");
			teacherVacation.setStatus_label("已销假");
			teacherVacation.setCheck_status("3");
		}
		
		String json="{\"errMeg\":\"\"}";
		JsonUtil.writeJson(json);
	}

	@Override
	public void termQuery(TeacherVacation model, PageBean pageBean, DetachedCriteria detachedCriteria,
			String teacher_name) throws UnsupportedEncodingException {
		
		detachedCriteria = pageBean.getDetachedCriteria();
		detachedCriteria.setProjection(null);
	
		//String check_status = model.getCheck_status();
		String end_time = model.getEnd_time();
		String start_time = model.getStart_time();
		String type = model.getType();
		String status = model.getStatus();
		
		
		//check_status = new String(check_status.getBytes("iso8859-1"), "utf-8");
		type = new String(type.getBytes("iso8859-1"), "utf-8");
		status = new String(status.getBytes("iso8859-1"), "utf-8");
		teacher_name = new String(teacher_name.getBytes("iso8859-1"), "utf-8");
		
		detachedCriteria.createAlias("teacher", "t");
		
		/*if (StringUtils.isNotBlank(check_status)) {
			if (!"全部审核状态".equals(check_status)) {
				detachedCriteria.add(Restrictions.eq("check_status", check_status));
			}
		}*/
		if (StringUtils.isNotBlank(type)) {
			if (!"全部请假类型".equals(type)) {
				detachedCriteria.add(Restrictions.eq("type", type));
			}
		}
		if (StringUtils.isNotBlank(status)) {
			if (!"全部审核状态".equals(status)) {
				detachedCriteria.add(Restrictions.eq("status", status));
				
			}
		}
		if (StringUtils.isNotBlank(teacher_name)) {
			detachedCriteria.add(Restrictions.like("t.teacher_name", teacher_name + "%"));
		}
		
		if (StringUtils.isNotBlank(start_time) && StringUtils.isNotBlank(end_time)) {
			Date start_date_format = TimeUtil.getDate(start_time);
			Date end_date_format = TimeUtil.getDate(end_time);
			detachedCriteria.add(Restrictions.between("apply_time_format", start_date_format, end_date_format));
		} else {

			if (StringUtils.isNotBlank(start_time)) {
				Date start_date_format = TimeUtil.getDate(start_time);
				detachedCriteria.add(Restrictions.ge("apply_time_format", start_date_format));
			}
			if (StringUtils.isNotBlank(end_time)) {
				Date end_date_format = TimeUtil.getDate(end_time);
				detachedCriteria.add(Restrictions.le("apply_time_format", end_date_format));
			} 
		}
	
	}

	@Override
	public List<TeacherVacation> findByTeacherId(String id) {
		return teacherVacationDao.findByTeacherId(id);
	}


	@Override
	public void taddTeacherVacation(TeacherVacation model) throws IOException {
		
		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginTeacher");
		String id = teacher.getId();
		teacher = teacherDao.findById(id);
		
		model.setTeacher(teacher);
		model.setStatus_label("待批准");
		model.setStatus("1");
		model.setCheck_status("1");
		
		model.setApply_name(teacher.getTeacher_name());
		model.setApply_phone(teacher.getPhone());
		model.setApply_time(TimeUtil.getCurrentTime());
		
		String start_time = model.getStart_time();
		String end_time = model.getEnd_time();
		String currentDay = TimeUtil.getCurrentDay();
		Long start_time_format = TimeUtil.getTimeStamp(start_time);
		Long end_time_format = TimeUtil.getTimeStamp(end_time);
		long current_time = TimeUtil.getTimeStamp(currentDay);
		
		
		boolean flag = false; 
		String teacher_id = teacher.getId();
		List<TeacherVacation> list = teacherVacationDao.findByTeacherId(teacher_id);
		TeacherVacation incude = null;
		for (TeacherVacation teacherVacation : list) {
		
			String start_time2 = teacherVacation.getStart_time();
			String end_time2 = teacherVacation.getEnd_time();
			long start_time_format2 = TimeUtil.getTimeStamp(start_time2);
			long end_time_format2 = TimeUtil.getTimeStamp(end_time2);
			if(start_time_format<start_time_format2&&end_time_format>start_time_format2){
				incude = teacherVacation;
				flag = true;
			}
			if(start_time_format>start_time_format2&&start_time_format<end_time_format2){
				incude = teacherVacation;
				flag = true;
			}
		}
		
		String json = "";
		if(start_time_format<current_time){
			json = "{\"errMeg\": \"选择的时间已经过去\"}";
		}else if(start_time_format>end_time_format){
		    json = "{\"errMeg\": \"请假开始日期不能大于结束日期\"}";
		}else 
		if(flag){
			json = "{\"errMeg\": \"该教师在本次请假时间内已请假！请假时间："+incude.getStart_time()+" 至 "+incude.getEnd_time()+"\"}";
		}else{
			
			teacherVacationDao.save(model);
			teacherCheckService.addTeacherCheck(teacher,start_time,end_time);
		    json = "{\"errMeg\":\"请假成功\"}";
		}
		JsonUtil.writeJson(json);
	}
	
	public List<TeacherVacation> findAll(){
		return teacherVacationDao.findAll();
	}
}
