package com.hrbhd.bady.dao;

import java.util.List;

import com.hrbhd.bady.dao.base.IBaseDao;
import com.hrbhd.bady.domain.Structure;

public interface IStructureDao extends IBaseDao<Structure>{

	public List<Structure> findByParentId(String parent_id);

	public List<Structure> findByName(String name);

	public Structure findByPId(String id);

	public Integer getMaxId();

}
