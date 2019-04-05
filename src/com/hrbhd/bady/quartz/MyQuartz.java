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
	 * ���֮����������,�ж��Ƿ����,����������ھͲ�����. 0 1 2 3 4 ��Ϣ��,�����,δ��У,�ѵ�У,����У
	 **/
	protected void addStudentCheck() {

		System.out.println("addStudentCheck");
		// ��ȡ�¿��ڼǼ�¼
		String month_label = TimeUtil.getCurrentMonth() + "";
		String year_label = TimeUtil.getCurrentYear() + "";
		List<StudentMonthCheck> list1 = studentMonthCheckService.findByMonthAndYear(year_label, month_label);
		StudentMonthCheck studentMonthCheck = null;
		if (list1 != null && list1.size() > 0) {
			studentMonthCheck = list1.get(0);
		}
		// �ж��Ƿ�����Ϣ��
		List<ClockConfig> clist = clockConfigService.findClockConfig();
		ClockConfig clockConfig = clist.get(0);
		List<String> clockDayList = clockConfig.getClockDayList();
		// �ж��Ƿ����

		// ��ȡ����ѧ��,����տ���
		List<Student> list2 = studentService.findAll();
		
		String currentOneDay = TimeUtil.getCurrentOneDay();
		int currentYear = TimeUtil.getCurrentYear();
		String currentWeek = TimeUtil.getCurrentWeek();
		String currentDay = TimeUtil.getCurrentDay();
		int currentMonth = TimeUtil.getCurrentMonth();
		
		for (Student student : list2) {

			// б���ڵĶ������ܻᱻɾ��.
			/////////////////////////////////////////////////////////////////////////////
			// �ж��Ƿ����
			long currentTime = TimeUtil.getTimeStamp(currentDay);
			boolean flag = true;
			List<StudentVacation> list = studentVacationService.findByStudentId(student.getId());
			for (StudentVacation studentVacation : list) {
				String start_time2 = studentVacation.getStart_time();
				String end_time2 = studentVacation.getEnd_time();
				long start_time_format2 = TimeUtil.getTimeStamp(start_time2);
				long end_time_format2 = TimeUtil.getTimeStamp(end_time2);
				// ��ʼ���ʱ����ڵ�ǰʱ��,������տ���
				if (currentTime <= start_time_format2 && currentTime <= end_time_format2) {
					flag = false;
				}
			}
			// б���ڵĶ������ܻᱻɾ��.
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
				// ����Ϣ��,����״̬.
				if (clockDayList.contains(TimeUtil.getCurrentWeek())) {
					studentCheck.setStatus("0");
					studentCheck.setStatus_label("��Ϣ��");
					
					//�����ֻ�������
					studentCheck.setMorningStatus("1");
					studentCheck.setAfternoonStatus("1");
					/////////////////////////////////////////////////////////////////////////////

				}
				/*
				 * //б���ڵĶ������ܻᱻɾ��.
				 * /////////////////////////////////////////////////////////////
				 * //// //////////// else if(flag){ studentCheck.setStatus("1");
				 * studentCheck.setStatus_label("�����"); //б���ڵĶ������ܻᱻɾ��.
				 * /////////////////////////////////////////////////////////////
				 * //// //////////// }
				 */else {
					studentCheck.setStatus("2");
					studentCheck.setStatus_label("δ��У");
					
					//�����ֻ�������
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
			// ��ȡ�����õ�ǰ�·�
			int month_label = TimeUtil.getCurrentMonth();
			studentMonthCheck.setMonth_label(month_label + "");
			// ��ȡ�����õ�ǰ���
			String year_label = TimeUtil.getCurrentYear() + "";
			studentMonthCheck.setYear_label(year_label);

			// ���ò�����ÿ��Ӧ���ڵ�����
			List<ClockConfig> clist = clockConfigService.findAll();
			if (list != null && list.size() > 0) {
				String month = clist.get(0).getMonth();
				String[] split = month.split(",");
				String total_days = split[month_label];
				studentMonthCheck.setTotal_days(total_days);
			}
			// ����ʵ�ʳ�������
			studentMonthCheck.setActual_clock_days("0");
			// ��ȡ�����õ�ǰ����
			studentMonthCheck.setDate_label(TimeUtil.getCurrentDay());

			studentMonthCheckService.save(studentMonthCheck);
		}
	}

	protected void addTeacherCheck() {

		System.out.println("addStudentCheck");
		// ��ȡ�¿��ڼǼ�¼
		String month_label = TimeUtil.getCurrentMonth() + "";
		String year_label = TimeUtil.getCurrentYear() + "";
		List<TeacherMonthCheck> list1 = teacherMonthCheckService.findByMonthAndYear(year_label, month_label);
		TeacherMonthCheck teacherMonthCheck = null;
		if (list1 != null && list1.size() > 0) {
			teacherMonthCheck = list1.get(0);
		}
		// �ж��Ƿ�����Ϣ��
		List<ClockConfig> clist = clockConfigService.findClockConfig();
		ClockConfig clockConfig = clist.get(0);
		List<String> clockDayList = clockConfig.getClockDayList();
		// �ж��Ƿ����

		// ��ȡ����ѧ��,����տ���
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
			// б���ڵĶ������ܻᱻɾ��.
			/////////////////////////////////////////////////////////////////////////////
			// �ж��Ƿ����
			long currentTime = TimeUtil.getTimeStamp(currentDay);
			boolean flag = true;

			List<TeacherVacation> list2 = teacherVacationService.findByTeacherId(teacher.getId());

			for (TeacherVacation teacherVacation : list2) {

				String start_time2 = teacherVacation.getStart_time();
				String end_time2 = teacherVacation.getEnd_time();
				long start_time_format2 = TimeUtil.getTimeStamp(start_time2);
				long end_time_format2 = TimeUtil.getTimeStamp(end_time2);
				// ��ʼ���ʱ����ڵ�ǰʱ��,������տ���
				if (currentTime <= start_time_format2 && currentTime <= end_time_format2) {
					flag = false;
				}
			}
			/////////////////////////////////////////////////////////////////////////////
			if (flag) {

				TeacherCheck teacherCheck = new TeacherCheck();
				teacherCheck.setTeacher(teacher);
				// TODO
				// ��Ϊ��Щ����Ҫ�ظ�ʹ��,�պ��޸ĵ�ʱ���������ȡ�ɾֲ�����.
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
					teacherCheck.setArrive_status("��Ϣ");
					teacherCheck.setLeave_status("��Ϣ");
					
					//�����ֻ�������
					teacherCheck.setMorningStatus("1");
					teacherCheck.setAfternoonStatus("1");
					/////////////////////////////////////////////////////////////////////////////
				} else {
					teacherCheck.setStatus("11");
					teacherCheck.setUp_status("1");
					teacherCheck.setDown_status("1");
					teacherCheck.setArrive_status("�ϰ�ȱ��");
					teacherCheck.setLeave_status("�°�ȱ��");
					
					//�����ֻ�������
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
			// ��ȡ�����õ�ǰ�·�
			int month_lable = TimeUtil.getCurrentMonth();
			teacherMonthCheck.setMonth_label(month_lable + "");
			// ���ò�����ÿ�³��ڵ�����
			List<ClockConfig> clist = clockConfigService.findAll();
			if (list != null && list.size() > 0) {
				String month = clist.get(0).getMonth();
				String[] split = month.split(",");
				String total_days = split[month_lable];
				teacherMonthCheck.setTotal_days(total_days);
			}
			// ����ʵ�ʳ�������
			teacherMonthCheck.setActual_days("0");
			// ��ȡ�����õ�ǰ����
			teacherMonthCheck.setDate_label(TimeUtil.getCurrentDay());

			teacherMonthCheckService.save(teacherMonthCheck);
		}

	}

	protected void dataBaseCopy() {

		// ���ݿ⵼��
		String user = "root"; // ���ݿ��ʺ�
		String password = "root"; // ��½����
		String database = "hdbady"; // ��Ҫ���ݵ����ݿ���

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
			System.out.println("�����ѵ������ļ�" + pathName + "��");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
