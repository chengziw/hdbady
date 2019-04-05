package com.hrbhd.bady.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hrbhd.bady.dao.ICurriculaTableItemDao;
import com.hrbhd.bady.domain.CurriculaTable;
import com.hrbhd.bady.domain.CurriculaTableItem;
import com.hrbhd.bady.service.ICurriculaTableItemService;

@Service
@Transactional
public class CurriculaTableItemServiceImpl implements ICurriculaTableItemService{

	@Autowired
	private ICurriculaTableItemDao curriculaTableItemDao;

	@Override
	public List<CurriculaTableItem> findAll() {
		return curriculaTableItemDao.findAll();
	}

	@Override
	public List<CurriculaTableItem> findByTeacherId(String id) {
		return curriculaTableItemDao.findByTeacherId(id);
	}

	@Override
	public List<CurriculaTableItem> findByCurriculaTableId(String id) {
		return curriculaTableItemDao.findByCurriculaTableId(id);
	}

}
