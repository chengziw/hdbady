package com.hrbhd.bady.quartz;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.hrbhd.bady.domain.ClockConfig;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.StudentCheck;
import com.hrbhd.bady.domain.StudentMonthCheck;
import com.hrbhd.bady.domain.StudentVacation;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.domain.TeacherCheck;
import com.hrbhd.bady.domain.TeacherMonthCheck;
import com.hrbhd.bady.domain.TeacherVacation;
import com.hrbhd.bady.service.IClockConfigService;
import com.hrbhd.bady.service.IStudentCheckService;
import com.hrbhd.bady.service.IStudentMonthCheckService;
import com.hrbhd.bady.service.IStudentService;
import com.hrbhd.bady.service.IStudentVacationService;
import com.hrbhd.bady.service.ITeacherCheckService;
import com.hrbhd.bady.service.ITeacherMonthCheckService;
import com.hrbhd.bady.service.ITeacherService;
import com.hrbhd.bady.service.ITeacherVacationService;
import com.hrbhd.bady.util.TimeUtil;

public class MyQuartz {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@Autowired
	private IStudentService studentService;
	@Autowired
	private IStudentVacationService studentVacationService;
	@Autowired
	private IStudentCheckService studentCheckService;
	@Autowired
	private IStudentMonthCheckService studentMonthCheckService;
	@Autowired
	private IClockConfigService clockConfigService;
	@Autowired
	private ITeacherService teacherService;
	@Autowired
	private ITeacherVacationService teacherVacationService;
	@Autowired
	private ITeacherCheckService teacherCheckService;
	@Autowired
	private ITeacherMonthCheckService teacherMonthCheckService;

	/**
	 * 请假之后立马生成,判断是否请假,在请假区间内就不生成. 0 1 2 3 4 休息日,已请假,未到校,已到校,已离校
	 **/
	protected void addStudentCheck() {

		System.out.println("addStudentCheck");
		// 获取月考勤记纪录
		String month_label = TimeUtil.getCurrentMonth() + "";
		String year_label = TimeUtil.getCurrentYear() + "";
		List<StudentMonthCheck> list1 = studentMonthCheckService.findByMonthAndYear(year_label, month_label);
		StudentMonthCheck studentMonthCheck = null;
		if (list1 != null && list1.size() > 0) {
			studentMonthCheck = list1.get(0);
		}
		// 判断是否是休息日
		List<ClockConfig> clist = clockConfigService.findClockConfig();
		ClockConfig clockConfig = clist.get(0);
		List<String> clockDayList = clockConfig.getClockDayList();
		// 判断是否请假

		// 获取所有学生,添加日考勤
		List<Student> list2 = studentService.findAll();
		
		String currentOneDay = TimeUtil.getCurrentOneDay();
		int currentYear = TimeUtil.getCurrentYear();
		String currentWeek = TimeUtil.getCurrentWeek();
		String currentDay = TimeUtil.getCurrentDay();
		int currentMonth = TimeUtil.getCurrentMonth();
		
		for (Student student : list2) {

			// 斜线内的东西可能会被删除.
			/////////////////////////////////////////////////////////////////////////////
			// 判断是否请假
			long currentTime = TimeUtil.getTimeStamp(currentDay);
			boolean flag = true;
			List<StudentVacation> list = studentVacationService.findByStudentId(student.getId());
			for (StudentVacation studentVacation : list) {
				String start_time2 = studentVacation.getStart_time();
				String end_time2 = studentVacation.getEnd_time();
				long start_time_format2 = TimeUtil.getTimeStamp(start_time2);
				long end_time_format2 = TimeUtil.getTimeStamp(end_time2);
				// 开始请假时间大于当前时间,不添加日考勤
				if (currentTime <= start_time_format2 && currentTime <= end_time_format2) {
					flag = false;
				}
			}
			// 斜线内的东西可能会被删除.
			/////////////////////////////////////////////////////////////////////////////
			if (flag) {
				StudentCheck studentCheck = new StudentCheck();
				studentCheck.setStudent(student);
				studentCheck.setClasses(student.getClasses());
				studentCheck.setStudentMonthCheck(studentMonthCheck);
				studentCheck.setYear_label(currentYear + "");
				studentCheck.setMonth_label(currentMonth + "");
				studentCheck.setWeek_label(currentWeek);
				studentCheck.setDay_label(currentOneDay);
				studentCheck.setDate_label(currentDay);
				// 是休息日,设置状态.
				if (clockDayList.contains(TimeUtil.getCurrentWeek())) {
					studentCheck.setStatus("0");
					studentCheck.setStatus_label("休息日");
					
					//设置手机端数据
					studentCheck.setMorningStatus("1");
					studentCheck.setAfternoonStatus("1");
					/////////////////////////////////////////////////////////////////////////////

				}
				/*
				 * //斜线内的东西可能会被删除.
				 * /////////////////////////////////////////////////////////////
				 * //// //////////// else if(flag){ studentCheck.setStatus("1");
				 * studentCheck.setStatus_label("已请假"); //斜线内的东西可能会被删除.
				 * /////////////////////////////////////////////////////////////
				 * //// //////////// }
				 */else {
					studentCheck.setStatus("2");
					studentCheck.setStatus_label("未到校");
					
					//设置手机端数据
					studentCheck.setMorningStatus("3");
					studentCheck.setAfternoonStatus("3");
					/////////////////////////////////////////////////////////////////////////////
				}

				studentCheckService.save(studentCheck);
			}
		}

	}

