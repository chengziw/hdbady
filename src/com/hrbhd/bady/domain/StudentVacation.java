package com.hrbhd.bady.domain;

import java.io.Serializable;
import java.sql.Date;

public class StudentVacation implements Serializable{

	private String id;
	
	//private String grade;
	//private String classes;
	private Student student;

	private String sex_label;
	private String type_label;
	private String reason;
	
	private String start_time;
	private String end_time;
	private String apply_name;
	
	private String apply_phone;
	private String apply_time;
	private String check_techer_name;
	
	private String check_time;
	private String status_label;
	private String check_note;
	
	private String descs;
	private String check_status;
	private String typee;

	private String status;
	private String student_id;
	//非数据库数据
	private Date apply_time_format;
	
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

	public String getSex_label() {
		return sex_label;
	}

	public void setSex_label(String sex_label) {
		this.sex_label = sex_label;
	}

	public String getType_label() {
		return type_label;
	}

	public void setType_label(String type_label) {
		this.type_label = type_label;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public String getApply_name() {
		return apply_name;
	}

	public void setApply_name(String apply_name) {
		this.apply_name = apply_name;
	}

	public String getApply_phone() {
		return apply_phone;
	}

	public void setApply_phone(String apply_phone) {
		this.apply_phone = apply_phone;
	}

	public String getApply_time() {
		return apply_time;
	}

	public void setApply_time(String apply_time) {
		this.apply_time = apply_time;
	}

	public String getCheck_techer_name() {
		return check_techer_name;
	}

	public void setCheck_techer_name(String check_techer_name) {
		this.check_techer_name = check_techer_name;
	}

	public String getCheck_time() {
		return check_time;
	}

	public void setCheck_time(String check_time) {
		this.check_time = check_time;
	}

	public String getStatus_label() {
		return status_label;
	}

	public void setStatus_label(String status_label) {
		this.status_label = status_label;
	}
	
	public String getStudent_id() {
		return student_id;
	}

	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}

	public String getCheck_note() {
		return check_note;
	}

	public void setCheck_note(String check_note) {
		this.check_note = check_note;
	}

	public String getDescs() {
		return descs;
	}

	public void setDescs(String descs) {
		this.descs = descs;
	}

	public String getCheck_status() {
		return check_status;
	}

	public void setCheck_status(String check_status) {
		this.check_status = check_status;
	}

	public String getTypee() {
		return typee;
	}

	public void setTypee(String typee) {
		this.typee = typee;
	}

	public Date getApply_time_format() {
		return apply_time_format;
	}

	public void setApply_time_format(Date apply_time_format) {
		this.apply_time_format = apply_time_format;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTypeLabel(String typee) {
		
		String typeLabel = "";
		switch (typee) {
		case "1":
			typeLabel="病假";
			break;
		case "2":
			typeLabel="事假";
			break;
		case "3":
			typeLabel="其他假";
			break;
	
		default:
			break;
		}

		return typeLabel;
	}

}
