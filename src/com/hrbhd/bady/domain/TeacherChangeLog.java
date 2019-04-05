package com.hrbhd.bady.domain;

import java.io.Serializable;

import java.sql.Date;


public class TeacherChangeLog implements Serializable{

	private String id;
	
	//private Teacher teacher;
	
	private String worknumber;
	private String teacher_name;
	private String yearMonthDay;
	
	private String phone;
	private String structure_name;
	private String duty_name;
	
	
	private String status_name;
	private String type_name;
	
	private String change_time_name;
	private String note;
	private String operation_name;
	
	private String create_name;
	//非数据库中的字段
	private Date change_time_name_format;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	/*public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}*/
	
	
	public String getStatus_name() {
		return status_name;
	}

	public String getWorknumber() {
		return worknumber;
	}

	public void setWorknumber(String worknumber) {
		this.worknumber = worknumber;
	}

	public String getTeacher_name() {
		return teacher_name;
	}

	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}

	public String getYearMonthDay() {
		return yearMonthDay;
	}

	public void setYearMonthDay(String yearMonthDay) {
		this.yearMonthDay = yearMonthDay;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getStructure_name() {
		return structure_name;
	}

	public void setStructure_name(String structure_name) {
		this.structure_name = structure_name;
	}

	public String getDuty_name() {
		return duty_name;
	}

	public void setDuty_name(String duty_name) {
		this.duty_name = duty_name;
	}

	public void setStatus_name(String status_name) {
		this.status_name = status_name;
	}

	public String getType_name() {
		return type_name;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}

	public String getChange_time_name() {
		return change_time_name;
	}

	public void setChange_time_name(String change_time_name) {
		this.change_time_name = change_time_name;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getOperation_name() {
		return operation_name;
	}

	public void setOperation_name(String operation_name) {
		this.operation_name = operation_name;
	}

	public String getCreate_name() {
		return create_name;
	}

	public void setCreate_name(String create_name) {
		this.create_name = create_name;
	}

	public Date getChange_time_name_format() {
		return change_time_name_format;
	}

	public void setChange_time_name_format(Date change_time_name_format) {
		this.change_time_name_format = change_time_name_format;
	}
	
}
