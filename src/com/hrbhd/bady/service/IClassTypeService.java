package com.hrbhd.bady.service;

import java.io.IOException;
import java.util.List;

import com.hrbhd.bady.domain.ClassType;
import com.hrbhd.bady.domain.TeacherDuty;

public interface IClassTypeService{

	public ClassType findById(String id);

	public void editClassType(ClassType model);

	public List <ClassType> findByTypeName(String type_name);

	public void addClassType(ClassType model);

	public void changeStatus(ClassType model) throws IOException;

	public List<ClassType> findAll();

	public List<ClassType> findByStatus();

}
