package com.hrbhd.bady.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class CurriculaTable implements Serializable {

	private String id;

	private String grade_id;
	private String class_id;
	private String table_year;

	private String valid_time;
	private String sort_label;
	private String publish_time_label;

	private String edit;
	private String isCurrentTerm;
	private String sort;
	
	private String dayNum;
	private String morning_has_num;
	private String afternoon_has_num;

	private String start_end_time;
	private String term_type_label;
	private Set<CurriculaTableItem> curriculaTableItems = new HashSet<CurriculaTableItem>();
	
	private Classes classes;
	private String week_type_label;

	// isCurrentTerm 也是和当前扯在一起的
	// sort //标记是否发布
	// term_type_label 有了它加上了个当前,暂时不明白啥意思
	
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

	public String getClass_id() {
		return class_id;
	}

	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}

	public String getTable_year() {
		return table_year;
	}

	public void setTable_year(String table_year) {
		this.table_year = table_year;
	}

	public String getValid_time() {
		return valid_time;
	}

	public void setValid_time(String valid_time) {
		this.valid_time = valid_time;
	}

	public String getSort_label() {
		return sort_label;
	}

	public void setSort_label(String sort_label) {
		this.sort_label = sort_label;
	}

	public String getPublish_time_label() {
		return publish_time_label;
	}

	public void setPublish_time_label(String publish_time_label) {
		this.publish_time_label = publish_time_label;
	}

	public String getEdit() {
		return edit;
	}

	public void setEdit(String edit) {
		this.edit = edit;
	}

	public String getIsCurrentTerm() {
		return isCurrentTerm;
	}

	public void setIsCurrentTerm(String isCurrentTerm) {
		this.isCurrentTerm = isCurrentTerm;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getDayNum() {
		return dayNum;
	}

	public void setDayNum(String dayNum) {
		this.dayNum = dayNum;
	}

	public String getMorning_has_num() {
		return morning_has_num;
	}

	public void setMorning_has_num(String morning_has_num) {
		this.morning_has_num = morning_has_num;
	}

	public String getAfternoon_has_num() {
		return afternoon_has_num;
	}

	public void setAfternoon_has_num(String afternoon_has_num) {
		this.afternoon_has_num = afternoon_has_num;
	}

	public String getStart_end_time() {
		return start_end_time;
	}

	public void setStart_end_time(String start_end_time) {
		this.start_end_time = start_end_time;
	}

	public String getTerm_type_label() {
		return term_type_label;
	}

	public void setTerm_type_label(String term_type_label) {
		this.term_type_label = term_type_label;
	}

	public Set<CurriculaTableItem> getCurriculaTableItems() {
		return curriculaTableItems;
	}

	public void setCurriculaTableItems(Set<CurriculaTableItem> curriculaTableItems) {
		this.curriculaTableItems = curriculaTableItems;
	}

	public Classes getClasses() {
		return classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
	}

	public String getWeek_type_label() {
		return week_type_label;
	}

	public void setWeek_type_label(String week_type_label) {
		this.week_type_label = week_type_label;
	}
	

}
