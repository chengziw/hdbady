package com.hrbhd.bady.dao;

import java.util.List;

import com.hrbhd.bady.dao.base.IBaseDao;
import com.hrbhd.bady.domain.TeacherDuty;

public interface ITeacherDutyDao extends IBaseDao<TeacherDuty>{

	public List<TeacherDuty> findByDutyName(String duty_name);

	public List<TeacherDuty> findAllTeacherDuty();

}
