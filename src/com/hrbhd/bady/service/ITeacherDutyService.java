package com.hrbhd.bady.service;

import java.io.IOException;
import java.util.List;

import com.hrbhd.bady.domain.TeacherDuty;
import com.hrbhd.bady.util.PageBean;

public interface ITeacherDutyService {

	public TeacherDuty findById(String id);

	public void pageQuery(PageBean pageBean);

	public void save(TeacherDuty model);

	public List<TeacherDuty> findByDutyName(String duty_name);

	public void addTeacherDuty(TeacherDuty model);

	public void editTeacherDuty(TeacherDuty model);

	public void changeStatus(TeacherDuty model) throws IOException;

	public List<TeacherDuty> findAllTeacherDuty();

}
