package com.hrbhd.bady.dao;

import java.util.List;

import com.hrbhd.bady.dao.base.IBaseDao;
import com.hrbhd.bady.domain.Subject;

public interface ISubjectDao extends IBaseDao<Subject>{

	public List<Subject> findByName(String name);

	public List<Subject> findByStatus();

}
