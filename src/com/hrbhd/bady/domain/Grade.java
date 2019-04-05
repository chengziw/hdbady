package com.hrbhd.bady.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Grade implements Serializable {

	private String id;

	private String name;
	private String sort_name;
	private String statusLabel;

	private String test;
	private String status;
	private String is_use_sort;

	private String is_end_grade;
	private Set<Classes> classes = new HashSet<Classes>();
	private Set<Subject> subjects = new HashSet<Subject>();

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

	public String getSort_name() {
		return sort_name;
	}

	public void setSort_name(String sort_name) {
		this.sort_name = sort_name;
	}

	public String getStatusLabel() {
		return statusLabel;
	}

	public void setStatusLabel(String statusLabel) {
		this.statusLabel = statusLabel;
	}

	public String getTest() {
		return test;
	}

	public void setTest(String test) {
		this.test = test;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getIs_use_sort() {
		return is_use_sort;
	}

	public void setIs_use_sort(String is_use_sort) {
		this.is_use_sort = is_use_sort;
	}

	public String getIs_end_grade() {
		return is_end_grade;
	}

	public void setIs_end_grade(String is_end_grade) {
		this.is_end_grade = is_end_grade;
	}

	public Set<Classes> getClasses() {
		return classes;
	}

	public void setClasses(Set<Classes> classes) {
		this.classes = classes;
	}

	public Set<Subject> getSubjects() {
		return subjects;
	}

	public void setSubjects(Set<Subject> subjects) {
		this.subjects = subjects;
	}

	@Override
	public String toString() {
		return "Grade [id=" + id + ", name=" + name + ", sort_name=" + sort_name + ", statusLabel=" + statusLabel
				+ ", test=" + test + ", status=" + status + ", is_use_sort=" + is_use_sort + ", is_end_grade="
				+ is_end_grade + "]";
	}

}