	protected void addStudentMonthCheck() {

		System.out.println("addStudentMonthCheck");

		List<Student> list = studentService.findAll();
		for (Student student : list) {
			StudentMonthCheck studentMonthCheck = new StudentMonthCheck();
			studentMonthCheck.setStudent(student);
			// 获取并设置当前月份
			int month_label = TimeUtil.getCurrentMonth();
			studentMonthCheck.setMonth_label(month_label + "");
			// 获取并设置当前年份
			String year_label = TimeUtil.getCurrentYear() + "";
			studentMonthCheck.setYear_label(year_label);

			// 设置并设置每月应出勤的天数
			List<ClockConfig> clist = clockConfigService.findAll();
			if (list != null && list.size() > 0) {
				String month = clist.get(0).getMonth();
				String[] split = month.split(",");
				String total_days = split[month_label];
				studentMonthCheck.setTotal_days(total_days);
			}
			// 设置实际出勤天数
			studentMonthCheck.setActual_clock_days("0");
			// 获取并设置当前日期
			studentMonthCheck.setDate_label(TimeUtil.getCurrentDay());

			studentMonthCheckService.save(studentMonthCheck);
		}
	}

	protected void addTeacherCheck() {

		System.out.println("addStudentCheck");
		// 获取月考勤记纪录
		String month_label = TimeUtil.getCurrentMonth() + "";
		String year_label = TimeUtil.getCurrentYear() + "";
		List<TeacherMonthCheck> list1 = teacherMonthCheckService.findByMonthAndYear(year_label, month_label);
		TeacherMonthCheck teacherMonthCheck = null;
		if (list1 != null && list1.size() > 0) {
			teacherMonthCheck = list1.get(0);
		}
		// 判断是否是休息日
		List<ClockConfig> clist = clockConfigService.findClockConfig();
		ClockConfig clockConfig = clist.get(0);
		List<String> clockDayList = clockConfig.getClockDayList();
		// 判断是否请假

		// 获取所有学生,添加日考勤
		List<Teacher> list = teacherService.findAll();
		
		String currentOneDay = TimeUtil.getCurrentOneDay();
		int currentYear = TimeUtil.getCurrentYear();
		String currentWeek = TimeUtil.getCurrentWeek();
		String currentDay = TimeUtil.getCurrentDay();
		int currentMonth = TimeUtil.getCurrentMonth();
		
		for (Teacher teacher : list) {

			String phone = teacher.getPhone();
			if("admin".equals(phone)){
				continue;
			}
			// 斜线内的东西可能会被删除.
			/////////////////////////////////////////////////////////////////////////////
			// 判断是否请假
			long currentTime = TimeUtil.getTimeStamp(currentDay);
			boolean flag = true;

			List<TeacherVacation> list2 = teacherVacationService.findByTeacherId(teacher.getId());

			for (TeacherVacation teacherVacation : list2) {

				String start_time2 = teacherVacation.getStart_time();
				String end_time2 = teacherVacation.getEnd_time();
				long start_time_format2 = TimeUtil.getTimeStamp(start_time2);
				long end_time_format2 = TimeUtil.getTimeStamp(end_time2);
				// 开始请假时间大于当前时间,不添加日考勤
				if (currentTime <= start_time_format2 && currentTime <= end_time_format2) {
					flag = false;
				}
			}
			/////////////////////////////////////////////////////////////////////////////
			if (flag) {

				TeacherCheck teacherCheck = new TeacherCheck();
				teacherCheck.setTeacher(teacher);
				// TODO
				// 因为这些东西要重复使用,日后修改的时候把他们提取成局部变量.
				teacherCheck.setTeacherMonthCheck(teacherMonthCheck);
				teacherCheck.setYear_label(currentYear + "");
				teacherCheck.setMonth_label(month_label);
				teacherCheck.setWeek_label(currentMonth + "");
				teacherCheck.setDay_label(currentOneDay);
				teacherCheck.setDate_label(currentDay);
				if (clockDayList.contains(currentWeek)) {
					teacherCheck.setStatus("0");
					teacherCheck.setUp_status("0");
					teacherCheck.setDown_status("0");
					teacherCheck.setArrive_status("休息");
					teacherCheck.setLeave_status("休息");
					
					//设置手机端数据
					teacherCheck.setMorningStatus("1");
					teacherCheck.setAfternoonStatus("1");
					/////////////////////////////////////////////////////////////////////////////
				} else {
					teacherCheck.setStatus("11");
					teacherCheck.setUp_status("1");
					teacherCheck.setDown_status("1");
					teacherCheck.setArrive_status("上班缺卡");
					teacherCheck.setLeave_status("下班缺卡");
					
					//设置手机端数据
					teacherCheck.setMorningStatus("3");
					teacherCheck.setAfternoonStatus("3");

				}
				teacherCheckService.save(teacherCheck);
			}
		}

	}

