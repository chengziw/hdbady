package com.hrbhd.bady.domain;

import java.io.Serializable;
import java.sql.Date;

public class HomeWork implements Serializable {

	private String id;

	private Classes classes;
	private Subject subject;
	private String year_month_day;

	private String descs;
	private String teacher_info;
	private String publish_time_name;

	private String is_pushed_name;
	private String edit;
	private Date year_month_day_format;

	private String image_url1;
	private String image_url2;
	private String image_url3;
	
	private String grade_id;
	private String classes_id;
	private String subject_id;

	public int setToImageUrl(String fileName) {
		int flag = 0;

		if (image_url1 == null) {
			image_url1 = fileName;
			flag = 1;
		} else if (image_url2 == null) {
			image_url2 = fileName;
			flag = 2;
		} else if (image_url3 == null) {
			image_url3 = fileName;
			flag = 3;
		}
		return flag;
	}
	
	public String getToImageUrl(int index) {
		String imageUrl="";
		switch (index) {
		case 0:
			imageUrl = image_url1;
			break;
		case 1:
			imageUrl = image_url2;
			break;
		case 2:
			imageUrl = image_url3;
			break;
		default:
			break;
		}
		return imageUrl;
	}
	public int getImageUrlSize() {
		int size = 0;
		if (image_url1!=null&&!"".equals(image_url1)) {
			size++;
		}
		if (image_url2!=null&&!"".equals(image_url2)) {
			size++;
		}
		if (image_url3!=null&&!"".equals(image_url3)) {
			size++;
		}
		return size;
	}
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Classes getClasses() {
		return classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
	}

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public String getYear_month_day() {
		return year_month_day;
	}

	public void setYear_month_day(String year_month_day) {
		this.year_month_day = year_month_day;
	}

	public String getDescs() {
		return descs;
	}

	public void setDescs(String descs) {
		this.descs = descs;
	}

	public String getTeacher_info() {
		return teacher_info;
	}

	public void setTeacher_info(String teacher_info) {
		this.teacher_info = teacher_info;
	}

	public String getPublish_time_name() {
		return publish_time_name;
	}

	public void setPublish_time_name(String publish_time_name) {
		this.publish_time_name = publish_time_name;
	}

	public String getIs_pushed_name() {
		return is_pushed_name;
	}

	public void setIs_pushed_name(String is_pushed_name) {
		this.is_pushed_name = is_pushed_name;
	}

	public String getEdit() {
		return edit;
	}

	public void setEdit(String edit) {
		this.edit = edit;
	}

	public Date getYear_month_day_format() {
		return year_month_day_format;
	}

	public void setYear_month_day_format(Date year_month_day_format) {
		this.year_month_day_format = year_month_day_format;
	}

	public String getImage_url1() {
		return image_url1;
	}

	public void setImage_url1(String image_url1) {
		this.image_url1 = image_url1;
	}

	public String getImage_url2() {
		return image_url2;
	}

	public void setImage_url2(String image_url2) {
		this.image_url2 = image_url2;
	}

	public String getImage_url3() {
		return image_url3;
	}

	public void setImage_url3(String image_url3) {
		this.image_url3 = image_url3;
	}

	public String getGrade_id() {
		return grade_id;
	}

	public void setGrade_id(String grade_id) {
		this.grade_id = grade_id;
	}

	public String getClasses_id() {
		return classes_id;
	}

	public void setClasses_id(String classes_id) {
		this.classes_id = classes_id;
	}

	public String getSubject_id() {
		return subject_id;
	}

	public void setSubject_id(String subject_id) {
		this.subject_id = subject_id;
	}
	

}
