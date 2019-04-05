package com.hrbhd.bady.dao;

import java.util.List;

import com.hrbhd.bady.dao.base.IBaseDao;
import com.hrbhd.bady.domain.StudentBespeakDesc;

public interface IStudentBespeakDescDao extends IBaseDao<StudentBespeakDesc>{

	public List<StudentBespeakDesc> findByBespeakId(String id);

}
