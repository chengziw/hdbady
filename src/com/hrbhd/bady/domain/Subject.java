package com.hrbhd.bady.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Subject implements Serializable{

	private String id;
	
	private String name;
	private String grade_name;
	private String status_name;
	
	private String status;
	private String edit;
	private Set<Grade> grades = new HashSet<Grade>();
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGrade_name() {
		return grade_name;
	}
	public void setGrade_name(String grade_name) {
		this.grade_name = grade_name;
	}
	public String getStatus_name() {
		return status_name;
	}
	public void setStatus_name(String status_name) {
		this.status_name = status_name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getEdit() {
		return edit;
	}
	public void setEdit(String edit) {
		this.edit = edit;
	}
	public Set<Grade> getGrades() {
		return grades;
	}
	public void setGrades(Set<Grade> grades) {
		this.grades = grades;
	}
	@Override
	public String toString() {
		return "Subject [id=" + id + ", name=" + name + ", grade_name=" + grade_name + ", status_name=" + status_name
				+ ", status=" + status + ", edit=" + edit + "]";
	}
	
}
