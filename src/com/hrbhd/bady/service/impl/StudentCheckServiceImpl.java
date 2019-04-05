package com.hrbhd.bady.service.impl;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.poifs.property.Parent;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hrbhd.bady.dao.IClassesDao;
import com.hrbhd.bady.dao.IClockConfigDao;
import com.hrbhd.bady.dao.IStudentCheckDao;
import com.hrbhd.bady.dao.IStudentMonthCheckDao;
import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.ClockConfig;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.StudentCheck;
import com.hrbhd.bady.domain.StudentMonthCheck;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.domain.TeacherCheck;
import com.hrbhd.bady.domain.TeacherMonthCheck;
import com.hrbhd.bady.service.IStudentCheckService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.PageBean;
import com.hrbhd.bady.util.TimeUtil;

@Service
@Transactional
public class StudentCheckServiceImpl implements IStudentCheckService {

	@Autowired
	private IStudentCheckDao studentCheckDao;
	@Autowired
	private IStudentMonthCheckDao studentMonthCheckDao;
	@Autowired
	private IClassesDao classesDao;
	@Autowired
	private IClockConfigDao clockConfigDao;

	@Override
	public void pageQuery(PageBean pageBean) {
		studentCheckDao.pageQuery(pageBean);
	}

	@Override
	public void save(StudentCheck studentCheck) {
		studentCheckDao.save(studentCheck);
	}

	@Override
	public void termQuery(StudentCheck model, PageBean pageBean, DetachedCriteria detachedCriteria, String grade_id,
			String class_id, String date, String student_name) throws UnsupportedEncodingException {

		detachedCriteria = pageBean.getDetachedCriteria();
		detachedCriteria.setProjection(null);
		detachedCriteria.createAlias("student", "s");

		grade_id = new String(grade_id.getBytes("iso8859-1"), "utf-8");
		class_id = new String(class_id.getBytes("iso8859-1"), "utf-8");
		student_name = new String(student_name.getBytes("iso8859-1"), "utf-8");

		if (StringUtils.isNotBlank(grade_id)) {
			if (!"全部年级".equals(grade_id) && !"".equals(grade_id)) {
				detachedCriteria.add(Restrictions.eq("s.grade_id", grade_id));
			}
		}
		if (StringUtils.isNotBlank(class_id)) {
			if (!"全部班级".equals(class_id) && !"".equals(class_id)) {
				detachedCriteria.add(Restrictions.eq("s.class_id", class_id));
			}
		}
		if (StringUtils.isNotBlank(student_name)) {
			detachedCriteria.add(Restrictions.like("s.name", student_name+"%"));
		}

		if (StringUtils.isNotBlank(date)) {
			Date start_date_format = TimeUtil.getDate(date);
			detachedCriteria.add(Restrictions.eq("date_label_format", start_date_format));
		}

	}

	@Override
	public void termQuery2(StudentCheck model, PageBean pageBean, DetachedCriteria detachedCriteria, String grade_id,
			String class_id) throws UnsupportedEncodingException {

		detachedCriteria = pageBean.getDetachedCriteria();
		detachedCriteria.setProjection(null);
		detachedCriteria.createAlias("student", "s");

		grade_id = new String(grade_id.getBytes("iso8859-1"), "utf-8");
		class_id = new String(class_id.getBytes("iso8859-1"), "utf-8");

		if (StringUtils.isNotBlank(grade_id)) {
			if (!"全部年级".equals(grade_id) && !"".equals(grade_id)) {
				detachedCriteria.add(Restrictions.eq("s.grade_id", grade_id));
			}
		}
		if (StringUtils.isNotBlank(class_id)) {
			if (!"全部班级".equals(class_id) && !"".equals(class_id)) {
				detachedCriteria.add(Restrictions.eq("s.class_id", class_id));
			}
		}
	}

	@Override
	public void comeSchoolStudentEnter(StudentCheck model, String ids) throws IOException {

		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginUser");

		if (ids != null && !"".equals(ids)) {
			String[] splitId = ids.split(",");
			for (String id : splitId) {
				StudentCheck studentCheck = studentCheckDao.findById(id);
				studentCheck.setStatus("3");
				studentCheck.setStatus_label("已到校");
				studentCheck.setArrive_time(TimeUtil.getCurrentTime());
				studentCheck.setArrive_checkname(teacher.getTeacher_name());
			}
		}

		String json = "{\"errMeg\":\"\"}";
		JsonUtil.writeJson(json);
	}

