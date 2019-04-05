package com.hrbhd.bady.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

public class StudentCheck implements Serializable{
	
	private String id;
	
	private Student student;
	private String date_label;
	private String arrive_time;
	
	private String arrive_checkname;
	private String leave_time;
	private String leave_checkname;
	
	private String status_label;
	private String note;
	private String edit;
	
	private String status;
	//新增加的两个字段
	private String week_label;
	private String day_label;
	
	private String year_label;
	private String month_label;
	private String arrive_status;
	
	private String leave_status;
	private String up_status;
	private String down_status;
	
	private Date date_label_format;
	private StudentMonthCheck studentMonthCheck;
	private Classes classes;
	
	private String student_id;
	private String morningStatus;
	private String afternoonStatus;
	
	private String ischecked;
	private String classes_id;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public String getDate_label() {
		return date_label;
	}

	public void setDate_label(String date_label) {
		this.date_label = date_label;
	}

	public String getArrive_time() {
		return arrive_time;
	}

	public void setArrive_time(String arrive_time) {
		this.arrive_time = arrive_time;
	}

	public String getArrive_checkname() {
		return arrive_checkname;
	}

	public void setArrive_checkname(String arrive_checkname) {
		this.arrive_checkname = arrive_checkname;
	}

	public String getLeave_time() {
		return leave_time;
	}

	public void setLeave_time(String leave_time) {
		this.leave_time = leave_time;
	}

	public String getLeave_checkname() {
		return leave_checkname;
	}

	public void setLeave_checkname(String leave_checkname) {
		this.leave_checkname = leave_checkname;
	}

	public String getStatus_label() {
		return status_label;
	}

	public void setStatus_label(String status_label) {
		this.status_label = status_label;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getEdit() {
		return edit;
	}

	public void setEdit(String edit) {
		this.edit = edit;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getWeek_label() {
		return week_label;
	}

	public void setWeek_label(String week_label) {
		this.week_label = week_label;
	}

	public String getDay_label() {
		return day_label;
	}

	public void setDay_label(String day_label) {
		this.day_label = day_label;
	}

	public String getYear_label() {
		return year_label;
	}

	public void setYear_label(String year_label) {
		this.year_label = year_label;
	}

	public String getMonth_label() {
		return month_label;
	}

	public void setMonth_label(String month_label) {
		this.month_label = month_label;
	}

	public String getArrive_status() {
		return arrive_status;
	}

	public void setArrive_status(String arrive_status) {
		this.arrive_status = arrive_status;
	}

	public String getLeave_status() {
		return leave_status;
	}

	public void setLeave_status(String leave_status) {
		this.leave_status = leave_status;
	}

	public String getUp_status() {
		return up_status;
	}

	public void setUp_status(String up_status) {
		this.up_status = up_status;
	}

	public String getDown_status() {
		return down_status;
	}

	public void setDown_status(String down_status) {
		this.down_status = down_status;
	}

	public Date getDate_label_format() {
		return date_label_format;
	}

	public void setDate_label_format(Date date_label_format) {
		this.date_label_format = date_label_format;
	}

	public StudentMonthCheck getStudentMonthCheck() {
		return studentMonthCheck;
	}

	public void setStudentMonthCheck(StudentMonthCheck studentMonthCheck) {
		this.studentMonthCheck = studentMonthCheck;
	}

	public Classes getClasses() {
		return classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
	}

	public String getStudent_id() {
		return student_id;
	}

	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}

	public String getMorningStatus() {
		return morningStatus;
	}

	public void setMorningStatus(String morningStatus) {
		this.morningStatus = morningStatus;
	}

	public String getAfternoonStatus() {
		return afternoonStatus;
	}

	public void setAfternoonStatus(String afternoonStatus) {
		this.afternoonStatus = afternoonStatus;
	}

	public String getIschecked() {
		return ischecked;
	}

	public void setIschecked(String ischecked) {
		this.ischecked = ischecked;
	}

	public String getClasses_id() {
		return classes_id;
	}

	public void setClasses_id(String classes_id) {
		this.classes_id = classes_id;
	}
	
	
	
}
