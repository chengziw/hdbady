package com.hrbhd.bady.web.action;

import java.awt.image.BufferedImageFilter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.apache.struts2.ServletActionContext;
import org.hibernate.envers.tools.graph.GraphDefiner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.ClockConfig;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.StudentCheck;
import com.hrbhd.bady.domain.StudentMonthCheck;
import com.hrbhd.bady.domain.TeacherCheck;
import com.hrbhd.bady.service.IClockConfigService;
import com.hrbhd.bady.service.IStudentCheckService;
import com.hrbhd.bady.service.IStudentMonthCheckService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.TimeUtil;
import com.hrbhd.bady.web.action.base.BaseAction;
import com.mysql.jdbc.StreamingNotifiable;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

@Controller
@Scope("prototype")
public class StudentMonthCheckAction extends BaseAction<StudentMonthCheck> {

	@Autowired
	private IStudentMonthCheckService studentMonthCheckService;
	@Autowired
	private IClockConfigService clockConfigService;
	@Autowired
	private IStudentCheckService studentCheckService;

	private String page;
	private String rows;
	private String tag;

	private String syear;
	private String smonth;

	private String class_id;
	private String end_month;
	private String end_year;

	private String grade_id;
	private String start_month;
	private String start_year;

	private String status;
	private String student_name;
	private String student_id;

	private String check_time;

	public void setPage(String page) {
		this.page = page;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public void setSyear(String syear) {
		this.syear = syear;
	}

	public void setSmonth(String smonth) {
		this.smonth = smonth;
	}

	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}

	public void setEnd_month(String end_month) {
		this.end_month = end_month;
	}

	public void setEnd_year(String end_year) {
		this.end_year = end_year;
	}

	public void setGrade_id(String grade_id) {
		this.grade_id = grade_id;
	}

	public void setStart_month(String start_month) {
		this.start_month = start_month;
	}

	public void setStart_year(String start_year) {
		this.start_year = start_year;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}

	public void setCheck_time(String check_time) {
		this.check_time = check_time;
	}

