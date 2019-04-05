package com.hrbhd.bady.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hrbhd.bady.dao.IPageDao;
import com.hrbhd.bady.service.IPageService;

@Service
@Transactional
public class PageServiceImpl implements IPageService{

	@Autowired
	private IPageDao pageDao;
}
