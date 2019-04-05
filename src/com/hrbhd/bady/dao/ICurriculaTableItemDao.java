package com.hrbhd.bady.dao;

import java.util.List;

import com.hrbhd.bady.dao.base.IBaseDao;
import com.hrbhd.bady.domain.CurriculaTableItem;

public interface ICurriculaTableItemDao extends IBaseDao<CurriculaTableItem>{

	public List<CurriculaTableItem> findByWCT(CurriculaTableItem curriculaTableItem);

	public List<CurriculaTableItem> findByTeacherId(String id);

	public List<CurriculaTableItem> findByCurriculaTableId(String id);

}
