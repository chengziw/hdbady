package com.hrbhd.bady.service;

import java.util.List;

import com.hrbhd.bady.domain.CurriculaTable;
import com.hrbhd.bady.domain.CurriculaTableItem;

public interface ICurriculaTableItemService {

	public List<CurriculaTableItem> findAll();

	public List<CurriculaTableItem> findByTeacherId(String id);

	public List<CurriculaTableItem> findByCurriculaTableId(String id);

}
