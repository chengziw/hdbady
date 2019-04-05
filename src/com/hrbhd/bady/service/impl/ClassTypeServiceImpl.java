package com.hrbhd.bady.service.impl;

import java.io.IOException;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hrbhd.bady.dao.IClassTypeDao;
import com.hrbhd.bady.domain.ClassType;
import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.TeacherDuty;
import com.hrbhd.bady.service.IClassTypeService;
import com.hrbhd.bady.service.IClassesService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.PageBean;

@Service
@Transactional
public class ClassTypeServiceImpl implements IClassTypeService {

	@Autowired
	private IClassTypeDao classTypeDao;

	@Override
	public ClassType findById(String id) {
		return classTypeDao.findById(id);
	}

	@Override
	public void editClassType(ClassType model) {
		String id = model.getId();

		String type_name = model.getType_name();
		ClassType classType = classTypeDao.findById(id);
		classType.setType_name(type_name);
	}

	@Override
	public List<ClassType> findByTypeName(String type_name) {
		return classTypeDao.findByTypeName(type_name);
	}

	@Override
	public void addClassType(ClassType model) {
		model.getType_name();
		model.setStatus("1");
		model.setStatus_name("正常");
		classTypeDao.save(model);
	}

	@Override
	public void changeStatus(ClassType model) throws IOException {
		String json = "";
		String id = model.getId();
		ClassType classType = classTypeDao.findById(id);

		String status = classType.getStatus();
		if ("1".equals(status)) {
			Set<Classes> classes = classType.getClasses();
			if (classes != null && classes.size() > 0) {
				json = "{\"status\":0,\"info\":\"该班级类型尚有在校班级未毕业，不能停用！\"}";
			} else {
				classType.setStatus("2");
				classType.setStatus_name("已停用");
				json = "{\"status\":1}";
			}
		} else if ("2".equals(status)) {
			classType.setStatus("1");
			classType.setStatus_name("正常");
			json = "{\"status\":1}";
		}
		JsonUtil.writeJson(json);

	}

	@Override
	public List<ClassType> findAll() {
		return classTypeDao.findAll();
	}

	@Override
	public List<ClassType> findByStatus(){
		return classTypeDao.findByStatus();
	}
}
