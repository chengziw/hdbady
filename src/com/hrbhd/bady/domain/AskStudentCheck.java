package com.hrbhd.bady.domain;

import java.io.Serializable;

public class AskStudentCheck implements Serializable{
	
	private String id;
	
	private Student student;
	private Ask ask;
	private String checked;
	
	private String ask_id;
	private String check_time;
	private String student_id;

	
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
	public Ask getAsk() {
		return ask;
	}
	public void setAsk(Ask ask) {
		this.ask = ask;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public String getAsk_id() {
		return ask_id;
	}
	public void setAsk_id(String ask_id) {
		this.ask_id = ask_id;
	}
	public String getCheck_time() {
		return check_time;
	}
	public void setCheck_time(String check_time) {
		this.check_time = check_time;
	}
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	
}
