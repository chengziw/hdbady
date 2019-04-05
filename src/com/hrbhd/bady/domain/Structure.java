package com.hrbhd.bady.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.aspectj.weaver.AjAttribute.PrivilegedAttribute;

public class Structure implements Serializable{

	private String id;
	private Integer iid;
	
	private String name;
	private String parent_id;
	private String parent_str;
	
	private List<Structure> children;
	private Set<Teacher> teachers = new HashSet<Teacher>();

	public Structure() {
		super();
	}

	public Structure(String id, String name, String parent_id, String parent_str) {
		super();
		this.id = id;
		this.name = name;
		this.parent_id = parent_id;
		this.parent_str = parent_str;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public Integer getIid() {
		return iid;
	}
	
	public void setIid(Integer iid) {
		this.iid = iid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getParent_id() {
		return parent_id;
	}

	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}

	public String getParent_str() {
		return parent_str;
	}

	public void setParent_str(String parent_str) {
		this.parent_str = parent_str;
	}

	public List<Structure> getChildren() {
		return children;
	}

	public void setChildren(List<Structure> children) {
		this.children = children;
	}

	public Set<Teacher> getTeachers() {
		return teachers;
	}

	public void setTeachers(Set<Teacher> teachers) {
		this.teachers = teachers;
	}

	@Override
	public String toString() {
		return "Structure [id=" + id + ", name=" + name + ", parent_id=" + parent_id + ", parent_str=" + parent_str
				+ ", menus=" + children + "]";
	}
	
}
