package com.hrbhd.bady.service.impl;

import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hrbhd.bady.dao.IStructureDao;
import com.hrbhd.bady.domain.Structure;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.service.IStructureService;
import com.hrbhd.bady.util.JsonUtil;

@Service
@Transactional
public class StructureServiceImpl implements IStructureService{

	@Autowired
	private IStructureDao structureDao;

	@Override
	public List<Structure> findAll() {
		return structureDao.findAll();
	}

	@Override
	public void editStructure(Structure model) {
		
		String id = model.getId();
		String name = model.getName();
		Structure structure = structureDao.findById(id);
		
		structure.setName(name);
	}

	@Override
	public void addStructure(Structure model) {

		int maxId = structureDao.getMaxId();
		model.setId(maxId+1+"");
		model.setIid(new Integer(maxId+1));
		model.setParent_str(",1,2,");
		structureDao.save(model);
		
	}

	@Override
	public List<Structure> findByParentId(String parent_id) {
		return structureDao.findByParentId(parent_id);
	}

	@Override
	public void delete(Structure model) {
		
		structureDao.delete(model);
	}

	@Override
	public List<Structure> findByName(String name) {
		return structureDao.findByName(name);
	}

	@Override
	public Structure findById(String id) {
		return structureDao.findById(id);
	}

	@Override
	public Structure findByPId(String id) {
		return structureDao.findByPId(id);
	}

	@Override
	public void deleteStructure(Structure model) throws IOException {
		String json = "";

		String id = model.getId();
		Structure structure = structureDao.findById(id);
		Set<Teacher> teachers = structure.getTeachers();
		//String parent_id = model.getParent_id();
		//List<Structure> list = structureService.findByParentId(parent_id);

		if (teachers != null&&teachers.size()>0) {
			json = "{\"status\": 0,\"info\": \"部门下还有教职工，请先到“教职工管理”转移教职工。\"}";
		} else {
			List<Structure> list = structureDao.findByParentId(id);
			for (Structure structure1 : list) {
				structureDao.delete(structure1);
			}
			structureDao.delete(structure);
			json = "{\"status\": true, \"info\": \"删除成功\"}";
		}

		JsonUtil.writeJson(json);
	}
}
