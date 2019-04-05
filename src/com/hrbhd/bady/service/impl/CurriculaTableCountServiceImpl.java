package com.hrbhd.bady.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hrbhd.bady.dao.ICurriculaTableCountDao;
import com.hrbhd.bady.service.ICurriculaTableCountService;

@Service
@Transactional
public class CurriculaTableCountServiceImpl implements ICurriculaTableCountService{

	@Autowired
	private ICurriculaTableCountDao curriculaTableCountDao;
}
