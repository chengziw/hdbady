package com.hrbhd.bady.dao;

import java.util.List;

import com.hrbhd.bady.dao.base.IBaseDao;
import com.hrbhd.bady.domain.Grade;

public interface IGradeDao extends IBaseDao<Grade>{

	public List<Grade> findByName(String name);

	public List<Grade> findAllGrades();

	public List<Grade> findAllGradesByStatus();

}
