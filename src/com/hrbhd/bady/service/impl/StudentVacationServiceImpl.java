package com.hrbhd.bady.service.impl;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.components.Else;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hrbhd.bady.dao.IClassesDao;
import com.hrbhd.bady.dao.IStudentCheckDao;
import com.hrbhd.bady.dao.IStudentDao;
import com.hrbhd.bady.dao.IStudentMonthCheckDao;
import com.hrbhd.bady.dao.IStudentVacationDao;
import com.hrbhd.bady.dao.ITeacherDao;
import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.StudentCheck;
import com.hrbhd.bady.domain.StudentMonthCheck;
import com.hrbhd.bady.domain.StudentVacation;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.domain.TeacherVacation;
import com.hrbhd.bady.service.IStudentCheckService;
import com.hrbhd.bady.service.IStudentVacationService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.PageBean;
import com.hrbhd.bady.util.TimeUtil;
import com.mchange.v2.async.StrandedTaskReporting;

import freemarker.core.Node;

@Service
@Transactional
public class StudentVacationServiceImpl implements IStudentVacationService {

	@Autowired
	private IStudentVacationDao studentVacationDao;
	@Autowired
	private IStudentDao studentDao;
	@Autowired
	private IStudentCheckService studentCheckService;
	@Autowired
	private IStudentMonthCheckDao studentMonthCheckDao;
	@Autowired
	private IStudentCheckDao studentCheckDao;
	@Autowired
	private ITeacherDao teacherDao;
	@Autowired
	private IClassesDao classesDao;

	@Override
	public void pageQuery(PageBean pageBean) {
		studentVacationDao.pageQuery(pageBean);
	}

	@Override
	public StudentVacation findById(String id) {
		return studentVacationDao.findById(id);
	}

	@Override
	public void addStudentVacation(StudentVacation model) throws IOException {

		String student_id = model.getStudent().getId();
		student_id = student_id.trim();
		Student student = studentDao.findById(student_id);
		model.setStudent(student);
		
		model.setStatus("1");
		model.setStatus_label("待审核");
		model.setCheck_status("1");

		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginUser");
		model.setApply_name(teacher.getTeacher_name());
		model.setApply_phone(teacher.getPhone());
		model.setApply_time(TimeUtil.getCurrentDay());

		
		//////////////////////////////////////////////////
		//判断提交的请假时间,是否包含在已经请假的时间中
		String start_time = model.getStart_time();
		String end_time = model.getEnd_time();
		String currentDay = TimeUtil.getCurrentDay();
		Long start_time_format = TimeUtil.getTimeStamp(start_time);
		Long end_time_format = TimeUtil.getTimeStamp(end_time);
		long current_time = TimeUtil.getTimeStamp(currentDay);
		
		
		boolean flag = false; 
		List<StudentVacation> list = studentVacationDao.findByStudentId(student_id);
		StudentVacation incude = null;
		for (StudentVacation studentVacation : list) {
			String start_time2 = studentVacation.getStart_time();
			String end_time2 = studentVacation.getEnd_time();
			long start_time_format2 = TimeUtil.getTimeStamp(start_time2);
			long end_time_format2 = TimeUtil.getTimeStamp(end_time2);
			if(start_time_format<start_time_format2&&end_time_format>start_time_format2){
				incude = studentVacation;
				flag = true;
			}
			if(start_time_format>start_time_format2&&start_time_format<end_time_format2){
				incude = studentVacation;
				flag = true;
			}
		}
		String json = "";
		if(start_time_format<current_time){
			json = "{\"errMeg\": \"选择的时间已经过去\"}";
		}else if(start_time_format>end_time_format){
		    json = "{\"errMeg\": \"请假开始日期不能大于结束日期\"}";
		}else if(flag){
			json = "{\"errMeg\": \"该学生在本次请假时间内已请假！请假时间："+incude.getStart_time()+" 至 "+incude.getEnd_time()+"\"}";
		}else{
			
			String month_label = TimeUtil.getCurrentMonth() + "";
			String year_label = TimeUtil.getCurrentYear() + "";
			List<StudentMonthCheck> list1 = studentMonthCheckDao.findByMonthAndYear(year_label, month_label);
			StudentMonthCheck studentMonthCheck = null;
			if (list1 != null && list1.size() > 0) {
				studentMonthCheck = list1.get(0);
			}
			String currentWeek = TimeUtil.getCurrentWeek();
			String currentOneDay = TimeUtil.getCurrentOneDay();
			
			String time1 = model.getStart_time();
			String time2 = model.getEnd_time();
			
			long timeStamp1 = TimeUtil.getTimeStamp(time1)/1000;
			long timeStamp2 = TimeUtil.getTimeStamp(time2)/1000;
			
			long i = timeStamp2-timeStamp1;
			i = i/86640;
			
			for(int k=0;k<=i+1;k++){
				String timeFormat = TimeUtil.getTimeFormat(timeStamp1*1000+k*86640*1000);
				System.out.println(timeFormat);
				
				StudentCheck studentCheck = new StudentCheck();
				studentCheck.setStudent(student);
				studentCheck.setClasses(student.getClasses());
				studentCheck.setStudentMonthCheck(studentMonthCheck);
				studentCheck.setDay_label(currentOneDay);
				studentCheck.setWeek_label(currentWeek);
				studentCheck.setDate_label(currentDay);
				studentCheck.setYear_label(year_label);
				studentCheck.setMonth_label(month_label);
				studentCheck.setStatus("1");
				studentCheck.setStatus_label("已请假");
				studentCheckDao.save(studentCheck);
			}
			
			studentVacationDao.save(model);
			studentCheckService.addStudentCheck(student,start_time,end_time);
			json = "{\"errMeg\":\"\"}";
		}

		
		JsonUtil.writeJson(json);
	}

