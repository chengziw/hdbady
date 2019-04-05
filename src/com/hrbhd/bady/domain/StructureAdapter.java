package com.hrbhd.bady.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.aspectj.weaver.AjAttribute.PrivilegedAttribute;

public class StructureAdapter implements Serializable{

	private String id;
	
	private String name;
	private String pid;
	
	private List<StructureAdapter> children;

	public StructureAdapter() {
		super();
	}

	public StructureAdapter(String id, String name, String pid) {
		super();
		this.id = id;
		this.name = name;
		this.pid = pid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<StructureAdapter> getChildren() {
		return children;
	}

	public void setChildren(List<StructureAdapter> children) {
		this.children = children;
	}

}
