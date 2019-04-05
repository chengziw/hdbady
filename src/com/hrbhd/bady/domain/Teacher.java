package com.hrbhd.bady.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

public class Teacher implements Serializable {

	private String id;

	private String worknumber;
	private String teacher_name;
	private String sex_name;

	private String brither_name;
	private String age_name;
	private String phone;

	private String weixin;
	private String qq;

	private String duty_id;
	private String duty_name;
	private String entry_time_name;
	private Date entry_time_name_date;
	private String left_time_name;

	private String status_name;
	private String last_login_time_name;
	private String create_time_name;

	private String edit;
	private String note;
	private String status;

	private String email;
	private String password;
	private String change_date;

	private String class_id;
	private String subject_id;
	private TeacherDuty teacherDuty;
	private String structure_name;
	private String structure_id;
	private Structure structure;
	
	private String field1;
	private String field2;
	private String field3;
	
	private Set<Role> roles = new HashSet<Role>();
	private Set<Notice> notices = new HashSet<Notice>();
	private Set<Ask> asks = new HashSet<Ask>();
	
	private Set<TeacherVacation> teacherVacations = new HashSet<TeacherVacation>();
	private Set<TeacherCheck> teacherChecks = new HashSet<TeacherCheck>();
	private Set<TeacherMonthCheck> teacherMonthChecks  = new HashSet<TeacherMonthCheck>();

	private Classes classes;
	private Set<AskTeacherCheck> askTeacherChecks = new HashSet<AskTeacherCheck>();

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWorknumber() {
		return worknumber;
	}

	public void setWorknumber(String worknumber) {
		this.worknumber = worknumber;
	}

	public String getTeacher_name() {
		return teacher_name;
	}

	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}

	public String getSex_name() {
		return sex_name;
	}

	public void setSex_name(String sex_name) {
		this.sex_name = sex_name;
	}

	public String getBrither_name() {
		return brither_name;
	}

	public void setBrither_name(String brither_name) {
		this.brither_name = brither_name;
	}

	public String getAge_name() {
		return age_name;
	}

	public void setAge_name(String age_name) {
		this.age_name = age_name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Structure getStructure() {
		return structure;
	}

	public void setStructure(Structure structure) {
		this.structure = structure;
	}
	
	public String getField1() {
		return field1;
	}

	public void setField1(String field1) {
		this.field1 = field1;
	}

	public String getField2() {
		return field2;
	}

	public void setField2(String field2) {
		this.field2 = field2;
	}

	public String getField3() {
		return field3;
	}

	public void setField3(String field3) {
		this.field3 = field3;
	}

	public String getWeixin() {
		return weixin;
	}

	public void setWeixin(String weixin) {
		this.weixin = weixin;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getDuty_id() {
		return duty_id;
	}

	public void setDuty_id(String duty_id) {
		this.duty_id = duty_id;
	}

	public String getDuty_name() {
		return duty_name;
	}

	public void setDuty_name(String duty_name) {
		this.duty_name = duty_name;
	}

	public String getEntry_time_name() {
		return entry_time_name;
	}

	public void setEntry_time_name(String entry_time_name) {
		this.entry_time_name = entry_time_name;
	}

	public String getLeft_time_name() {
		return left_time_name;
	}

	public void setLeft_time_name(String left_time_name) {
		this.left_time_name = left_time_name;
	}

	public String getStatus_name() {
		return status_name;
	}

	public void setStatus_name(String status_name) {
		this.status_name = status_name;
	}

	public String getLast_login_time_name() {
		return last_login_time_name;
	}

	public void setLast_login_time_name(String last_login_time_name) {
		this.last_login_time_name = last_login_time_name;
	}

	public String getCreate_time_name() {
		return create_time_name;
	}

	public void setCreate_time_name(String create_time_name) {
		this.create_time_name = create_time_name;
	}

	public String getEdit() {
		return edit;
	}

	public void setEdit(String edit) {
		this.edit = edit;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Date getEntry_time_name_date() {
		return entry_time_name_date;
	}

	public void setEntry_time_name_date(Date entry_time_name_date) {
		this.entry_time_name_date = entry_time_name_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getClass_id() {
		return class_id;
	}

	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}

	public String getChange_date() {
		return change_date;
	}

	public void setChange_date(String change_date) {
		this.change_date = change_date;
	}

	public void setSubject_id(String subject_id) {
		this.subject_id = subject_id;
	}

	public String getSubject_id() {
		return subject_id;
	}

	public TeacherDuty getTeacherDuty() {
		return teacherDuty;
	}

	public void setTeacherDuty(TeacherDuty teacherDuty) {
		this.teacherDuty = teacherDuty;
	}
	

	public String getStructure_name() {
		return structure_name;
	}

	public void setStructure_name(String structure_name) {
		this.structure_name = structure_name;
	}

	public void setStructure_id(String structure_id) {
		this.structure_id = structure_id;
	}

	public String getStructure_id() {
		return structure_id;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public Set<Role> getRoles() {
		return roles;
	}
	
	public Set<Notice> getNotices() {
		return notices;
	}

	public void setNotices(Set<Notice> notices) {
		this.notices = notices;
	}

	public Set<Ask> getAsks() {
		return asks;
	}

	public void setAsks(Set<Ask> asks) {
		this.asks = asks;
	}

	public Set<TeacherVacation> getTeacherVacations() {
		return teacherVacations;
	}

	public void setTeacherVacations(Set<TeacherVacation> teacherVacations) {
		this.teacherVacations = teacherVacations;
	}

	public Set<TeacherCheck> getTeacherChecks() {
		return teacherChecks;
	}

	public void setTeacherChecks(Set<TeacherCheck> teacherChecks) {
		this.teacherChecks = teacherChecks;
	}

	public Set<TeacherMonthCheck> getTeacherMonthChecks() {
		return teacherMonthChecks;
	}

	public void setTeacherMonthChecks(Set<TeacherMonthCheck> teacherMonthChecks) {
		this.teacherMonthChecks = teacherMonthChecks;
	}

	public Classes getClasses() {
		return classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
	}

	public Set<AskTeacherCheck> getAskTeacherChecks() {
		return askTeacherChecks;
	}

	public void setAskTeacherChecks(Set<AskTeacherCheck> askTeacherChecks) {
		this.askTeacherChecks = askTeacherChecks;
	}

}
