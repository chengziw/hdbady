package com.hrbhd.bady.service.impl;

import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.aspectj.weaver.AjAttribute.PrivilegedAttribute;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hrbhd.bady.dao.IGradeDao;
import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.service.IGradeService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.PageBean;

@Service
@Transactional
public class GradeServiceImpl implements IGradeService {

	@Autowired
	private IGradeDao gradeDao;

	@Override
	public void changeStatus(Grade model) throws IOException {

		String json = "";
		String id = model.getId();
		Grade grade = gradeDao.findById(id);
		
		String status = grade.getStatus();
		if ("1".equals(status)) {
			Set<Classes> classes = grade.getClasses();
			if(classes!=null&&classes.size()>0){
				json = "{\"status\":0,\"info\":\"该年级尚有在校班级未毕业，不能停用\"}";
			}else{
				grade.setStatus("2");
				grade.setStatusLabel("已停用");
				json = "{\"status\":1}";
			}
		} else if ("2".equals(status)) {
			grade.setStatus("1");
			grade.setStatusLabel("正常");
			json = "{\"status\":1}";
		}
		JsonUtil.writeJson(json);
	}

	@Override
	public void editGrade(Grade model) {
		String id = model.getId();
		String name = model.getName();
		Grade grade = gradeDao.findById(id);
		grade.setName(name);

	}

	@Override
	public Grade findById(String id) {
		return gradeDao.findById(id);
	}

	@Override
	public void save(Grade model) {
		gradeDao.save(model);
	}

	@Override
	public void addGrade(Grade model) {
		model.getName();
		model.setStatus("1");
		model.setStatusLabel("正常");
		model.setSort_name("1");
		gradeDao.save(model);
	}

	@Override
	public List<Grade> findByName(String name) {
		return gradeDao.findByName(name);
	}

	@Override
	public List<Grade> findAll() {
		return gradeDao.findAll();
	}

	@Override
	public void termQuery(Grade model, PageBean pageBean, DetachedCriteria detachedCriteria) {
		
		detachedCriteria = pageBean.getDetachedCriteria();
		detachedCriteria.setProjection(null);
		
		String status = model.getStatus();
		
		if (StringUtils.isNotBlank(status)) {
			if (!"全部状态".equals(status)&&!"".equals(status)) {
				detachedCriteria.add(Restrictions.eq("status", status));
			}
		}
	}

	@Override
	public List<Grade> findAllGradesByStatus() {
		return gradeDao.findAllGradesByStatus();
	}
}
