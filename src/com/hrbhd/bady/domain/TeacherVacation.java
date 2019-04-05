package com.hrbhd.bady.domain;

import java.io.Serializable;
import java.sql.Date;

public class TeacherVacation implements Serializable {

	private String id;

	private Teacher teacher;
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

	private String edit;
	private String type;
	private String check_status;

	private String status;
	private Date apply_time_format;
	// ·ÇÊý¾Ý¿âÖÐ×Ö¶Î
	private String teacher_id;

	public String getTypeLabel(String type) {
		String typeLabel = "";
		switch (type) {
		case "1":
			typeLabel="²¡¼Ù";
			break;
		case "2":
			typeLabel="ÊÂ¼Ù";
			break;
		case "3":
			typeLabel="»é¼Ù";
			break;
		case "4":
			typeLabel="²ú¼Ù";
			break;
		case "5":
			typeLabel="É¥¼Ù";
			break;
		default:
			break;
		}

		return typeLabel;
	}

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

	public String getCheck_note() {
		return check_note;
	}

	public void setCheck_note(String check_note) {
		this.check_note = check_note;
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

	public String getTeacher_id() {
		return teacher_id;
	}

	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}

	public String getCheck_status() {
		return check_status;
	}

	public void setCheck_status(String check_status) {
		this.check_status = check_status;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getApply_time_format() {
		return apply_time_format;
	}

	public void setApply_time_format(Date apply_time_format) {
		this.apply_time_format = apply_time_format;
	}

}
