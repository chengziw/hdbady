package com.hrbhd.bady.service.impl;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.cfg.annotations.IdBagBinder;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.junit.Test.None;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hrbhd.bady.dao.IClockConfigDao;
import com.hrbhd.bady.dao.ITeacherCheckDao;
import com.hrbhd.bady.dao.ITeacherMonthCheckDao;
import com.hrbhd.bady.domain.ClockConfig;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.domain.TeacherCheck;
import com.hrbhd.bady.domain.TeacherMonthCheck;
import com.hrbhd.bady.service.ITeacherCheckService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.PageBean;
import com.hrbhd.bady.util.TimeUtil;

@Service
@Transactional
public class TeacherCheckServiceImpl implements ITeacherCheckService {

	@Autowired
	private ITeacherCheckDao teacherCheckDao;
	@Autowired
	private ITeacherMonthCheckDao teacherMonthCheckDao;
	@Autowired
	private IClockConfigDao clockConfigDao;

	@Override
	public void pageQuery(PageBean pageBean) {
		teacherCheckDao.pageQuery(pageBean);
	}

	@Override
	public void save(TeacherCheck teacherCheck) {
		teacherCheckDao.save(teacherCheck);
	}

	@Override
	public void termQuery(TeacherCheck model, PageBean pageBean, DetachedCriteria detachedCriteria, String date,
		String structure_id, String teacher_name) throws UnsupportedEncodingException {

		detachedCriteria = pageBean.getDetachedCriteria();
		detachedCriteria.setProjection(null);
		String check_status=model.getCheck_status();
		structure_id = new String(structure_id.getBytes("iso8859-1"), "utf-8");
		teacher_name = new String(teacher_name.getBytes("iso8859-1"), "utf-8");

		detachedCriteria.createAlias("teacher", "t");

		if (StringUtils.isNotBlank(structure_id)) {
			if (!"全部部门".equals(structure_id) && !"1".equals(structure_id)) {
				detachedCriteria.add(Restrictions.eq("t.structure_id", structure_id));
			}
		}
		// TODO
		// 暂时没做
		/*
		 * if (StringUtils.isNotBlank(check_status)) { if
		 * (!"全部状态".equals(check_status)) {
		 * detachedCriteria.add(Restrictions.eq("check_status", check_status));
		 * 
		 * } }
		 */
		if (StringUtils.isNotBlank(teacher_name)) {
			detachedCriteria.add(Restrictions.like("t.teacher_name", teacher_name + "%"));
		}

		if (StringUtils.isNotBlank(date)) {
			Date date_format = TimeUtil.getDate(date);
			detachedCriteria.add(Restrictions.eq("date_label_format", date_format));
		}
	}

