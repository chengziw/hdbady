package com.hrbhd.bady.service;

import java.util.List;

import com.hrbhd.bady.domain.StudentBespeak;
import com.hrbhd.bady.domain.StudentBespeakDesc;
import com.hrbhd.bady.util.PageBean;

public interface IStudentBespeakDescService {

	public void save(StudentBespeakDesc model);

	public void addDesc(StudentBespeakDesc model);

	public void pageQuery(PageBean pageBean);

	public List<StudentBespeakDesc> findByBespeakId(String id);

}
