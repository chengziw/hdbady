package com.hrbhd.bady.dao;

import java.util.List;

import com.hrbhd.bady.dao.base.IBaseDao;
import com.hrbhd.bady.domain.TeacherVacation;

public interface ITeacherVacationDao extends IBaseDao<TeacherVacation> {

	public List<TeacherVacation> findByTeacherId(String id);

}
