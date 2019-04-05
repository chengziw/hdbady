package com.hrbhd.bady.service;

import java.io.IOException;
import java.util.List;

import com.hrbhd.bady.domain.Structure;

public interface IStructureService {

	public List<Structure> findAll();

	public void editStructure(Structure model);

	public void addStructure(Structure model);

	public List<Structure> findByParentId(String parent_id);

	public void delete(Structure model);

	public List<Structure> findByName(String name);

	public Structure findById(String id);

	public Structure findByPId(String id);

	public void deleteStructure(Structure model) throws IOException;

}
