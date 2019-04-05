package com.hrbhd.bady.domain;

import java.io.Serializable;

public class StudentImageUrl implements Serializable{
	
	private String id;
	
	private Student student;
	private String image_url;
	
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
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}

}
