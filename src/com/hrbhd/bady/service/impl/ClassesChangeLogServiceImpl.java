package com.hrbhd.bady.service.impl;

import java.io.UnsupportedEncodingException;
import java.sql.Date;

import javax.jws.WebParam.Mode;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.hrbhd.bady.dao.IClassesChangeLogDao;
import com.hrbhd.bady.domain.ClassType;
import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.ClassesChangeLog;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.service.IClassesChangeLogService;
import com.hrbhd.bady.util.PageBean;
import com.hrbhd.bady.util.TimeUtil;

@Service
@Transactional
public class ClassesChangeLogServiceImpl implements IClassesChangeLogService {

	@Autowired
	private IClassesChangeLogDao classesChangeLogDao;

	@Override
	public void pageQuery(PageBean pageBean) {
		classesChangeLogDao.pageQuery(pageBean);
	}

	@Override
	public void addLog(Classes classes, String state) {

		ClassesChangeLog classesChangeLog = new ClassesChangeLog();
		// classesChangeLog.setClasses(classes);
		classesChangeLog.setClass_name(classes.getClass_name());
		Grade grade = classes.getGrade();
		if (grade != null) {
			classesChangeLog.setGrade_name(grade.getName());
		}
		ClassType classType = classes.getClassType();
		if (classType != null) {
			classesChangeLog.setClass_type(classType.getType_name());
		}
		classesChangeLog.setStart_label(classes.getStart_label());

		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginUser");
		if (teacher != null) {
			classesChangeLog.setTeacher_name(teacher.getTeacher_name());
		}
		classesChangeLog.setCreate_time(TimeUtil.getCurrentDay());

		// TODO下面几个没斜线的还没有做完
		/*
		 * private static final String CLASSES_ADD = "创建班级";// private static
		 * final String CLASSES_UPGRADE = "升级"; private static final String
		 * CLASSES_FINISHSCHOOL = "毕业"; private static final String
		 * CLASSES_DELETE = "删除";// private static final String
		 * CLASSES_CHANG_TEACHER = "班主任变动";
		 */

		switch (state) {
		case "创建":
			classesChangeLog.setNote("该班在" + classes.getGrade().getName() + "成功开办");
			break;
		case "升级":
			classesChangeLog.setNote("该班成功升级");
			break;
		case "毕业":
			classesChangeLog.setNote("该班成功毕业");
			break;
		case "删除":
			classesChangeLog.setNote(classes.getNote());
			break;
		case "班主任变动":
			classesChangeLog.setNote("该班班主任设置为"+classes.getTeacher().getTeacher_name());
			break;

		default:
			break;
		}
		classesChangeLog.setType_label(state);

		classesChangeLogDao.save(classesChangeLog);

	}

	@Override
	public void termQuery(ClassesChangeLog model, PageBean pageBean, DetachedCriteria detachedCriteria,
			String start_date, String end_date) throws UnsupportedEncodingException {

		detachedCriteria = pageBean.getDetachedCriteria();
		detachedCriteria.setProjection(null);
		// detachedCriteria.createAlias("classes", "c");
		String class_name = model.getClass_name();
		String start_label = model.getStart_label();
		String type_label = model.getType_label();

		class_name = new String(class_name.getBytes("iso8859-1"), "utf-8");
		start_label = new String(start_label.getBytes("iso8859-1"), "utf-8");
		type_label = new String(type_label.getBytes("iso8859-1"), "utf-8");

		if (StringUtils.isNotBlank(class_name)) {
			if (!"全部班级".equals(class_name)) {
				detachedCriteria.add(Restrictions.eq("class_name", class_name));
			}
		}
		if (StringUtils.isNotBlank(start_label)) {
			if (!"全部学年".equals(start_label)) {
				detachedCriteria.add(Restrictions.eq("start_label", start_label));
			}
		}
		if (StringUtils.isNotBlank(type_label)) {
			if (!"全部类型".equals(type_label)) {
				detachedCriteria.add(Restrictions.eq("type_label", type_label));

			}
		}
		if (StringUtils.isNotBlank(start_date) && StringUtils.isNotBlank(end_date)) {
			Date start_date_format = TimeUtil.getDate(start_date);
			Date end_date_format = TimeUtil.getDate(end_date);
			detachedCriteria.add(Restrictions.between("create_time_format", start_date_format, end_date_format));
		} else {

			if (StringUtils.isNotBlank(start_date)) {
				Date start_date_format = TimeUtil.getDate(start_date);
				detachedCriteria.add(Restrictions.ge("create_time_format", start_date_format));
			}
			if (StringUtils.isNotBlank(end_date)) {
				Date end_date_format = TimeUtil.getDate(end_date);
				detachedCriteria.add(Restrictions.le("create_time_format", end_date_format));
			}
		}

	}

}
