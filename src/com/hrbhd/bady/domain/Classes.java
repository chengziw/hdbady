package com.hrbhd.bady.domain;

import java.io.Serializable;

import java.util.HashSet;
import java.util.Set;


import org.aspectj.weaver.AjAttribute.PrivilegedAttribute;

public class Classes implements Serializable {

	private String id;

	private String grade_id;
	private String class_name;
	private String type_label;

	private String start_label;
	private String end_label;
	private String next_upgrade_time;

	private String status_label;
	private String create_time;

	private String test;
	private String teacher_id;
	private String studentNumber;
	private Teacher teacher;

	private String note;
	private String status;
	private Set<Student> students = new HashSet<Student>();

	private Grade grade;
	private ClassType classType;
	private Set<StudentBespeak> studentBespeaks = new HashSet<StudentBespeak>();

	private CurriculaTable curriculaTable;
	private Set<ClassesChangeLog> classesChangeLogs = new HashSet<ClassesChangeLog>();
	private Set<HomeWork> homeWorks = new HashSet<HomeWork>();
	
	private Set<CookBook> cookBooks = new HashSet<CookBook>(); 
	private Set<StudentCheck> studentChecks = new HashSet<StudentCheck>();
	private String type_id;
	

	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGrade_id() {
		return grade_id;
	}

	public void setGrade_id(String grade_id) {
		this.grade_id = grade_id;
	}

	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}

	public String getType_label() {
		return type_label;
	}

	public void setType_label(String type_label) {
		this.type_label = type_label;
	}

	public String getStart_label() {
		return start_label;
	}

	public void setStart_label(String start_label) {
		this.start_label = start_label;
	}

	public String getEnd_label() {
		return end_label;
	}

	public void setEnd_label(String end_label) {
		this.end_label = end_label;
	}

	public String getNext_upgrade_time() {
		return next_upgrade_time;
	}

	public void setNext_upgrade_time(String next_upgrade_time) {
		this.next_upgrade_time = next_upgrade_time;
	}

	public String getStatus_label() {
		return status_label;
	}

	public void setStatus_label(String status_label) {
		this.status_label = status_label;
	}

	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

	public String getTest() {
		return test;
	}

	public void setTest(String test) {
		this.test = test;
	}

	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}

	public String getTeacher_id() {
		return teacher_id;
	}

	public void setStudentNumber(String studentNumber) {
		this.studentNumber = studentNumber;
	}

	public String getStudentNumber() {
		return studentNumber;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getNote() {
		return note;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStatus() {
		return status;
	}

	public Set<Student> getStudents() {
		return students;
	}

	public void setStudents(Set<Student> students) {
		this.students = students;
	}

	public Grade getGrade() {
		return grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}

	public ClassType getClassType() {
		return classType;
	}

	public void setClassType(ClassType classType) {
		this.classType = classType;
	}

	public Set<StudentBespeak> getStudentBespeaks() {
		return studentBespeaks;
	}

	public void setStudentBespeaks(Set<StudentBespeak> studentBespeaks) {
		this.studentBespeaks = studentBespeaks;
	}

	public CurriculaTable getCurriculaTable() {
		return curriculaTable;
	}

	public void setCurriculaTable(CurriculaTable curriculaTable) {
		this.curriculaTable = curriculaTable;
	}

	public Set<ClassesChangeLog> getClassesChangeLogs() {
		return classesChangeLogs;
	}

	public void setClassesChangeLogs(Set<ClassesChangeLog> classesChangeLogs) {
		this.classesChangeLogs = classesChangeLogs;
	}

	public Set<HomeWork> getHomeWorks() {
		return homeWorks;
	}

	public void setHomeWorks(Set<HomeWork> homeWorks) {
		this.homeWorks = homeWorks;
	}

	public Set<CookBook> getCookBooks() {
		return cookBooks;
	}

	public void setCookBooks(Set<CookBook> cookBooks) {
		this.cookBooks = cookBooks;
	}

	public Set<StudentCheck> getStudentChecks() {
		return studentChecks;
	}

	public void setStudentChecks(Set<StudentCheck> studentChecks) {
		this.studentChecks = studentChecks;
	}

	public String getType_id() {
		return type_id;
	}

	public void setType_id(String type_id) {
		this.type_id = type_id;
	}

	@Override
	public String toString() {
		return "Classes [id=" + id + ", grade=" + grade + ", class_name=" + class_name + ", type_label=" + type_label
				+ ", start_label=" + start_label + ", end_label=" + end_label + ", next_upgrade_time="
				+ next_upgrade_time + ", status_label=" + status_label + ",  create_time=" + create_time + ", test=" + test + ", teacher_id=" + teacher_id + ", studentNumber="
				+ studentNumber + ", note=" + note + ", status=" + status + "]";
	}

}