	protected void addTeacherMonthCheck() {

		System.out.println("addTeacherMonthCheck");
		List<Teacher> list = teacherService.findAll();
		for (Teacher teacher : list) {
			String phone = teacher.getPhone();
			if("admin".equals(phone)){
				continue;
			}
			
			TeacherMonthCheck teacherMonthCheck = new TeacherMonthCheck();
			teacherMonthCheck.setTeacher(teacher);
			// 获取并设置当前月份
			int month_lable = TimeUtil.getCurrentMonth();
			teacherMonthCheck.setMonth_label(month_lable + "");
			// 设置并设置每月出勤的天数
			List<ClockConfig> clist = clockConfigService.findAll();
			if (list != null && list.size() > 0) {
				String month = clist.get(0).getMonth();
				String[] split = month.split(",");
				String total_days = split[month_lable];
				teacherMonthCheck.setTotal_days(total_days);
			}
			// 设置实际出勤天数
			teacherMonthCheck.setActual_days("0");
			// 获取并设置当前日期
			teacherMonthCheck.setDate_label(TimeUtil.getCurrentDay());

			teacherMonthCheckService.save(teacherMonthCheck);
		}

	}

	protected void dataBaseCopy() {

		// 数据库导出
		String user = "root"; // 数据库帐号
		String password = "root"; // 登陆密码
		String database = "hdbady"; // 需要备份的数据库名

		String currentDay = TimeUtil.getCurrentDay();
		String fileName = currentDay + ".sql";
		String filePath = "d:\\DataBaseCopy";
		String pathName = filePath + "\\" + fileName;

		File file = new File(filePath);
		if (!file.exists()) {
			file.mkdir();
		}

		String stmt = "mysqldump " + database + " -u " + user + " -p" + password + " --result-file=" + pathName;
		/*
		 * String mysql="mysqldump test -u root -proot
		 * --result-file=d:\\test.sql";
		 */
		try {
			Runtime.getRuntime().exec(stmt);
			System.out.println("数据已导出到文件" + pathName + "中");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
