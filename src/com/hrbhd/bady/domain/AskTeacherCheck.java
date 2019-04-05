package com.hrbhd.bady.domain;

import java.io.Serializable;

public class AskTeacherCheck implements Serializable{

	private String id;
	
	private Teacher teacher;
	private  Ask ask;
	private String checked;
	
	private String ask_id;
	private String check_time;
	private String teacher_id;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
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
	public String getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}
	
}
