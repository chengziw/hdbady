package com.hrbhd.bady.dao;

import java.util.List;

import com.hrbhd.bady.dao.base.IBaseDao;
import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.Grade;

public interface IClassesDao extends IBaseDao<Classes>{

	public List<Classes> findClassByClassName(String class_name);

	public List<Classes> findAllClass();

	public List<Classes> findClassByClassNameAndGrade(String class_name, String grade_id);

	public List<Classes> findAllClassByGrade(Grade grade);

	public List<Classes> findByGrade(Grade grade);

	public Classes findClassesByTeacherId(String id);
      
}
