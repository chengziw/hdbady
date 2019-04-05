package com.hrbhd.bady.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class ClockConfig implements Serializable {

	private String id;

	private String month;

	/*
	 * private String month1; private String month2; private String month3;
	 * private String month4; private String month5; private String month6;
	 * private String month7; private String month8; private String month9;
	 * private String month10; private String month11; private String month12;
	 */

	private String clock_day;
	private String clock_day1;

	private String clock_day2;
	private String clock_day3;
	private String clock_day4;

	private String clock_day5;
	private String clock_day6;
	private String clock_day7;

	private String student_arrive_time;
	private String student_leave_time;
	private String student_clock_type;

	private String teacher_arrive_time;
	private String teacher_leave_time;
	private String teacher_clock_type;

	private String is_send_sms;
	private String is_send_wx;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public void setClock_day(String clock_day) {
		this.clock_day = clock_day;
	}

	public String getClock_day() {
		return clock_day;
	}

	public String getClock_day1() {
		return clock_day1;
	}

	public void setClock_day1(String clock_day1) {
		this.clock_day1 = clock_day1;
	}

	public String getClock_day2() {
		return clock_day2;
	}

	public void setClock_day2(String clock_day2) {
		this.clock_day2 = clock_day2;
	}

	public String getClock_day3() {
		return clock_day3;
	}

	public void setClock_day3(String clock_day3) {
		this.clock_day3 = clock_day3;
	}

	public String getClock_day4() {
		return clock_day4;
	}

	public void setClock_day4(String clock_day4) {
		this.clock_day4 = clock_day4;
	}

	public String getClock_day5() {
		return clock_day5;
	}

	public void setClock_day5(String clock_day5) {
		this.clock_day5 = clock_day5;
	}

	public String getClock_day6() {
		return clock_day6;
	}

	public void setClock_day6(String clock_day6) {
		this.clock_day6 = clock_day6;
	}

	public String getClock_day7() {
		return clock_day7;
	}

	public void setClock_day7(String clock_day7) {
		this.clock_day7 = clock_day7;
	}

	public String getStudent_arrive_time() {
		return student_arrive_time;
	}

	public void setStudent_arrive_time(String student_arrive_time) {
		this.student_arrive_time = student_arrive_time;
	}

	public String getStudent_leave_time() {
		return student_leave_time;
	}

	public void setStudent_leave_time(String student_leave_time) {
		this.student_leave_time = student_leave_time;
	}

	public String getStudent_clock_type() {
		return student_clock_type;
	}

	public void setStudent_clock_type(String student_clock_type) {
		this.student_clock_type = student_clock_type;
	}

	public String getTeacher_arrive_time() {
		return teacher_arrive_time;
	}

	public void setTeacher_arrive_time(String teacher_arrive_time) {
		this.teacher_arrive_time = teacher_arrive_time;
	}

	public String getTeacher_leave_time() {
		return teacher_leave_time;
	}

	public void setTeacher_leave_time(String teacher_leave_time) {
		this.teacher_leave_time = teacher_leave_time;
	}

	public String getTeacher_clock_type() {
		return teacher_clock_type;
	}

	public void setTeacher_clock_type(String teacher_clock_type) {
		this.teacher_clock_type = teacher_clock_type;
	}

	public String getIs_send_sms() {
		return is_send_sms;
	}

	public void setIs_send_sms(String is_send_sms) {
		this.is_send_sms = is_send_sms;
	}

	public String getIs_send_wx() {
		return is_send_wx;
	}

	public void setIs_send_wx(String is_send_wx) {
		this.is_send_wx = is_send_wx;
	}

	/*
	 * public String getMonth1() { return month1; }
	 * 
	 * public void setMonth1(String month1) { this.month1 = month1; }
	 * 
	 * public String getMonth2() { return month2; }
	 * 
	 * public void setMonth2(String month2) { this.month2 = month2; }
	 * 
	 * public String getMonth3() { return month3; }
	 * 
	 * public void setMonth3(String month3) { this.month3 = month3; }
	 * 
	 * public String getMonth4() { return month4; }
	 * 
	 * public void setMonth4(String month4) { this.month4 = month4; }
	 * 
	 * public String getMonth5() { return month5; }
	 * 
	 * public void setMonth5(String month5) { this.month5 = month5; }
	 * 
	 * public String getMonth6() { return month6; }
	 * 
	 * public void setMonth6(String month6) { this.month6 = month6; }
	 * 
	 * public String getMonth7() { return month7; }
	 * 
	 * public void setMonth7(String month7) { this.month7 = month7; }
	 * 
	 * public String getMonth8() { return month8; }
	 * 
	 * public void setMonth8(String month8) { this.month8 = month8; }
	 * 
	 * public String getMonth9() { return month9; }
	 * 
	 * public void setMonth9(String month9) { this.month9 = month9; }
	 * 
	 * public String getMonth10() { return month10; }
	 * 
	 * public void setMonth10(String month10) { this.month10 = month10; }
	 * 
	 * public String getMonth11() { return month11; }
	 * 
	 * public void setMonth11(String month11) { this.month11 = month11; }
	 * 
	 * public String getMonth12() { return month12; }
	 * 
	 * public void setMonth12(String month12) { this.month12 = month12; }
	 */

	public List getClockDayList() {

		List<String> list = new ArrayList<String>();
		/*
		 * list.add(clock_day1); list.add(clock_day2); list.add(clock_day3);
		 * list.add(clock_day4); list.add(clock_day5); list.add(clock_day6);
		 * list.add(clock_day7);
		 */
		if (getCheckDay(clock_day1)) {
			list.add("一");
		}
		if (getCheckDay(clock_day2)) {
			list.add("二");
		}
		if (getCheckDay(clock_day3)) {
			list.add("三");
		}
		if (getCheckDay(clock_day4)) {
			list.add("四");
		}
		if (getCheckDay(clock_day5)) {
			list.add("五");
		}
		if (getCheckDay(clock_day6)) {
			list.add("六");
		}
		if (getCheckDay(clock_day7)) {
			list.add("日");
		}

		return list;
	}

	public boolean getCheckDay(String clockDay) {

		if ("1".equals(clockDay)) {
			return true;
		} else {
			return false;
		}
	}

	public String getClockDay(int index) {
		String monthMustCome = "0";
		String[] split = month.split(",");
		switch (index) {
		case 1:
			monthMustCome = split[0];
			break;
		case 2:
			monthMustCome = split[1];
			break;
		case 3:
			monthMustCome = split[2];
			break;
		case 4:
			monthMustCome = split[3];
			break;
		case 5:
			monthMustCome = split[4];
			break;
		case 6:
			monthMustCome = split[5];
			break;
		case 7:
			monthMustCome = split[6];
			break;
		case 8:
			monthMustCome = split[7];
			break;
		case 9:
			monthMustCome = split[8];
			break;
		case 10:
			monthMustCome = split[9];
			break;
		case 11:
			monthMustCome = split[10];
			break;
		case 12:
			monthMustCome = split[11];
			break;
		default:
			break;
		}
		return monthMustCome;
	}	

	@Override
	public String toString() {
		return "ClockConfig [id=" + id + ", month=" + month + ", clock_day1=" + clock_day1 + ", clock_day2="
				+ clock_day2 + ", clock_day3=" + clock_day3 + ", clock_day4=" + clock_day4 + ", clock_day5="
				+ clock_day5 + ", clock_day6=" + clock_day6 + ", clock_day7=" + clock_day7 + ", student_arrive_time="
				+ student_arrive_time + ", student_leave_time=" + student_leave_time + ", student_clock_type="
				+ student_clock_type + ", teacher_arrive_time=" + teacher_arrive_time + ", teacher_leave_time="
				+ teacher_leave_time + ", teacher_clock_type=" + teacher_clock_type + ", is_send_sms=" + is_send_sms
				+ ", is_send_wx=" + is_send_wx + "]";
	}

}
