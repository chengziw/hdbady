package com.hrbhd.bady.service.impl;

import java.io.IOException;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.DailyRollingFileAppender;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hrbhd.bady.dao.IGradeDao;
import com.hrbhd.bady.dao.ISubjectDao;
import com.hrbhd.bady.dao.ITeacherDao;
import com.hrbhd.bady.domain.ClassType;
import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.Subject;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.service.ISubjectService;
import com.hrbhd.bady.service.ITeacherService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.PageBean;

import freemarker.core.ReturnInstruction.Return;

@Service
@Transactional
public class SubjectServiceImpl implements ISubjectService{

	@Autowired
	private ISubjectDao subjectDao;
	@Autowired
	private IGradeDao gradeDao;
	@Autowired
	private ITeacherDao teacherDao;

	@Override
	public void pageQuery(PageBean pageBean) {
		subjectDao.pageQuery(pageBean);
	}

	@Override
	public Subject findById(String id) {
		return subjectDao.findById(id);
	}

	@Override
	public void save(Subject model) {
		subjectDao.save(model);
	}

	@Override
	public void addSubject(Subject model, String[] grade_id) {
		
		//StringBuffer buffer = null;
		/*if (grade_id != null) {
			buffer = new StringBuffer();
			for(int i=0;i<grade_id.length;i++){
				System.out.println(grade_id[i]);
				if(i==grade_id.length-1){
					buffer.append(grade_id[i]);
					continue;
				}
				buffer.append(grade_id[i]+",");
			}
		}*/
		/*Set<Grade> grades = model.getGrades();
		if (grade_id != null) {
			for (String id : grade_id) {
				Grade grade = gradeDao.findById(id);
				Set<Subject> subjects = grade.getSubjects();
				subjects.add(model);
				
				grades.add(grade);
			}
		}*/
		model.setStatus("1");
		model.setStatus_name("正常");
		model.setName(model.getName());
		//model.setGrade_name(buffer.toString());
		subjectDao.save(model);
		
	}

	@Override
	public void editSubject(Subject model, String[] grade_id) {
		
		String id = model.getId();
		Subject subject = subjectDao.findById(id);
		
		/*StringBuffer buffer = null;
		if (grade_id != null) {
			buffer = new StringBuffer();
			for(int i=0;i<grade_id.length;i++){
				System.out.println(grade_id[i]);
				if(i==grade_id.length-1){
					buffer.append(grade_id[i]);
					continue;
				}
				buffer.append(grade_id[i]+",");
			}
		}*/
		
		subject.setName(model.getName());
		//subject.setGrade_name(buffer.toString());
		
	}

	@Override
	public void changeStatus(Subject model) throws IOException {

		String id = model.getId();
		Subject subject = subjectDao.findById(id);
		
		String status = subject.getStatus();
		if ("1".equals(status)) {
			subject.setStatus("2");
			subject.setStatus_name("已停开");
		} else if ("2".equals(status)) {
			subject.setStatus("1");
			subject.setStatus_name("正常");
		}
		String json = "{\"status\":1}";
		JsonUtil.writeJson(json);
	}

	@Override
	public List<Subject> findByName(String name) {
		return subjectDao.findByName(name);
	}

	@Override
	public List<Subject> findAll() {
		return subjectDao.findAll();
	}
	
	public String findAllSubjectToCurriculaTableAdd(){

		String json="";
		List<Subject> list = subjectDao.findByStatus();
		if (list.size() > 0) {
			StringBuffer buffer = new StringBuffer();
			buffer.append("[{\"id\":\"\",\"name\":\"请选择科目\"},");
			// buffer.append("[");
			for (int i = 0; i < list.size(); i++) {
				buffer.append("{\"id\":\"" + list.get(i).getName() + "\",\"name\":\"" + list.get(i).getName() + "\"},");
				if (i == list.size() - 1) {
					buffer.append(
							"{\"id\":\"" + list.get(i).getName() + "\",\"name\":\"" + list.get(i).getName() + "\"}");
				}
			}

			buffer.append("]");
			json = buffer.toString();
		}

		return json;
	}

	@Override
	public void termQuery(Subject model, PageBean pageBean, DetachedCriteria detachedCriteria) {

		detachedCriteria = pageBean.getDetachedCriteria();
		detachedCriteria.setProjection(null);

		String status = model.getStatus();
//		String grade_name = model.getGrade_name();
		
		//status_name = new String(status_name.getBytes("iso8859-1"), "utf-8");
		//name = new String(name.getBytes("iso8859-1"), "utf-8");

				/*.createAlias("kittens", "kt")
				.createAlias("mate", "mt")
				.add( Restrictions.eqProperty("kt.name", "mt.name") )
				.list();*/ 
		
		//detachedCriteria.createAlias("grades", "g");
		//detachedCriteria.createAlias("grade", alias);
		
//		if (StringUtils.isNotBlank(grade_name)) {
//			if (!"".equals(grade_name)) {
//				detachedCriteria.add(Restrictions.eq("status_name", grade_name));
//				detachedCriteria.add(Restrictions.eqProperty("g.id", grade_name));
//			}
//
//		}
		if (StringUtils.isNotBlank(status)) {
			if (!"0".equals(status)) {
				detachedCriteria.add(Restrictions.eq("status", status));
			}

		}
		
	}

	@Override
	public List<Subject> findByStatus() {
		return subjectDao.findByStatus();
	}

	@Override
	public Classes getClasses(Teacher teacher) {
		
		String id = teacher.getId();
		teacher = teacherDao.findById(id);
		Classes classes = teacher.getClasses();
		
		return classes;
	}
}
