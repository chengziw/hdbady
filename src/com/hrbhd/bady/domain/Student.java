package com.hrbhd.bady.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;


/**
 * student_no int not null, name varchar(32), sex varchar(32),
 * 
 * yearMonthDay date, age int, grade_id varchar(32),
 * 
 * class_id varchar(32), parent_name varchar(32), phone int,
 * 
 * enter_date date, address varchar(100),
 * 
 * @author liuzhuang
 *
 */
public class Student implements Serializable {

	//展示资料14;
	private String id;

	private String student_no;
	private String name;
	private String sex;

	private String yearMonthDay;
	private String age;
	private String grade_id;

	private Classes classes;
	private Grade grade;
	private String password;
	
	private String class_id;
	private String parent_name;
	private String phone;

	private String enter_date;
	private String address;//50
	private String status_name;

	private String edit;
	private Date enter_date_time;
	private String email;
	
	private String weixin;
	private String qq;
	
	//详细资料18个;
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
	
	private String field1;
	private String field2;
	private String field3;
	
	private String interest;
	//private Date enter_date_name;
	private String status_name_text;
	private Set<Notice> notices = new HashSet<Notice>();
	
	private Set<Ask> asks = new HashSet<Ask>();
	private Set<StudentVacation> studentVacations = new HashSet<StudentVacation>();
	private Set<StudentCheck> studentChecks = new HashSet<StudentCheck>();
	
	private Set<StudentMonthCheck> studentMonthChecks = new HashSet<StudentMonthCheck>();
	private Set<StudentChangeLog> studentChangeLogs = new HashSet<StudentChangeLog>();
	private Set<AskStudentCheck> askStudentChecks = new HashSet<AskStudentCheck>();
	
	private Set<StudentImageUrl> studentImageUrls = new HashSet<StudentImageUrl>();
	
	public Student(){
		
	}
	
	public Student(String student_no, String name, String sex, String yearMonthDay, String age,Grade grade,String password,
			Classes classes, String parent_name, String phone, String enter_date, String address,
		    String edit, String is_local, String is_teacherson, String census_type,
			String relationship, String health_status, String is_allergy, String is_predisease, String is_health_form,
			String is_health_verify, String is_ccine, String blood_type, String commom_disease, String timetype_id,
			String is_only_child, String birthplace, String identity_card, String demand, String note,
			String interest) {
		super();
		this.student_no = student_no;
		this.name = name;
		this.sex = sex;
		this.yearMonthDay = yearMonthDay;
		this.age = age;
		this.grade = grade;
		this.password = password;
		this.classes = classes;
		this.parent_name = parent_name;
		this.phone = phone;
		this.enter_date = enter_date;
		this.address = address;
		this.edit = edit;
		this.is_local = is_local;
		this.is_teacherson = is_teacherson;
		this.census_type = census_type;
		this.relationship = relationship;
		this.health_status = health_status;
		this.is_allergy = is_allergy;
		this.is_predisease = is_predisease;
		this.is_health_form = is_health_form;
		this.is_health_verify = is_health_verify;
		this.is_ccine = is_ccine;
		this.blood_type = blood_type;
		this.commom_disease = commom_disease;
		this.timetype_id = timetype_id;
		this.is_only_child = is_only_child;
		this.birthplace = birthplace;
		this.identity_card = identity_card;
		this.demand = demand;
		this.note = note;
		this.interest = interest;
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

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
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

	public Grade getGrade() {
		return grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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
	
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public Date getEnter_date_time() {
		return enter_date_time;
	}
	
	public void setEnter_date_time(Date enter_date_time) {
		this.enter_date_time = enter_date_time;
	}

	public void setStatus_name_text(String status_name_text) {
		this.status_name_text = status_name_text;
	}
	
	public String getStatus_name_text() {
		return status_name_text;
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

	public Classes getClasses() {
		return classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
	}

	public Set<StudentVacation> getStudentVacations() {
		return studentVacations;
	}

	public void setStudentVacations(Set<StudentVacation> studentVacations) {
		this.studentVacations = studentVacations;
	}

	public Set<StudentCheck> getStudentChecks() {
		return studentChecks;
	}

	public void setStudentChecks(Set<StudentCheck> studentChecks) {
		this.studentChecks = studentChecks;
	}

	public Set<StudentMonthCheck> getStudentMonthChecks() {
		return studentMonthChecks;
	}

	public void setStudentMonthChecks(Set<StudentMonthCheck> studentMonthChecks) {
		this.studentMonthChecks = studentMonthChecks;
	}

	public Set<StudentChangeLog> getStudentChangeLogs() {
		return studentChangeLogs;
	}

	public void setStudentChangeLogs(Set<StudentChangeLog> studentChangeLogs) {
		this.studentChangeLogs = studentChangeLogs;
	}

	public Set<AskStudentCheck> getAskStudentChecks() {
		return askStudentChecks;
	}

	public void setAskStudentChecks(Set<AskStudentCheck> askStudentChecks) {
		this.askStudentChecks = askStudentChecks;
	}

	public Set<StudentImageUrl> getStudentImageUrls() {
		return studentImageUrls;
	}

	public void setStudentImageUrls(Set<StudentImageUrl> studentImageUrls) {
		this.studentImageUrls = studentImageUrls;
	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", student_no=" + student_no + ", name=" + name + ", sex=" + sex
				+ ", yearMonthDay=" + yearMonthDay + ", age=" + age + ", grade_id=" + grade_id + ", class_id="
				+ class_id + ", parent_name=" + parent_name + ", phone=" + phone + ", enter_date=" + enter_date
				+ ", address=" + address + ", status_name=" + status_name + ", edit=" + edit + ", is_local=" + is_local
				+ ", is_teacherson=" + is_teacherson + ", census_type=" + census_type + ", relationship=" + relationship
				+ ", health_status=" + health_status + ", is_allergy=" + is_allergy + ", is_predisease=" + is_predisease
				+ ", is_health_form=" + is_health_form + ", is_health_verify=" + is_health_verify + ", is_ccine="
				+ is_ccine + ", blood_type=" + blood_type + ", commom_disease=" + commom_disease + ", timetype_id="
				+ timetype_id + ", is_only_child=" + is_only_child + ", birthplace=" + birthplace + ", identity_card="
				+ identity_card + ", demand=" + demand + ", note=" + note + "]";
	}

}
