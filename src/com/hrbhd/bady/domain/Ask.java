package com.hrbhd.bady.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

public class Ask implements Serializable{

	private String id;
	
	private String title;
	private String push_range;
	private String push_object;
	
	private String create_teacher_name;
	private String create_time_name;
	private String check_teacher_name;
	
	private String check_time_name;
	private String edit;
	private String is_delete;
	
	//////////////新加的//////////////
	private String ask_answer;
	private String ask_type;
	private String end_time;
	
	private String is_anonymous;
	private String is_repeatsubmit;
	private String is_showresult;
	
	private String is_singlesubmit;
	private String targetman_type;
	//////////////新加的//////////////
	private String check_teacher_id;

	private String is_check;
	/*private Set<Student> students = new HashSet<Student>();
	private Set<Teacher> teachers = new HashSet<Teacher>();*/
	
	private Set<AskTeacherCheck> askTeacherChecks = new HashSet<AskTeacherCheck>();
	private Set<AskStudentCheck> askStudentChecks = new HashSet<AskStudentCheck>(); 
	private Set<AskItems> askItems = new HashSet<AskItems>();
	
	private String start_time;
	private Date check_time_name_format;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPush_range() {
		return push_range;
	}
	public void setPush_range(String push_range) {
		this.push_range = push_range;
	}
	public String getPush_object() {
		return push_object;
	}
	public void setPush_object(String push_object) {
		this.push_object = push_object;
	}
	public String getCreate_teacher_name() {
		return create_teacher_name;
	}
	public void setCreate_teacher_name(String create_teacher_name) {
		this.create_teacher_name = create_teacher_name;
	}
	public String getCreate_time_name() {
		return create_time_name;
	}
	public void setCreate_time_name(String create_time_name) {
		this.create_time_name = create_time_name;
	}
	public String getCheck_teacher_name() {
		return check_teacher_name;
	}
	public void setCheck_teacher_name(String check_teacher_name) {
		this.check_teacher_name = check_teacher_name;
	}
	public String getCheck_time_name() {
		return check_time_name;
	}
	public void setCheck_time_name(String check_time_name) {
		this.check_time_name = check_time_name;
	}
	public String getEdit() {
		return edit;
	}
	public void setEdit(String edit) {
		this.edit = edit;
	}
	public String getIs_delete() {
		return is_delete;
	}
	public void setIs_delete(String is_delete) {
		this.is_delete = is_delete;
	}
	public String getCheck_teacher_id() {
		return check_teacher_id;
	}
	public void setCheck_teacher_id(String check_teacher_id) {
		this.check_teacher_id = check_teacher_id;
	}
	public String getAsk_answer() {
		return ask_answer;
	}
	public void setAsk_answer(String ask_answer) {
		this.ask_answer = ask_answer;
	}
	public String getAsk_type() {
		return ask_type;
	}
	public void setAsk_type(String ask_type) {
		this.ask_type = ask_type;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getIs_anonymous() {
		return is_anonymous;
	}
	public void setIs_anonymous(String is_anonymous) {
		this.is_anonymous = is_anonymous;
	}
	public String getIs_repeatsubmit() {
		return is_repeatsubmit;
	}
	public void setIs_repeatsubmit(String is_repeatsubmit) {
		this.is_repeatsubmit = is_repeatsubmit;
	}
	public String getIs_showresult() {
		return is_showresult;
	}
	public void setIs_showresult(String is_showresult) {
		this.is_showresult = is_showresult;
	}
	public String getIs_singlesubmit() {
		return is_singlesubmit;
	}
	public void setIs_singlesubmit(String is_singlesubmit) {
		this.is_singlesubmit = is_singlesubmit;
	}
	public String getTargetman_type() {
		return targetman_type;
	}
	public void setTargetman_type(String targetman_type) {
		this.targetman_type = targetman_type;
	}
	public String getIs_check() {
		return is_check;
	}
	public void setIs_check(String is_check) {
		this.is_check = is_check;
	}
	public Set<AskTeacherCheck> getAskTeacherChecks() {
		return askTeacherChecks;
	}
	public void setAskTeacherChecks(Set<AskTeacherCheck> askTeacherChecks) {
		this.askTeacherChecks = askTeacherChecks;
	}
	public Set<AskStudentCheck> getAskStudentChecks() {
		return askStudentChecks;
	}
	public void setAskStudentChecks(Set<AskStudentCheck> askStudentChecks) {
		this.askStudentChecks = askStudentChecks;
	}
	public Set<AskItems> getAskItems() {
		return askItems;
	}
	public void setAskItems(Set<AskItems> askItems) {
		this.askItems = askItems;
	}
	
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public Date getCheck_time_name_format() {
		return check_time_name_format;
	}
	public void setCheck_time_name_format(Date check_time_name_format) {
		this.check_time_name_format = check_time_name_format;
	}
	@Override
	public String toString() {
		return "Ask [id=" + id + ", title=" + title + ", push_range=" + push_range + ", push_object=" + push_object
				+ ", create_teacher_name=" + create_teacher_name + ", create_time_name=" + create_time_name
				+ ", check_teacher_name=" + check_teacher_name + ", check_time_name=" + check_time_name + ", edit="
				+ edit + ", is_delete=" + is_delete + ", check_teacher_id=" + check_teacher_id + "]";
	}

}
