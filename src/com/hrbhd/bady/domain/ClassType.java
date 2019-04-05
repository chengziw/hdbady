package com.hrbhd.bady.domain;

import java.io.Serializable;

import java.util.HashSet;
import java.util.Set;


public class ClassType implements Serializable{

	private String id;
	private String type_name;
	private String status;
	
	private String status_name;
	private String edit;
	private Set<Classes> classes = new HashSet<Classes>();
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
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
	public Set<Classes> getClasses() {
		return classes;
	}
	public void setClasses(Set<Classes> classes) {
		this.classes = classes;
	}
	@Override
	public String toString() {
		return "ClassType [id=" + id + ", type_name=" + type_name + ", status=" + status + ", status_name="
				+ status_name + ", edit=" + edit + "]";
	}
	
}