	@Override
	public void checkStudentVacation(StudentVacation model) throws IOException {

		String id = model.getId();
		String check_status = model.getCheck_status();

		StudentVacation studentVacation = studentVacationDao.findById(id);
		studentVacation.setCheck_status(check_status);
		
		if("2".equals(model.getStatus())){
			studentVacation.setStatus("2");
			studentVacation.setStatus_label("未通过");
			studentVacation.setCheck_note(model.getCheck_note());
		}
		if("3".equals(model.getStatus())){
			studentVacation.setStatus("3");
			studentVacation.setStatus_label("已审批");
		}
		
		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginUser");
		studentVacation.setCheck_techer_name(teacher.getTeacher_name());
		studentVacation.setCheck_time(TimeUtil.getCurrentTime());

		String json = "{\"errMeg\":\"\"}";
		JsonUtil.writeJson(json);
	}

	@Override
	public void termQuery(StudentVacation model, PageBean pageBean, DetachedCriteria detachedCriteria, String student_name, String class_id, String grade_id) throws UnsupportedEncodingException {

		detachedCriteria = pageBean.getDetachedCriteria();
		detachedCriteria.setProjection(null);
		
		String status = model.getStatus();
		String typee = model.getTypee();
		String start_time = model.getStart_time();
		String end_time = model.getEnd_time();
		
		status = new String(status.getBytes("iso8859-1"), "utf-8");
		typee = new String(typee.getBytes("iso8859-1"), "utf-8");
		grade_id = new String(grade_id.getBytes("iso8859-1"), "utf-8");
		class_id = new String(class_id.getBytes("iso8859-1"), "utf-8");
		student_name = new String(student_name.getBytes("iso8859-1"), "utf-8");
		
		detachedCriteria.createAlias("student", "s");
		if (StringUtils.isNotBlank(grade_id)) {
			if (!"全部年级".equals(grade_id)) {
				// detachedCriteria.add(Restrictions.eq("grade.id", grade_id));
				detachedCriteria.add(Restrictions.eq("s.grade_id", grade_id));
			}
		}
		if (StringUtils.isNotBlank(class_id)) {
			if (!"全部班级".equals(class_id)) {
				// detachedCriteria.add(Restrictions.eq("classes.id",
				// class_id));
				detachedCriteria.add(Restrictions.eq("s.class_id", class_id));
			}
		}
		if (StringUtils.isNotBlank(student_name)) {
			detachedCriteria.add(Restrictions.like("s.name", student_name+"%"));
		}
		if (StringUtils.isNotBlank(typee)) {
			if (!"全部请假类型".equals(typee)) {
				detachedCriteria.add(Restrictions.eq("typee", typee));

			}
		}
		///////////////////////////////////////////////////
		/*if (StringUtils.isNotBlank(status_label)) {
			if (!"全部请假状态".equals(status_label)) {
				detachedCriteria.add(Restrictions.eq("sort_label", status_label));

			}
		}*/
		if (StringUtils.isNotBlank(status)) {
			if (!"全部审核状态".equals(status)) {
				detachedCriteria.add(Restrictions.eq("status", status));

			}
		}
		////////////////////////////////////////////////////
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
	public List<StudentVacation> findByStudentId(String student_id){
		return studentVacationDao.findByStudentId(student_id);
	}

	@Override
	public List<StudentVacation> findAll() {
		return studentVacationDao.findAll();
	}

	@Override
	public void paddStudentVacation(StudentVacation model) throws IOException {

		Student student = (Student) ServletActionContext.getRequest().getSession().getAttribute("loginParent");
		String student_id = student.getId();
		student = studentDao.findById(student_id);
		
		model.setStudent(student);
		model.setStatus_label("待批准");
		model.setStatus("1");
		model.setCheck_status("1");
		
		model.setApply_name(student.getName());
		model.setApply_phone(student.getPhone());
		model.setApply_time(TimeUtil.getCurrentTime());
		
		
		String start_time = model.getStart_time();
		String end_time = model.getEnd_time();
		String currentDay = TimeUtil.getCurrentDay();
		Long start_time_format = TimeUtil.getTimeStamp(start_time);
		Long end_time_format = TimeUtil.getTimeStamp(end_time);
		long current_time = TimeUtil.getTimeStamp(currentDay);
		
		
		boolean flag = false; 
		List<StudentVacation> list = studentVacationDao.findByStudentId(student_id);
		StudentVacation incude = null;
		for (StudentVacation studentVacation : list) {
		
			String start_time2 = studentVacation.getStart_time();
			String end_time2 = studentVacation.getEnd_time();
			long start_time_format2 = TimeUtil.getTimeStamp(start_time2);
			long end_time_format2 = TimeUtil.getTimeStamp(end_time2);
			if(start_time_format<start_time_format2&&end_time_format>start_time_format2){
				incude = studentVacation;
				flag = true;
			}
			if(start_time_format>start_time_format2&&start_time_format<end_time_format2){
				incude = studentVacation;
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
			json = "{\"errMeg\": \"该学生在本次请假时间内已请假！请假时间："+incude.getStart_time()+" 至 "+incude.getEnd_time()+"\"}";
		}else{
			
			studentVacationDao.save(model);
			studentCheckService.addStudentCheck(student,start_time,end_time);
			json = "{\"errMeg\":\"请假成功\"}";
		}
		JsonUtil.writeJson(json);
	}

	@Override
	public void t_checkStudentVacation(StudentVacation model) throws IOException {
		
		String id = model.getId();
		StudentVacation studentVacation = studentVacationDao.findById(id);
		studentVacation.setStatus("3");
		studentVacation.setStatus_label("已审核");
		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginTeacher");
		studentVacation.setCheck_techer_name(teacher.getTeacher_name());
		//studentVacation.setCheck_note(check_note);
		String json = "{\"type\": \"1\"}";
		JsonUtil.writeJson(json);
		
	}

	@Override
	public List<Student> getStudent(Teacher teacher) {

		String tid = teacher.getId();
		teacher = teacherDao.findById(tid);
		Classes classes = teacher.getClasses();
		String cid = classes.getId();
		classes = classesDao.findById(cid);
		Set<Student> students = classes.getStudents();
		List<Student> list = new ArrayList<>(students);
		
		return list;
	}

	@Override
	public List<StudentVacation> findByStudentIdAndStatus(String student_id) {
		
		return studentVacationDao.findByStudentIdAndStatus(student_id);
	}
}
