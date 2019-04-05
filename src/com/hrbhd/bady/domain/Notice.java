package com.hrbhd.bady.domain;
import java.io.Serializable;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

public class Notice implements Serializable{
	
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
	
	private String check_teacher_id;
	private String descs;
	private Set<NoticeTeacherCheck> noticeTeacherChecks = new HashSet<NoticeTeacherCheck>(); 
	/*private Set<Student> students = new HashSet<Student>();
	private Set<Teacher> teachers = new HashSet<Teacher>();*/
	private Set<NoticeStudentCheck> noticeStudentChecks = new HashSet<NoticeStudentCheck>();
	private String notice_type;
	private String is_check;
	
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
	public String getDescs() {
		return descs;
	}
	public void setDescs(String descs) {
		this.descs = descs;
	}
	public Set<NoticeStudentCheck> getNoticeStudentChecks() {
		return noticeStudentChecks;
	}
	public void setNoticeStudentChecks(Set<NoticeStudentCheck> noticeStudentChecks) {
		this.noticeStudentChecks = noticeStudentChecks;
	}
	public Set<NoticeTeacherCheck> getNoticeTeacherChecks() {
		return noticeTeacherChecks;
	}
	public void setNoticeTeacherChecks(Set<NoticeTeacherCheck> noticeTeacherChecks) {
		this.noticeTeacherChecks = noticeTeacherChecks;
	}
	public String getNotice_type() {
		return notice_type;
	}
	public void setNotice_type(String notice_type) {
		this.notice_type = notice_type;
	}
	public String getIs_check() {
		return is_check;
	}
	public void setIs_check(String is_check) {
		this.is_check = is_check;
	}
	public Date getCheck_time_name_format() {
		return check_time_name_format;
	}
	public void setCheck_time_name_format(Date check_time_name_format) {
		this.check_time_name_format = check_time_name_format;
	}
	
	@Override
	public String toString() {
		return "Notice [id=" + id + ", title=" + title + ", push_range=" + push_range + ", push_object=" + push_object
				+ ", create_teacher_name=" + create_teacher_name + ", create_time_name=" + create_time_name
				+ ", check_teacher_name=" + check_teacher_name + ", check_time_name=" + check_time_name + ", edit="
				+ edit + ", is_delete=" + is_delete + ", check_teacher_id=" + check_teacher_id + ", descs=" + descs
				+ "]";
	}
	
}
