package com.hrbhd.bady.domain;

import java.io.Serializable;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;


public class StudentBespeak implements Serializable {

	// 展示资料14;
	private String id;

	private String student_no;
	private String name;
	private String sex;

	private String yearMonthDay;
	private String age;
	private String grade_id;

	private String class_id;
	private String parent_name;
	private String phone;

	private String enter_date;
	private String address;
	private String status_name;
	
	private String edit;
	private String password;
	private Date enter_date_format;
	

	// 复制新增资料
	//学生表中不要的资料

	private String bespeak_type_name;
	private String teacher_name;

	private String create_time_name;
	private String attend_shool_time_name;

	private String desctext;

	// 详细资料18个;
	private String is_local;
	private String is_teacherson;
	private String census_type;

	private String relationship;
	private String health_status;
	private String is_allergy;

	private String is_predisease;
	private String is_health_form;
	private String is_health_verify;

	private String is_ccine;
	private String blood_type;
	private String commom_disease;

	private String timetype_id;
	private String is_only_child;
	private String birthplace;

	private String identity_card;
	private String demand;
	private String note;

	private String interest;
	private String status_name_text;
	private Set<StudentBespeakDesc> studentBespeakDesc = new HashSet<StudentBespeakDesc>();
	
	//private Set studentBespeakDesc = new HashSet(0);
	//StudentBespeakDesc
	private Grade grade;
	private Classes classes;
	
	public StudentBespeak(){
		
	}
	
	public StudentBespeak(String desctext, String teacher_name, String create_time_name) {
		this.desctext = desctext;
		this.teacher_name = teacher_name;
		this.create_time_name = create_time_name;
	}

	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStudent_no() {
		return student_no;
	}