	/**
	 * 下面有一个重名的方法
	 */
	@Override
	public void addTeacherCheck(Teacher teacher, String start_time, String end_time) {

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

			List<TeacherMonthCheck> list1 = teacherMonthCheckDao.findByMonthAndYear(year + "", month + "");
			TeacherMonthCheck teacherMonthCheck = null;
			if (list1 != null && list1.size() > 0) {
				teacherMonthCheck = list1.get(0);
			}

			TeacherCheck teacherCheck = new TeacherCheck();
			teacherCheck.setTeacher(teacher);
			teacherCheck.setTeacherMonthCheck(teacherMonthCheck);
			teacherCheck.setDay_label(day + "");
			teacherCheck.setWeek_label(week);
			teacherCheck.setDate_label(timeFormat);
			teacherCheck.setStatus("22");
			teacherCheck.setUp_status("");
			teacherCheck.setDown_status("");
			teacherCheck.setArrive_status("");
			teacherCheck.setLeave_status("");
			teacherCheck.setArrive_time("请假");
			teacherCheck.setLeave_time("请假");

			// 设置手机端数据
			teacherCheck.setMorningStatus("2");
			teacherCheck.setAfternoonStatus("2");

			teacherCheckDao.save(teacherCheck);
		}
	}

	@Override
	public List<TeacherCheck> findByTeacherAndMonth(Teacher teacher, String check_time) {
		return teacherCheckDao.findByTeacherAndMonth(teacher, check_time);
	}

	@Override
	public void tregister() {

		List<ClockConfig> list = clockConfigDao.findAll();
		ClockConfig clockConfig = list.get(0);
		String teacher_arrive_time = clockConfig.getTeacher_arrive_time();
		String teacher_leave_time = clockConfig.getTeacher_leave_time();

		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginTeacher");
		String currentDay = TimeUtil.getCurrentDay();
		TeacherCheck teacherCheck = teacherCheckDao.findByTeacherAndDay(teacher, currentDay);

	}

	@Override
	public TeacherCheck findById(String id) {
		return teacherCheckDao.findById(id);
	}

	@Override
	public void addTeacherNote(TeacherCheck model) throws IOException {

		String id = model.getId();
		String note = model.getNote();
		TeacherCheck teacherCheck = teacherCheckDao.findById(id);
		teacherCheck.setNote(note);

		String json = "{\"status\": 1,\"info\": \"提交成功！\"}";
		JsonUtil.writeJson(json);

	}

	/**
	 * 上面有一个重名的方法
	 */
	@Override
	public void taddTeacherCheck() throws IOException {

		List<ClockConfig> list = clockConfigDao.findAll();
		ClockConfig clockConfig = null;
		
		
		if (list != null && list.size() > 0) {
			
			Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginTeacher");
			String currentDay = TimeUtil.getCurrentDay();
			TeacherCheck teacherCheck = teacherCheckDao.findByTeacherAndDay(teacher, currentDay);
				
			clockConfig = list.get(0);
			String currentTime = TimeUtil.getCurrentTime();
			String substring = currentTime.substring(11, 16);
			String[] split2 = substring.split(":");
			int hour2 = Integer.parseInt(split2[0]);
			int min2 = Integer.parseInt(split2[1]);

			String student_time = "";
			String ischecked = teacherCheck.getIschecked();
			if("".equals(ischecked)){
				student_time = clockConfig.getStudent_arrive_time();
			} else {
				student_time = clockConfig.getStudent_leave_time();
			}
			String[] split1 = student_time.split(":");

			int hour1 = Integer.parseInt(split1[0]);
			int min1 = Integer.parseInt(split1[1]);

			String type = "";

			if ("".equals(ischecked)) {

				if (hour2 > hour1 || (hour2 == hour1 && min2 > min1)) {

					ServletActionContext.getRequest().getSession().setAttribute("cometype", "1");
					teacherCheck.setArrive_time("迟到");
					//teacherCheck.setArrive_status("迟到");
					type = "您已迟到";
					// 设置手机端数据
					teacherCheck.setMorningStatus("4");
				} else {
					ServletActionContext.getRequest().getSession().setAttribute("cometype", "1");
					teacherCheck.setArrive_time(substring);
					//teacherCheck.setArrive_status("正常");
					type = "上班签到成功";
					// 设置手机端数据
					teacherCheck.setMorningStatus("0");
				}
				teacherCheck.setIschecked("1");
			}

			else if ("1".equals(ischecked)) {

				if (hour2 < hour1 || (hour2 == hour1 && min2 < min1)) {

					ServletActionContext.getRequest().getSession().setAttribute("gotype", "1");
					teacherCheck.setArrive_time("早退");
					//teacherCheck.setArrive_status("早退");
					type = "您已早退";
					// 设置手机端数据
					teacherCheck.setAfternoonStatus("4");
				} else {
					ServletActionContext.getRequest().getSession().setAttribute("gotype", "1");
					teacherCheck.setLeave_time(substring);
					//teacherCheck.setLeave_status("正常");
					type = "下班签到成功";
					// 设置手机端数据
					teacherCheck.setAfternoonStatus("0");
				}
				teacherCheck.setIschecked("2");
			}
			
			else{
				type="您已经执行过操作,无需重复执行";
			}

			String json = "{\"type\":\"1\",\"info\": \"" + type + "\"}";
			JsonUtil.writeJson(json);
		}
	}

	@Override
	public List<TeacherCheck> findTeacherCheckByYearAndMonthAndTeacherId(String syear, String smonth,
			String teacher_id) {
		return teacherCheckDao.findTeacherCheckByYearAndMonthAndTeacherId(syear, smonth, teacher_id);
	}

	@Override
	public List<TeacherCheck> findByTeacherAndStatus(String teacher_id, String smonth, String morningStatus, String afternoonStatus) {
		return teacherCheckDao.findByTeacherAndStatus(teacher_id, smonth, morningStatus, afternoonStatus);
	}

	@Override
	public List<TeacherCheck> findByTeacherAndStatus(String teacher_id,String smonth) {
		return teacherCheckDao.findByTeacherAndStatus(teacher_id,smonth);
	}

}
