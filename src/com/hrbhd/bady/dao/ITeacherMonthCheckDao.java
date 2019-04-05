package com.hrbhd.bady.dao;

import java.util.List;

import com.hrbhd.bady.dao.base.IBaseDao;
import com.hrbhd.bady.domain.TeacherMonthCheck;

public interface ITeacherMonthCheckDao extends IBaseDao<TeacherMonthCheck>{

	public List<TeacherMonthCheck> findByMonthAndYear(String year_label, String month_label);

}
