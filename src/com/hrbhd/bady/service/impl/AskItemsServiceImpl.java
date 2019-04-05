package com.hrbhd.bady.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hrbhd.bady.dao.IAskItemsDao;
import com.hrbhd.bady.domain.AskItems;
import com.hrbhd.bady.service.IAskItemsService;

@Service
@Transactional
public class AskItemsServiceImpl implements IAskItemsService{

	@Autowired
	private IAskItemsDao askItemsDao;

	@Override
	public AskItems findById(String askItemsId) {
		return askItemsDao.findById(askItemsId);
	}
}