	@Override
	public void goSchoolStudentEnter(StudentCheck model, String ids) throws IOException {

		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginUser");

		if (ids != null && !"".equals(ids)) {
			String[] splitId = ids.split(",");
			for (String id : splitId) {
				StudentCheck studentCheck = studentCheckDao.findById(id);
				studentCheck.setStatus("4");
				studentCheck.setStatus_label("已离校");
				studentCheck.setLeave_time(TimeUtil.getCurrentTime());
				studentCheck.setLeave_checkname(teacher.getTeacher_name());
			}
		}

		String json = "{\"errMeg\":\"\"}";
		JsonUtil.writeJson(json);

	}

	@Override
	public List<StudentCheck> getCheckStudent(String syear, String smonth) {
		return studentCheckDao.getCheckStudent(syear, smonth);
	}

	@Override
	public void addStudentCheck(Student student, String start_time, String end_time) {

		long start_time_format = TimeUtil.getTimeStamp(start_time);
		long end_time_format = TimeUtil.getTimeStamp(end_time);
		long time = end_time_format - start_time_format;
		int num = (int) (time / 86400000);
		for (int i = 0; i < num; i++) {

			long currentTime = start_time_format + 86400000 * i;

			Calendar calendar = Calendar.getInstance();
			calendar.setTimeInMillis(currentTime);
			int year = calendar.get(Calendar.YEAR);
			int month = calendar.get(Calendar.MONTH) + 1;
			int day = calendar.get(Calendar.DAY_OF_MONTH);

			String timeFormat = TimeUtil.getTimeFormat(currentTime);
			String week = TimeUtil.getWhereDayWhereMonthToWeekForChina(timeFormat);

			List<StudentMonthCheck> list1 = studentMonthCheckDao.findByMonthAndYear(year + "", month + "");
			StudentMonthCheck studentMonthCheck = null;
			if (list1 != null && list1.size() > 0) {
				studentMonthCheck = list1.get(0);
			}

			StudentCheck studentCheck = new StudentCheck();
			studentCheck.setStudent(student);
			studentCheck.setStudentMonthCheck(studentMonthCheck);
			studentCheck.setDay_label(day + "");
			studentCheck.setWeek_label(week);
			studentCheck.setDate_label(timeFormat);

			studentCheck.setStatus("1");
			studentCheck.setStatus_label("已请假");

			// 设置手机端数据
			studentCheck.setMorningStatus("2");
			studentCheck.setAfternoonStatus("2");

		}

	}

	@Override
	public List<StudentCheck> findAll() {
		return studentCheckDao.findAll();
	}

	@Override
	public List<StudentCheck> getStudentCheck(Classes classes) {

		String id = classes.getId();
		classes = classesDao.findById(id);
		Set<StudentCheck> studentChecks = classes.getStudentChecks();
		List<StudentCheck> list = new ArrayList<>(studentChecks);

		return list;
	}

	@Override
	public List<StudentCheck> findByStudentAndMonth(Student student, String check_time) {
		return studentCheckDao.findByStudentAndMonth(student, check_time);
	}

	@Override
	public StudentCheck findById(String id) {
		return studentCheckDao.findById(id);
	}

	@Override
	public List<StudentCheck> findStudentCheckByYearAndMonthAndStudentId(String syear, String smonth,
			String student_id) {
		return studentCheckDao.findStudentCheckByYearAndMonthAndStudentId(syear, smonth, student_id);
	}

	@Override
	public void addStudentNote(StudentCheck model) throws IOException {

		String id = model.getId();
		String note = model.getNote();
		StudentCheck studentCheck = studentCheckDao.findById(id);
		studentCheck.setNote(note);

		String json = "{\"status\": 1,\"info\": \"提交成功！\"}";
		JsonUtil.writeJson(json);

	}

	@Override
	public List<StudentCheck> findByclassIdAndDay(String id) {
		return studentCheckDao.findByclassIdAndDay(id);
	}

