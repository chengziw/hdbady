package com.hrbhd.bady.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.hrbhd.bady.domain.StudentBespeak;
import com.hrbhd.bady.domain.StudentBespeakDesc;
import com.hrbhd.bady.util.PageBean;

public interface IStudentBespeakService {

	public void pageQuery(PageBean pageBean);

	public void addBespeakStudent(StudentBespeak model) throws IOException ;

	public StudentBespeak findById(String id);

	public void updata(StudentBespeak model);

	public void checkBespeakStudent(StudentBespeak model) throws IOException ;

	public void saveOrUpdate(StudentBespeak model);

	public List<StudentBespeakDesc> descPageQuery(StudentBespeak model);

	public void editBespeakStudent(StudentBespeak model) throws IOException ;

	public void termQuery(StudentBespeak model, PageBean pageBean, DetachedCriteria detachedCriteria) throws UnsupportedEncodingException;

	public void paddBespeakStudent(StudentBespeak model) throws IOException;

}