	public String pageQuery() throws IOException {

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));

		if ("1".equals(tag)) {
			studentMonthCheckService.termQuery(model, pageBean, detachedCriteria, class_id, end_month, end_year,
					grade_id, start_month, start_year, status, student_name);
		}

		studentMonthCheckService.pageQuery(pageBean);

		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[] { "studentChecks", "date_label_format" });
		config.setJsonPropertyFilter(new PropertyFilter() {

			@Override
			public boolean apply(Object source, String name, Object value) {

				if (source instanceof Student && name.equals("asks")) {
					return true;
				}
				if (source instanceof Student && name.equals("notices")) {
					return true;
				}
				if (source instanceof Student && name.equals("grade")) {
					return true;
				}
				if (source instanceof Student && name.equals("enter_date_time")) {
					return true;
				}
				if (source instanceof Student && name.equals("studentVacations")) {
					return true;
				}
				if (source instanceof Student && name.equals("studentChecks")) {
					return true;
				}
				if (source instanceof Student && name.equals("studentMonthChecks")) {
					return true;
				}
				if (source instanceof Student && name.equals("studentChangeLogs")) {
					return true;
				}
				if (source instanceof Student && name.equals("askStudentChecks")) {
					return true;
				}
				if (source instanceof Student && name.equals("noticeStudentChecks")) {
					return true;
				}
				if (source instanceof Student && name.equals("studentImageUrls")) {
					return true;
				}
				if (source instanceof Classes && name.equals("students")) {
					return true;
				}
				if (source instanceof Classes && name.equals("studentBespeaks")) {
					return true;
				}
				if (source instanceof Classes && name.equals("classType")) {
					return true;
				}
				if (source instanceof Classes && name.equals("classesChangeLogs")) {
					return true;
				}
				if (source instanceof Classes && name.equals("homeWorks")) {
					return true;
				}
				if (source instanceof Classes && name.equals("create_time_format")) {
					return true;
				}
				if (source instanceof Classes && name.equals("cookBooks")) {
					return true;
				}
				if (source instanceof Classes && name.equals("studentChecks")) {
					return true;
				}
				if (source instanceof Classes && name.equals("teacher")) {
					return true;
				}
				if (source instanceof Classes && name.equals("curriculaTable")) {
					return true;
				}
				if (source instanceof Grade && name.equals("classes")) {
					return true;
				}
				if (source instanceof Grade && name.equals("subjects")) {
					return true;
				}
				return false;
			}
		});

		JSONArray jsonObject = JSONArray.fromObject(pageBean.getRows(), config);

		int total = pageBean.getTotal();

		String json1 = "{\"total\":" + total + ",\"rows\":";
		String json2 = jsonObject.toString();
		String json3 = "}";
		String json = json1 + json2 + json3;
		JsonUtil.writeJson(json);
		return NONE;
	}

	public String about() {

		String id = model.getId();
		StudentMonthCheck studentMonthCheck = studentMonthCheckService.findById(id);
		ServletActionContext.getContext().getValueStack().set("studentMonthCheck", studentMonthCheck);

		List<ClockConfig> list = clockConfigService.findClockConfig();
		ClockConfig clockConfig = list.get(0);
		String month = clockConfig.getMonth();
		String[] clock_month = month.split(",");
		int currentMonth = TimeUtil.getCurrentMonth();
		String monthMustCome = clock_month[currentMonth - 1];
		ServletActionContext.getContext().getValueStack().set("monthMustCome", monthMustCome);

		return "about";
	}

	public String aboutStudentMonthCheck() throws IOException {

		/*
		 * String syear = "2017"; String smonth = "4";
		 */

		List<ClockConfig> clist = clockConfigService.findClockConfig();
		ClockConfig clockConfig = clist.get(0);
		String cmonth = clockConfig.getMonth();
		String[] clock_month = cmonth.split(",");
		String monthMustCome = clock_month[Integer.parseInt(smonth) - 1];
		ServletActionContext.getContext().getValueStack().set("monthMustCome", monthMustCome);

		// 实际
		List<TeacherCheck> status0 = studentCheckService.findByStudentAndStatus(student_id, smonth);
		ServletActionContext.getContext().getValueStack().set("status0", status0);

		String id = model.getId();
		StudentMonthCheck studentMonthCheck = studentMonthCheckService.findById(id);
		// ServletActionContext.getContext().getValueStack().set("studentMonthCheck",
		// studentMonthCheck);

		StringBuffer buffer = new StringBuffer();
		buffer.append("{\"status\": 1,\"info\": [");
		// 找到此学生这一个月的出勤内容
		// Set<StudentCheck> studentChecks =
		// studentMonthCheck.getStudentChecks();
		// List<StudentCheck> list = new ArrayList<StudentCheck>(studentChecks);
		// List<StudentCheck> list =
		// studentCheckService.getMonthCheckStudent(syear,smonth);

		List<StudentCheck> list = studentCheckService.findStudentCheckByYearAndMonthAndStudentId(syear, smonth,
				student_id);
		/*
		 * List<StudentCheck> list =
		 * studentCheckService.getCheckStudent(syear,smonth);
		 */

		// 某月第一天是星期几
		int firstDayToWeek = TimeUtil.getWhereDayWhereMonthToWeek(syear + "-" + smonth + "-" + "1");
		// 某年
		int year = Integer.parseInt(syear);
		// 某月
		int month = Integer.parseInt(smonth);
		// 当月有多少天
		int monthDay = TimeUtil.getMonthLastDay(year, month);
		// 某月的前一个月有多少天
		int lastMonthDay = TimeUtil.getMonthLastDay(year, month - 1);

		for (int i = 0; i < firstDayToWeek - 1; i++) {

			int dateDay = lastMonthDay - firstDayToWeek + 2 + i;
			int dateMonth = month - 1;
			if (month == 1) {
				dateMonth = 12;
			}
			String dateTime = "";
			String showStstus = "pre";

			buffer.append("{");
			buffer.append("\"dateTime\": \"\",");
			buffer.append("\"dateMonth\": \"" + dateMonth + "\",");
			buffer.append("\"dateDay\": \"" + dateDay + "\",");
			buffer.append("\"showStstus\": \"pre\"");
			buffer.append("},");
		}
		List<String> clockDayList = clockConfig.getClockDayList();

		for (int i = 0; i < monthDay; i++) {
			// TODO
			// 判断是周几,设置周几休息就......
			// 休息日,请假,缺卡,来了
			// 0 , 1 , 2 ,
			buffer.append("{");
			if (list != null && list.size() > 0 && list.get(i) != null) {
				buffer.append("\"day_label\": \"" + list.get(i).getDate_label() + "\",");
				buffer.append("\"week_label\": \"" + list.get(i).getWeek_label() + "\",");
				buffer.append("\"status_label\": \"" + list.get(i).getStatus_label() + "\",");
				buffer.append("\"status\": \"" + list.get(i).getStatus() + "\",");
				buffer.append("\"dateMonth\": \"" + studentMonthCheck.getMonth_label() + "\",");
				buffer.append("\"dateDay\": \"" + list.get(i).getDay_label() + "\",");
				buffer.append("\"arrive_time\": \"" + list.get(i).getArrive_time() + "\",");
				buffer.append("\"leave_time\": \"" + list.get(i).getLeave_time() + "\",");
				buffer.append("\"arrive_checkname\": \"" + list.get(i).getArrive_checkname() + "\",");
				buffer.append("\"leave_checkname\": \"" + list.get(i).getLeave_checkname() + "\"");
				buffer.append("},");
			} else {
				buffer.append("\"day_label\": \"\",");
				buffer.append("\"week_label\": \"\",");
				buffer.append("\"status_label\": \"\",");
				buffer.append("\"status\": \"2\",");
				buffer.append("\"dateMonth\": \"\",");
				buffer.append("\"dateDay\": \"\",");
				buffer.append("\"arrive_time\": \"\",");
				buffer.append("\"leave_time\": \"\",");
				buffer.append("\"arrive_checkname\": \"\",");
				buffer.append("\"leave_checkname\": \"\"");
				buffer.append("},");
			}
		}
		// 某月最后一天
		String lastDay = TimeUtil.getMonthLastDay(year, month) + "";
		// 注意:周日是0
		// 某月最后一天是星期几
		int lastDayToWeek = TimeUtil.getWhereDayWhereMonthToWeek(syear + "-" + smonth + "-" + lastDay);
		for (int i = 0; i <= 6 - lastDayToWeek; i++) {

			int dateDay = i + 1;
			int dateMonth = month + 1;
			if (month == 12) {
				dateMonth = 1;
			}
			String dateTime = "";
			String showStstus = "pre";

			buffer.append("{");
			buffer.append("\"dateTime\":\"\",");
			buffer.append("\"dateMonth\": \"" + dateMonth + "\",");
			buffer.append("\"dateDay\": \"" + dateDay + "\",");
			buffer.append("\"showStstus\": \"next\"");
			if (i == 6 - lastDayToWeek) {
				buffer.append("}");
			} else {
				buffer.append("},");
			}
		}
		buffer.append("]}");

		String json = buffer.toString();
		JsonUtil.writeJson(json);
		System.out.println(json);

		return NONE;
	}

	public String p_studentMonthCheck() {

		return "p_studentMonthCheck";
	}

	/**
	 * 学生月考勤记录数据的查询
	 * 
	 * @return
	 * @throws IOException
	 */
	public String p_pageQuery() throws IOException {

		Student student = (Student) ServletActionContext.getRequest().getSession().getAttribute("loginParent");
		List<StudentCheck> studentChecks = studentCheckService.findByStudentAndMonth(student, check_time);

		StringBuffer buffer = new StringBuffer();
		buffer.append("{\"daylist\":[");

		for (int i = 0; i < studentChecks.size(); i++) {
			StudentCheck studentCheck = studentChecks.get(i);
			buffer.append("{");
			// TODO
			// 状态4没有了
			buffer.append("\"day\":" + studentCheck.getDay_label() + ",");
			buffer.append("\"morningStatus\":\"" + studentCheck.getMorningStatus() + "\",");
			buffer.append("\"morningStatusLabel\":\"" + studentCheck.getStatus_label() + "\",");
			buffer.append("\"arriveTime\":\"" + studentCheck.getArrive_time() + "\",");
			buffer.append("\"afternoonStatus\":\"" + studentCheck.getAfternoonStatus() + "\",");
			buffer.append("\"afternoonStatusLabel\":\"" + studentCheck.getStatus_label() + "\",");
			buffer.append("\"leaveTime\":\"" + studentCheck.getLeave_time() + "\"");

			if (i == studentChecks.size() - 1) {
				buffer.append("}");
			} else {
				buffer.append("},");
			}
		}

		buffer.append("]}");

		String json = buffer.toString();
		JsonUtil.writeJson(json);

		return NONE;
	}

}
