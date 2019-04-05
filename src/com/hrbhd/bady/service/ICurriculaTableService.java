package com.hrbhd.bady.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.CurriculaTable;
import com.hrbhd.bady.domain.CurriculaTableItem;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.util.PageBean;

public interface ICurriculaTableService {

	public void pageQuery(PageBean pageBean);

	public CurriculaTable findById(String id);

	public void editCurriculaTable(CurriculaTable model, String[] ids, String[] subject_names,
			String[] teacher_ids, String[] teacher_names) throws IOException;

	public List<CurriculaTableItem> getCurriculaTableItems(CurriculaTable model);

	public void deleteCurriculaTable(CurriculaTable model) throws IOException;

	public void publishCurriculaTable(CurriculaTable model) throws IOException;

	public void addCurriculaTable(CurriculaTable model, String[] weeks, String[] courses, String[] subject_names,
			String[] teacher_ids, String[] teacher_names) throws IOException ;

	public void termQuery(CurriculaTable model, PageBean pageBean, DetachedCriteria detachedCriteria) throws UnsupportedEncodingException;

	public Classes getClasses(Teacher teacher);

	public CurriculaTable findByClassId(String cid);

	public Classes getClasses(Student student);

}
