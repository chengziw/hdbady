package com.hrbhd.bady.service.impl;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.aspectj.weaver.AjAttribute.PrivilegedAttribute;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hrbhd.bady.dao.IClassTypeDao;
import com.hrbhd.bady.dao.IClassesChangeLogDao;
import com.hrbhd.bady.dao.IClassesDao;
import com.hrbhd.bady.dao.IGradeDao;
import com.hrbhd.bady.dao.ISchoolDao;
import com.hrbhd.bady.dao.IStudentDao;
import com.hrbhd.bady.dao.ITeacherDao;
import com.hrbhd.bady.domain.ClassType;
import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.School;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.service.IClassesChangeLogService;
import com.hrbhd.bady.service.IClassesService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.PageBean;
import com.hrbhd.bady.util.TimeUtil;

@Service
@Transactional
public class ClassesServiceImpl implements IClassesService {

	@Autowired
	private IClassesDao classesDao;
	@Autowired
	private IStudentDao studentDao;
	@Autowired
	private IClassTypeDao classTypeDao;
	@Autowired
	private IGradeDao gradeDao;
	@Autowired
	private ISchoolDao schoolDao;
	@Autowired
	private ITeacherDao teacherDao;
	@Autowired
	private IClassesChangeLogService classesChangeLogService;

	@Override
	public void pageQuery(PageBean pageBean) {
		classesDao.pageQuery(pageBean);
	}

	@Override
	public Classes findById(String id) {
		return classesDao.findById(id);
	}

	@Override
	public List<Classes> findClassByClassName(String class_name) {
		return classesDao.findClassByClassName(class_name);
	}

	/*
	 * class_name 小班额 id 4544 teacher_id 23232 type_label 2
	 */
	@Override
	public void editClass(Classes model) throws IOException {

		String id = model.getId();
		String class_name = model.getClass_name();
		String type_label = model.getType_label();
		ClassType classType = classTypeDao.findById(type_label);
		String teacher_id = model.getTeacher_id();
		Teacher teacher = teacherDao.findById(teacher_id);
		teacher.setClass_id(id);
		
		Classes classes = classesDao.findById(id);
		classes.setClass_name(class_name);
		//classes.setType_label(type_label);
		//classes.setTeacher_id(teacher_id);
		classes.setTeacher(teacher);
		classes.setClassType(classType);
		String json = "{\"flag\":true}";
		JsonUtil.writeJson(json);

	}

	@Override
	public void deleteClass(Classes model, String CLASSES_DELETE) {
		String id = model.getId();
		Classes classes = classesDao.findById(id);
		classes.setNote(model.getNote());
		classesChangeLogService.addLog(classes, CLASSES_DELETE);
		classesDao.delete(classes);
	}

	@Override
	public void addClass(Classes model, String CLASSES_ADD) {
		
		List<School> list = schoolDao.findAll();
		if(list!=null&&list.size()>0){
			School school = list.get(0);
			int currentYear = TimeUtil.getCurrentYear();
			String up_month = school.getUp_month();
			String up_day = school.getUp_day();
			
			String next_upgrade_time = currentYear+"-"+up_month+"-"+up_day;
			model.setNext_upgrade_time(next_upgrade_time);
		}
		
		
		int start_label = TimeUtil.getCurrentYear();
		String create_time = TimeUtil.getCurrentDay();
		model.setStart_label(start_label+"");
		model.setEnd_label(start_label+3+"");
		model.setStatus("1");
		model.setStatus_label("正常在校");
		model.setCreate_time(create_time);
		model.setStart_label(TimeUtil.getCurrentYear()+"");

		String type_id = model.getType_id();
		String grade_id = model.getGrade_id();
		String teacher_id = model.getTeacher_id();
		ClassType classType = classTypeDao.findById(type_id);
		Grade grade = gradeDao.findById(grade_id);
		Teacher teacher = teacherDao.findById(teacher_id);
		teacher.setClasses(model);
		model.setGrade(grade);
		model.setClassType(classType);
		model.setTeacher(teacher);

		classesDao.save(model);
		//r如果将来出错了,就是这个
		teacher.setClasses(model);
		//classesChangeLogService.addLog(model, CLASSES_ADD);
	}

	@Override
	public List<Classes> findAllClass() {
		return classesDao.findAllClass();
	}

	@Override
	public List<Classes> findClassByClassNameAndGrade(String class_name, String grade_id) {
		return classesDao.findClassByClassNameAndGrade(class_name, grade_id);
	}

	@Override
	public List<Classes> findAllClassByGrade(Grade grade) {
		return classesDao.findAllClassByGrade(grade);
	}

	@Override
	public List<Classes> findAll() {
		return classesDao.findAll();
	}

	@Override
	public void setStudentNumbers(List<Classes> list) {

		if (list != null && list.size() > 0) {
			for (Classes classes : list) {
				/*
				 * String grade = classes.getGrade(); String class_name =
				 * classes.getClass_name(); List<Student> sList =
				 * studentDao.findStudentNumberByGrade_idAndClass_id(grade,
				 * class_name); String studentNumber = sList.size()+"";
				 * classes.setStudentNumber(studentNumber);
				 */
				Set<Student> students = classes.getStudents();
				String studentNumber = students.size() + "";
				classes.setStudentNumber(studentNumber);
			}
		}
	}

	@Override
	public List<Classes> findByGrade(Grade grade) {
		return classesDao.findByGrade(grade);
	}

	@Override
	public void termQuery(Classes model, PageBean pageBean, DetachedCriteria detachedCriteria) throws UnsupportedEncodingException {

		detachedCriteria = pageBean.getDetachedCriteria();
		detachedCriteria.setProjection(null);
		
		String grade_id = model.getGrade_id();
		String status_label = model.getStatus_label();
		String start_label = model.getStart_label();
		String type_label = model.getType_label();

		status_label = new String(status_label.getBytes("iso8859-1"), "utf-8");
		start_label = new String(start_label.getBytes("iso8859-1"), "utf-8");
		type_label = new String(type_label.getBytes("iso8859-1"), "utf-8");
		
		if (StringUtils.isNotBlank(grade_id)) {
			if (!"全部年级".equals(grade_id)&&!"".equals(grade_id)) {
				detachedCriteria.add(Restrictions.eq("grade.id", grade_id));
			}

		}
		if (StringUtils.isNotBlank(status_label)) {
			if (!"全部状态".equals(status_label)) {
				detachedCriteria.add(Restrictions.eq("status_label", status_label));
			}
		}
		if (StringUtils.isNotBlank(start_label)) {
			if (!"全部入学年份".equals(start_label)) {
				detachedCriteria.add(Restrictions.eq("start_label", start_label));

			}
		}
		if (StringUtils.isNotBlank(type_label)) {
			if (!"全部类型".equals(type_label)) {
				detachedCriteria.add(Restrictions.eq("classType.id", type_label));
			}
		}
		//Restrictions.or(lhs, rhs)
		//detachedCriteria.add(Restrictions.sqlRestriction(sql));
	}

	@Override
	public Classes findClassesByTeacherId(String id) {
		return classesDao.findClassesByTeacherId(id);
	}

	@Override
	public Teacher getTeacher(Classes classes) {
		//String id = classes.getId();
		Teacher teacher = classes.getTeacher();
		return teacher;
	}
}
