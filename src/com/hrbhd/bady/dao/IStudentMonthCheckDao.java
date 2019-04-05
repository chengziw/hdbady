package com.hrbhd.bady.dao;

import java.util.List;

import com.hrbhd.bady.dao.base.IBaseDao;
import com.hrbhd.bady.domain.StudentCheck;
import com.hrbhd.bady.domain.StudentMonthCheck;

public interface IStudentMonthCheckDao extends IBaseDao<StudentMonthCheck>{

	public List<StudentMonthCheck> findByMonthAndYear(String year_label, String month_label);

}
