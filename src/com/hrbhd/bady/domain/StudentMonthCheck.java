package com.hrbhd.bady.domain;

import java.io.Serializable;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import com.mysql.jdbc.StreamingNotifiable;

public class StudentMonthCheck implements Serializable{

	private String id;
	
	private Student student;
	private String month_label;
	private String total_days;
	
	private String actual_clock_days;
	private String edit;
	private String year_label;
	private String date_label;
	private Date date_label_format;

	private Set<StudentCheck> studentChecks = new HashSet<StudentCheck>();
	
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
	public String getMonth_label() {
		return month_label;
	}
	public void setMonth_label(String month_label) {
		this.month_label = month_label;
	}
	public String getTotal_days() {
		return total_days;
	}
	public void setTotal_days(String total_days) {
		this.total_days = total_days;
	}
	public String getActual_clock_days() {
		return actual_clock_days;
	}
	public void setActual_clock_days(String actual_clock_days) {
		this.actual_clock_days = actual_clock_days;
	}
	public String getEdit() {
		return edit;
	}
	public void setEdit(String edit) {
		this.edit = edit;
	}
	public String getDate_label() {
		return date_label;
	}
	public void setDate_label(String date_label) {
		this.date_label = date_label;
	}
	public Date getDate_label_format() {
		return date_label_format;
	}
	public void setDate_label_format(Date date_label_format) {
		this.date_label_format = date_label_format;
	}
	public String getYear_label() {
		return year_label;
	}
	public void setYear_label(String year_label) {
		this.year_label = year_label;
	}
	public Set<StudentCheck> getStudentChecks() {
		return studentChecks;
	}
	public void setStudentChecks(Set<StudentCheck> studentChecks) {
		this.studentChecks = studentChecks;
	}
	
}
