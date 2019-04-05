package com.hrbhd.bady.domain;

import java.io.Serializable;
import java.sql.Date;

public class StudentChangeLog implements Serializable {

	private String id;

	//private Student student;
	private String student_name;
	private String sex_name;
	private String yearMonthDay;
	private String grade_name;
	private String class_name;
	
	private String type_name;
	private String change_date_name;
	private Date change_date_name_format;

	private String note;
	private String teacher_name;
	private String create_name;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStudent_name() {
		return student_name;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	public String getSex_name() {
		return sex_name;
	}

	public void setSex_name(String sex_name) {
		this.sex_name = sex_name;
	}

	public String getYearMonthDay() {
		return yearMonthDay;
	}

	public void setYearMonthDay(String yearMonthDay) {
		this.yearMonthDay = yearMonthDay;
	}

	public String getGrade_name() {
		return grade_name;
	}

	public void setGrade_name(String grade_name) {
		this.grade_name = grade_name;
	}

	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}

	public String getType_name() {
		return type_name;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}

	public String getChange_date_name() {
		return change_date_name;
	}

	public void setChange_date_name(String change_date_name) {
		this.change_date_name = change_date_name;
	}

	public Date getChange_date_name_format() {
		return change_date_name_format;
	}

	public void setChange_date_name_format(Date change_date_name_format) {
		this.change_date_name_format = change_date_name_format;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getTeacher_name() {
		return teacher_name;
	}

	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}

	public String getCreate_name() {
		return create_name;
	}

	public void setCreate_name(String create_name) {
		this.create_name = create_name;
	}



}