	@Override
	public void taddStudentCheck(String student_id) throws IOException {
		// todo
		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginTeacher");
		StudentCheck studentCheck = studentCheckDao.findByStudentIdAndDate(student_id);
		String ischecked = studentCheck.getIschecked();
		
		String currentTime = TimeUtil.getCurrentTime();
		String substring = currentTime.substring(11, 16);
		String[] split2 = substring.split(":");
		int hour2 = Integer.parseInt(split2[0]);

		String type = "";

		if (ischecked==null) {
			if (!"2".equals(studentCheck.getStatus())) {
				String json = "{\"type\":\"1\",\"info\": \"家长已经帮助签到\"}";
			}

			ServletActionContext.getRequest().getSession().setAttribute("cometype", "1");
			// 设置手机端数据
			studentCheck.setArrive_time(substring);
			studentCheck.setArrive_status("正常");
			type = "签到成功";
			studentCheck.setMorningStatus("0");

			studentCheck.setStatus("3");
			studentCheck.setStatus_label("已到校");
			studentCheck.setArrive_time(substring);
			studentCheck.setArrive_checkname(teacher.getTeacher_name());
			
			studentCheck.setIschecked("1");
		}
		
		else if ("1".equals(ischecked)) {
			if (!"4".equals(studentCheck.getStatus())) {
				String json = "{\"type\":\"1\",\"info\": \"家长已经帮助退签\"}";
			}

			ServletActionContext.getRequest().getSession().setAttribute("cometype", "1");
			studentCheck.setArrive_time(substring);
			studentCheck.setArrive_status("正常");
			type = "退签成功";
			// 设置手机端数据
			studentCheck.setMorningStatus("0");

			studentCheck.setStatus("4");
			studentCheck.setStatus_label("已离校");
			studentCheck.setArrive_time(substring);
			studentCheck.setArrive_checkname(teacher.getTeacher_name());
			
			studentCheck.setIschecked("2");
		}
		
		else{
			type="您已经执行过操作,无需重复执行";
		}
		

		String json = "{\"type\":\"0\",\"info\": \"" + type + "\"}";
		JsonUtil.writeJson(json);

	}


	@Override
	public void paddStudentCheck() throws IOException {

		String currentTime = TimeUtil.getCurrentTime();
		String substring = currentTime.substring(11, 16);
		String[] split2 = substring.split(":");
		int hour2 = Integer.parseInt(split2[0]);

		Student student = (Student) ServletActionContext.getRequest().getSession().getAttribute("loginStudent");
		String currentDay = TimeUtil.getCurrentDay();
		StudentCheck studentCheck = studentCheckDao.findByStudentAndDay(student, currentDay);
		String ischecked = studentCheck.getIschecked();
		
		// 1代表规定时间,2代表真实时间

		String type = "";

		if (ischecked==null) {
			if (!"2".equals(studentCheck.getStatus())) {
				String json = "{\"type\":\"1\",\"info\": \"老师已经帮助签到\"}";
			}

			ServletActionContext.getRequest().getSession().setAttribute("cometype", "1");
			// 设置手机端数据
			studentCheck.setArrive_time(substring);
			studentCheck.setArrive_status("正常");
			type = "签到成功";
			studentCheck.setMorningStatus("0");

			studentCheck.setStatus("3");
			studentCheck.setStatus_label("已到校");
			studentCheck.setArrive_time(substring);
			studentCheck.setArrive_checkname(student.getParent_name());
			
			studentCheck.setIschecked("1");
		}

		else if ("2".equals(ischecked)) {
			if (!"4".equals(studentCheck.getStatus())) {
				String json = "{\"type\":\"1\",\"info\": \"老师已经帮助退签\"}";
			}

			ServletActionContext.getRequest().getSession().setAttribute("cometype", "1");
			studentCheck.setArrive_time(substring);
			studentCheck.setArrive_status("正常");

			type = "退签成功";
			// 设置手机端数据
			studentCheck.setMorningStatus("0");

			studentCheck.setStatus("4");
			studentCheck.setStatus_label("已离校");
			studentCheck.setArrive_time(substring);
			studentCheck.setArrive_checkname(student.getParent_name());
			
			studentCheck.setIschecked("2");
		}
		
		else{
			type="您已经执行过操作,无需重复执行";
		}

		String json = "{\"type\":\"0\",\"info\": \"" + type + "\"}";
		JsonUtil.writeJson(json);

	}

	@Override
	public List<TeacherCheck> findByStudentAndStatus(String student_id, String smonth) {
		return studentCheckDao.findByStudentAndStatus(student_id,smonth);
	}

	@Override
	public List<TeacherCheck> findByStudentAndStatus(String student_id, String smonth, String morningStatus, String afternoonStatus){
		return studentCheckDao.findByStudentAndStatus(student_id,smonth,morningStatus, afternoonStatus);
	}

	@Override
	public List<StudentCheck> findByclassIdAndDayAndStatus(String class_id, String status, String currentDay) {
		return studentCheckDao.findByclassIdAndDayAndStatus(class_id,status,currentDay);
	}
}
