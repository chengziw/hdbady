package com.hrbhd.bady.domain;

import java.io.Serializable;
import java.sql.Date;

public class ClassesChangeLog implements Serializable{

	private String id;
	
	//private Classes classes;
	private String class_name;
	private String grade_name;
	private String class_type;
	private String start_label;
	
	private String type_label;
	private String note;
	
	private String teacher_name;
	private String create_time;
	//非数据库中的字段
	private Date create_time_format;
	//private String class_id;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	/*public Classes getClasses() {
		return classes;
	}
	public void setClasses(Classes classes) {
		this.classes = classes;
	}*/
	
	public String getType_label() {
		return type_label;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getGrade_name() {
		return grade_name;
	}
	public void setGrade_name(String grade_name) {
		this.grade_name = grade_name;
	}
	public String getClass_type() {
		return class_type;
	}
	public void setClass_type(String class_type) {
		this.class_type = class_type;
	}
	public String getStart_label() {
		return start_label;
	}
	public void setStart_label(String start_label) {
		this.start_label = start_label;
	}
	public void setType_label(String type_label) {
		this.type_label = type_label;
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
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	public Date getCreate_time_format() {
		return create_time_format;
	}
	public void setCreate_time_format(Date create_time_format) {
		this.create_time_format = create_time_format;
	}
	
}
