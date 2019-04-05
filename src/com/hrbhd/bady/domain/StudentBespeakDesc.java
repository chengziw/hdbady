package com.hrbhd.bady.domain;

import java.io.Serializable;

public class StudentBespeakDesc implements Serializable{

	private String id;
	
	private String bespeak_id;
	private String teacher_id;
	private String desctext;
	
	private String create_time;
	private String teacher_name;
	private String teacher_phone;
	
	private String create_time_name;
	private StudentBespeak studentBespeak;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBespeak_id() {
		return bespeak_id;
	}
	public void setBespeak_id(String bespeak_id) {
		this.bespeak_id = bespeak_id;
	}
	public String getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}
	public void setDesctext(String desctext) {
		this.desctext = desctext;
	}
	public String getDesctext() {
		return desctext;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	public String getTeacher_phone() {
		return teacher_phone;
	}
	public void setTeacher_phone(String teacher_phone) {
		this.teacher_phone = teacher_phone;
	}
	public String getCreate_time_name() {
		return create_time_name;
	}
	public void setCreate_time_name(String create_time_name) {
		this.create_time_name = create_time_name;
	}
	public StudentBespeak getStudentBespeak() {
		return studentBespeak;
	}
	public void setStudentBespeak(StudentBespeak studentBespeak) {
		this.studentBespeak = studentBespeak;
	}
	@Override
	public String toString() {
		return "StudentBespeakDesc [id=" + id + ", bespeak_id=" + bespeak_id + ", teacher_id=" + teacher_id + ", desc="
				+ desctext + ", create_time=" + create_time + ", teacher_name=" + teacher_name + ", teacher_phone="
				+ teacher_phone + ", create_time_name=" + create_time_name + ", studentBespeak=" + studentBespeak + "]";
	}
	
}
