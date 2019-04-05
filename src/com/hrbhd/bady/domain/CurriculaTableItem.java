package com.hrbhd.bady.domain;

import java.io.Serializable;

import com.mysql.jdbc.StreamingNotifiable;

public class CurriculaTableItem implements Serializable{

	private String id;

	private CurriculaTable curriculaTable;
	private String teacher_name;
	private String subject_name;
	
	private String course;
	private String week;
	private String teacher_id;
	
	private String curricula_table_id;
	
	public CurriculaTableItem() {
		super();
	}

	public CurriculaTableItem(String teacher_name, String subject_name,
			String course, String week ,String teacher_id) {
		super();
		this.teacher_name = teacher_name;
		this.subject_name = subject_name;
		this.course = course;
		this.week = week;
		this.teacher_id = teacher_id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public CurriculaTable getCurriculaTable() {
		return curriculaTable;
	}

	public void setCurriculaTable(CurriculaTable curriculaTable) {
		this.curriculaTable = curriculaTable;
	}

	public String getTeacher_name() {
		return teacher_name;
	}

	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}

	public String getSubject_name() {
		return subject_name;
	}

	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getWeek() {
		return week;
	}

	public void setWeek(String week) {
		this.week = week;
	}

	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}
	
	public String getTeacher_id() {
		return teacher_id;
	}
	
	public String getCurricula_table_id() {
		return curricula_table_id;
	}

	public void setCurricula_table_id(String curricula_table_id) {
		this.curricula_table_id = curricula_table_id;
	}

	@Override
	public String toString() {
		return "CurriculaTableItem [id=" + id + ", curriculaTable=" + curriculaTable + ", teacher_name=" + teacher_name
				+ ", subject_name=" + subject_name + ", course=" + course + ", week=" + week + "]";
	}

}
