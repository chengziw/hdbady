package com.hrbhd.bady.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Role implements Serializable{

	private String id;
	
	private String name;
	private String type_label;
	private String scope;
	
	private String user_names;
	private String teacher_name;
	private String create_time;
	
	private String edit;
	private String type;
	private Set<Teacher> teachers = new HashSet<Teacher>();
	
	private Set<Page> pages = new HashSet<Page>();
	private Set<Element> elements = new HashSet<Element>();
	private String note;
	
	//非数据库中字段
	private String structure_id;
	
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
	public String getType_label() {
		return type_label;
	}
	public void setType_label(String type_label) {
		this.type_label = type_label;
	}
	public String getScope() {
		return scope;
	}
	public void setScope(String scope) {
		this.scope = scope;
	}
	public String getUser_names() {
		return user_names;
	}
	public void setUser_names(String user_names) {
		this.user_names = user_names;
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
	public String getEdit() {
		return edit;
	}
	public void setEdit(String edit) {
		this.edit = edit;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public void setTeachers(Set<Teacher> teachers) {
		this.teachers = teachers;
	}
	public Set<Teacher> getTeachers() {
		return teachers;
	}
	public void setPages(Set<Page> pages) {
		this.pages = pages;
	}
	public Set<Page> getPages() {
		return pages;
	}
	public void setElements(Set<Element> elements) {
		this.elements = elements;
	}
	public Set<Element> getElements() {
		return elements;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getNote() {
		return note;
	}
	public String getStructure_id() {
		return structure_id;
	}
	public void setStructure_id(String structure_id) {
		this.structure_id = structure_id;
	}
	@Override
	public String toString() {
		return "Role [id=" + id + ", name=" + name + ", type_label=" + type_label + ", scope=" + scope + ", user_names="
				+ user_names + ", teacher_name=" + teacher_name + ", create_time=" + create_time + ", edit=" + edit
				+ ", type=" + type + ", teachers=" + teachers + ", pages=" + pages + ", elements=" + elements + "]";
	}
	
}
