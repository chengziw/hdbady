package com.hrbhd.bady.service;

import java.io.IOException;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.util.PageBean;

public interface IGradeService {

	public void changeStatus(Grade model) throws IOException;

	public void editGrade(Grade model);

	public Grade findById(String id);

	public void save(Grade model);

	public void addGrade(Grade model);

	public List<Grade> findByName(String name);

	public List<Grade> findAll();

	public void termQuery(Grade model, PageBean pageBean, DetachedCriteria detachedCriteria);

	public List<Grade> findAllGradesByStatus();

}
