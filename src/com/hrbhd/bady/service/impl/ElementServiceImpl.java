package com.hrbhd.bady.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hrbhd.bady.dao.IElementDao;
import com.hrbhd.bady.domain.Element;
import com.hrbhd.bady.service.IElementService;

@Service
@Transactional
public class ElementServiceImpl implements IElementService{

	@Autowired
	private IElementDao elementDao;

	@Override
	public List<Element> findAll() {
		return elementDao.findAll();
	}
}