	public void setStudent_no(String student_no) {
		this.student_no = student_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getYearMonthDay() {
		return yearMonthDay;
	}

	public void setYearMonthDay(String yearMonthDay) {
		this.yearMonthDay = yearMonthDay;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGrade_id() {
		return grade_id;
	}

	public void setGrade_id(String grade_id) {
		this.grade_id = grade_id;
	}

	public String getClass_id() {
		return class_id;
	}

	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}

	public String getParent_name() {
		return parent_name;
	}

	public void setParent_name(String parent_name) {
		this.parent_name = parent_name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEnter_date() {
		return enter_date;
	}

	public void setEnter_date(String enter_date) {
		this.enter_date = enter_date;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStatus_name() {
		return status_name;
	}

	public void setStatus_name(String status_name) {
		this.status_name = status_name;
	}

	public String getEdit() {
		return edit;
	}

	public void setEdit(String edit) {
		this.edit = edit;
	}
	

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getEnter_date_format() {
		return enter_date_format;
	}

	public void setEnter_date_format(Date enter_date_format) {
		this.enter_date_format = enter_date_format;
	}

	public String getBespeak_type_name() {
		return bespeak_type_name;
	}

	public void setBespeak_type_name(String bespeak_type_name) {
		this.bespeak_type_name = bespeak_type_name;
	}

	public String getTeacher_name() {
		return teacher_name;
	}

	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}

	public String getCreate_time_name() {
		return create_time_name;
	}

	public void setCreate_time_name(String create_time_name) {
		this.create_time_name = create_time_name;
	}

	public String getAttend_shool_time_name() {
		return attend_shool_time_name;
	}

	public void setAttend_shool_time_name(String attend_shool_time_name) {
		this.attend_shool_time_name = attend_shool_time_name;
	}

	public String getDesctext() {
		return desctext;
	}

	public void setDesctext(String desctext) {
		this.desctext = desctext;
	}

	public String getIs_local() {
		return is_local;
	}

	public void setIs_local(String is_local) {
		this.is_local = is_local;
	}

	public String getIs_teacherson() {
		return is_teacherson;
	}

	public void setIs_teacherson(String is_teacherson) {
		this.is_teacherson = is_teacherson;
	}

	public String getCensus_type() {
		return census_type;
	}

	public void setCensus_type(String census_type) {
		this.census_type = census_type;
	}

	public String getRelationship() {
		return relationship;
	}

	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}

	public String getHealth_status() {
		return health_status;
	}

	public void setHealth_status(String health_status) {
		this.health_status = health_status;
	}

	public String getIs_allergy() {
		return is_allergy;
	}

	public void setIs_allergy(String is_allergy) {
		this.is_allergy = is_allergy;
	}

	public String getIs_predisease() {
		return is_predisease;
	}

	public void setIs_predisease(String is_predisease) {
		this.is_predisease = is_predisease;
	}

	public String getIs_health_form() {
		return is_health_form;
	}

	public void setIs_health_form(String is_health_form) {
		this.is_health_form = is_health_form;
	}

	public String getIs_health_verify() {
		return is_health_verify;
	}

	public void setIs_health_verify(String is_health_verify) {
		this.is_health_verify = is_health_verify;
	}

	public String getIs_ccine() {
		return is_ccine;
	}

	public void setIs_ccine(String is_ccine) {
		this.is_ccine = is_ccine;
	}

	public String getBlood_type() {
		return blood_type;
	}

	public void setBlood_type(String blood_type) {
		this.blood_type = blood_type;
	}

	public String getCommom_disease() {
		return commom_disease;
	}

	public void setCommom_disease(String commom_disease) {
		this.commom_disease = commom_disease;
	}

	public String getTimetype_id() {
		return timetype_id;
	}

	public void setTimetype_id(String timetype_id) {
		this.timetype_id = timetype_id;
	}

	public String getIs_only_child() {
		return is_only_child;
	}

	public void setIs_only_child(String is_only_child) {
		this.is_only_child = is_only_child;
	}

	public String getBirthplace() {
		return birthplace;
	}

	public void setBirthplace(String birthplace) {
		this.birthplace = birthplace;
	}

	public String getIdentity_card() {
		return identity_card;
	}

	public void setIdentity_card(String identity_card) {
		this.identity_card = identity_card;
	}

	public String getDemand() {
		return demand;
	}

	public void setDemand(String demand) {
		this.demand = demand;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}

	public String getStatus_name_text() {
		return status_name_text;
	}

	public void setStatus_name_text(String status_name_text) {
		this.status_name_text = status_name_text;
	}

	public Set<StudentBespeakDesc> getStudentBespeakDesc() {
		return studentBespeakDesc;
	}

	public void setStudentBespeakDesc(Set<StudentBespeakDesc> studentBespeakDesc) {
		this.studentBespeakDesc = studentBespeakDesc;
	}

	public Grade getGrade() {
		return grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}

	public Classes getClasses() {
		return classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
	}

	@Override
	public String toString() {
		return "StudentBespeak [id=" + id + ", student_no=" + student_no + ", name=" + name + ", sex=" + sex
				+ ", yearMonthDay=" + yearMonthDay + ", age=" + age + ", grade_id=" + grade_id + ", class_id="
				+ class_id + ", parent_name=" + parent_name + ", phone=" + phone + ", enter_date=" + enter_date
				+ ", address=" + address + ", status_name=" + status_name + ", edit=" + edit + ", interest=" + interest
				+ ", bespeak_type_name=" + bespeak_type_name + ", teacher_name=" + teacher_name + ", create_time_name="
				+ create_time_name + ", attend_shool_time_name=" + attend_shool_time_name + ", desctext=" + desctext
				+ ", is_local=" + is_local + ", is_teacherson=" + is_teacherson + ", census_type=" + census_type
				+ ", relationship=" + relationship + ", health_status=" + health_status + ", is_allergy=" + is_allergy
				+ ", is_predisease=" + is_predisease + ", is_health_form=" + is_health_form + ", is_health_verify="
				+ is_health_verify + ", is_ccine=" + is_ccine + ", blood_type=" + blood_type + ", commom_disease="
				+ commom_disease + ", timetype_id=" + timetype_id + ", is_only_child=" + is_only_child + ", birthplace="
				+ birthplace + ", identity_card=" + identity_card + ", demand=" + demand + ", note=" + note
				+ ", studentBespeakDesc=" + studentBespeakDesc + ", getId()=" + getId() + ", getStudent_no()="
				+ getStudent_no() + ", getName()=" + getName() + ", getSex()=" + getSex() + ", getDesctext()="
				+ getDesctext() + ", getYearMonthDay()=" + getYearMonthDay() + ", getAge()=" + getAge()
				+ ", getGrade_id()=" + getGrade_id() + ", getClass_id()=" + getClass_id() + ", getParent_name()="
				+ getParent_name() + ", getPhone()=" + getPhone() + ", getEnter_date()=" + getEnter_date()
				+ ", getAddress()=" + getAddress() + ", getStatus_name()=" + getStatus_name() + ", getEdit()="
				+ getEdit() + ", getInterest()=" + getInterest() + ", getBespeak_type_name()=" + getBespeak_type_name()
				+ ", getTeacher_name()=" + getTeacher_name() + ", getCreate_time_name()=" + getCreate_time_name()
				+ ", getAttend_shool_time_name()=" + getAttend_shool_time_name() + ", getIs_local()=" + getIs_local()
				+ ", getIs_teacherson()=" + getIs_teacherson() + ", getCensus_type()=" + getCensus_type()
				+ ", getRelationship()=" + getRelationship() + ", getHealth_status()=" + getHealth_status()
				+ ", getIs_allergy()=" + getIs_allergy() + ", getIs_predisease()=" + getIs_predisease()
				+ ", getIs_health_form()=" + getIs_health_form() + ", getIs_health_verify()=" + getIs_health_verify()
				+ ", getIs_ccine()=" + getIs_ccine() + ", getBlood_type()=" + getBlood_type() + ", getCommom_disease()="
				+ getCommom_disease() + ", getTimetype_id()=" + getTimetype_id() + ", getIs_only_child()="
				+ getIs_only_child() + ", getBirthplace()=" + getBirthplace() + ", getIdentity_card()="
				+ getIdentity_card() + ", getDemand()=" + getDemand() + ", getNote()=" + getNote()
				+ ", getStudentBespeakDesc()=" + getStudentBespeakDesc() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
}
