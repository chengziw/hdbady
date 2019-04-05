package com.hrbhd.bady.dao;

import java.util.List;

import com.hrbhd.bady.dao.base.IBaseDao;
import com.hrbhd.bady.domain.StudentVacation;

public interface IStudentVacationDao extends IBaseDao<StudentVacation>{

	public List<StudentVacation> findByStudentId(String student_id);

	public List<StudentVacation> findByStudentIdAndStatus(String student_id);

}
