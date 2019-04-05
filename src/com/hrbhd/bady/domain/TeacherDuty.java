package com.hrbhd.bady.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class TeacherDuty implements Serializable{

	private String id;
	
	private String duty_name;
	private String status;
	private String status_name;
	
	private String edit;
	private Set<Teacher> teachers = new HashSet<Teacher>();

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDuty_name() {
		return duty_name;
	}

	public void setDuty_name(String duty_name) {
		this.duty_name = duty_name;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStatus_name() {
		return status_name;
	}

	public void setStatus_name(String status_name) {
		this.status_name = status_name;
	}

	public String getEdit() {
		return edit;
	}

	public void setEdit(String edit) {
		this.edit = edit;
	}

	public Set<Teacher> getTeachers() {
		return teachers;
	}

	public void setTeachers(Set<Teacher> teachers) {
		this.teachers = teachers;
	}

	@Override
	public String toString() {
		return "TeacherDuty [id=" + id + ", duty_name=" + duty_name + ", status=" + status + ", status_name="
				+ status_name + ", edit=" + edit + "]";
	}

}
