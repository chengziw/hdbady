package com.hrbhd.bady.domain;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

public class TeacherMonthCheck {
	
	private String id;
	
	private Teacher teacher;
	private String month_label;
	private String total_days;

	private String actual_days;
	private String normal_days;
	private String late_days;
	
	private String early_days;
	private String edit;
	private String date_label;
	private String year_label;
	
	private Date date_label_format;
	
	private Set<TeacherCheck> teacherChecks = new HashSet<TeacherCheck>();
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
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
	public String getActual_days() {
		return actual_days;
	}
	public void setActual_days(String actual_days) {
		this.actual_days = actual_days;
	}
	public String getNormal_days() {
		return normal_days;
	}
	public void setNormal_days(String normal_days) {
		this.normal_days = normal_days;
	}
	public String getLate_days() {
		return late_days;
	}
	public void setLate_days(String late_days) {
		this.late_days = late_days;
	}
	public String getEarly_days() {
		return early_days;
	}
	public void setEarly_days(String early_days) {
		this.early_days = early_days;
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
	public String getYear_label() {
		return year_label;
	}
	public void setYear_label(String year_label) {
		this.year_label = year_label;
	}
	public Date getDate_label_format() {
		return date_label_format;
	}
	public void setDate_label_format(Date date_label_format) {
		this.date_label_format = date_label_format;
	}
	public Set<TeacherCheck> getTeacherChecks() {
		return teacherChecks;
	}
	public void setTeacherChecks(Set<TeacherCheck> teacherChecks) {
		this.teacherChecks = teacherChecks;
	}

}
