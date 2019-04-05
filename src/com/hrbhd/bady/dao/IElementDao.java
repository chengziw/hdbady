package com.hrbhd.bady.dao;

import com.hrbhd.bady.dao.base.IBaseDao;
import com.hrbhd.bady.domain.Element;

public interface IElementDao extends IBaseDao<Element>{

	public Element findByCode(String code);

}
