package com.hrbhd.bady.dao;

import java.util.List;

import com.hrbhd.bady.dao.base.IBaseDao;
import com.hrbhd.bady.domain.ClassType;

public interface IClassTypeDao extends IBaseDao<ClassType>{

	public List <ClassType> findByTypeName(String type_name);

	public List<ClassType> findByStatus();

}
