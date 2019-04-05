package com.hrbhd.bady.dao;

import java.util.List;

import com.hrbhd.bady.dao.base.IBaseDao;
import com.hrbhd.bady.domain.Role;

public interface IRoleDao extends IBaseDao<Role>{

	public List findByName(String name);

}
