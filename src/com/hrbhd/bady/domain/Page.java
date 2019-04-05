package com.hrbhd.bady.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Page implements Serializable{

	private String id;
	
	private String name;
	private String code;
	private Set<Role> roles = new HashSet<Role>();
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	public Set<Role> getRoles() {
		return roles;
	}
	@Override
	public String toString() {
		return "Element [id=" + id + ", name=" + name + ", code=" + code + ", roles=" + roles + "]";
	}
	
}
