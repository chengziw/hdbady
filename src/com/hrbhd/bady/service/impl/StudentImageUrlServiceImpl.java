package com.hrbhd.bady.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hrbhd.bady.dao.IStudentImageUrlDao;
import com.hrbhd.bady.service.IStudentImageUrlService;

@Service
@Transactional
public class StudentImageUrlServiceImpl implements IStudentImageUrlService{

	@Autowired
	private IStudentImageUrlDao studentImageUrlDao;
}
