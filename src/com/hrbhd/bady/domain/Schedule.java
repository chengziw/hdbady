package com.hrbhd.bady.domain;

import java.io.Serializable;

public class Schedule implements Serializable{

	private String id;
	
	private String grade;
	private String morning_has_num;
	private String morning_start;
	
	private String afternoon_has_num;
	private String afternoon_start;
	private String duration;
	
	private String rest_duration;
	private String week_type_label;
	private String edit;
	
	private String start_time;
	private String end_time;
	private String dayNum;
	
	private String start_end_time;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getMorning_has_num() {
		return morning_has_num;
	}

	public void setMorning_has_num(String morning_has_num) {
		this.morning_has_num = morning_has_num;
	}

	public String getMorning_start() {
		return morning_start;
	}

	public void setMorning_start(String morning_start) {
		this.morning_start = morning_start;
	}

	public String getAfternoon_has_num() {
		return afternoon_has_num;
	}

	public void setAfternoon_has_num(String afternoon_has_num) {
		this.afternoon_has_num = afternoon_has_num;
	}

	public String getAfternoon_start() {
		return afternoon_start;
	}

	public void setAfternoon_start(String afternoon_start) {
		this.afternoon_start = afternoon_start;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getRest_duration() {
		return rest_duration;
	}

	public void setRest_duration(String rest_duration) {
		this.rest_duration = rest_duration;
	}

	public String getWeek_type_label() {
		return week_type_label;
	}

	public void setWeek_type_label(String week_type_label) {
		this.week_type_label = week_type_label;
	}

	public String getEdit() {
		return edit;
	}

	public void setEdit(String edit) {
		this.edit = edit;
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

	public String getDayNum() {
		return dayNum;
	}

	public void setDayNum(String dayNum) {
		this.dayNum = dayNum;
	}

	public String getStart_end_time() {
		return start_end_time;
	}

	public void setStart_end_time(String start_end_time) {
		this.start_end_time = start_end_time;
	}

	@Override
	public String toString() {
		return "Schedule [id=" + id + ", grade=" + grade + ", morning_has_num=" + morning_has_num + ", morning_start="
				+ morning_start + ", afternoon_has_num=" + afternoon_has_num + ", afternoon_start=" + afternoon_start
				+ ", duration=" + duration + ", rest_duration=" + rest_duration + ", week_type_label=" + week_type_label
				+ ", edit=" + edit + ", start_time=" + start_time + ", end_time=" + end_time + ", dayNum=" + dayNum
				+ ", start_end_time=" + start_end_time + "]";
	}

}
