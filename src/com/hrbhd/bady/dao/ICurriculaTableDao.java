package com.hrbhd.bady.dao;

import com.hrbhd.bady.dao.base.IBaseDao;
import com.hrbhd.bady.domain.CurriculaTable;

public interface ICurriculaTableDao extends IBaseDao<CurriculaTable>{

	public CurriculaTable findByClassId(String cid);

}
