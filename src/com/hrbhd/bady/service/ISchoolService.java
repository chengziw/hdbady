package com.hrbhd.bady.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import org.apache.xmlbeans.impl.xb.xsdschema.impl.PublicImpl;

import com.hrbhd.bady.domain.School;
import com.hrbhd.bady.exception.DeletePictureException;
import com.hrbhd.bady.util.PageBean;

public interface ISchoolService {

	public void pageQuery(PageBean pageBean);

	public School findById(String id);

	public List<School> findAll();

	public void deletePicture(School school,String index) throws DeletePictureException, IOException;

	public void importPicture(File[] img_file, String type) throws FileNotFoundException, IOException;

	public void editSchool(School model) throws IOException;

	public void save(School model);

}
