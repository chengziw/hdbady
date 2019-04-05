package com.hrbhd.bady.service.impl;

import com.hrbhd.bady.dao.IClassesDao;
import com.hrbhd.bady.dao.IHomeWorkDao;
import com.hrbhd.bady.dao.ISubjectDao;
import com.hrbhd.bady.dao.ITeacherDao;
import com.hrbhd.bady.domain.*;
import com.hrbhd.bady.service.IHomeWorkService;
import com.hrbhd.bady.util.MD5Utils;
import com.hrbhd.bady.util.PageBean;
import com.hrbhd.bady.util.TimeUtil;
import com.hrbhd.bady.web.action.SchoolAction;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.*;
import java.net.URL;
import java.sql.Date;
import java.util.List;
import java.util.Random;

@Service
@Transactional
public class HomeWorkServiceImpl implements IHomeWorkService {

	@Autowired
	private IHomeWorkDao homeWorkDao;
	@Autowired
	private IClassesDao classesDao;
	@Autowired
	private ITeacherDao teacherDao;
	@Autowired
	private ISubjectDao subjectDao;

	@Override
	public void pageQuery(PageBean pageBean) {
		homeWorkDao.pageQuery(pageBean);
	}

	@Override
	public HomeWork findById(String id) {
		return homeWorkDao.findById(id);
	}

	@Override
	public void termQuery(HomeWork model, PageBean pageBean, DetachedCriteria detachedCriteria, String class_id,
			 String subject_id, String start_time, String end_time, String teacher_name)
			throws UnsupportedEncodingException {

		detachedCriteria = pageBean.getDetachedCriteria();
		detachedCriteria.setProjection(null);

		String grade_id = model.getGrade_id();
		// grade_id = new String(grade_id.getBytes("iso8859-1"), "utf-8");
		// class_id = new String(class_id.getBytes("iso8859-1"), "utf-8");
		// subject_id = new String(subject_id.getBytes("iso8859-1"), "utf-8");
		// teacher_name = new String(teacher_name.getBytes("iso8859-1"),
		// "utf-8");

		if (StringUtils.isNotBlank(grade_id)) {
			if (!"全部年级".equals(grade_id) && !"".equals(grade_id)) {
				detachedCriteria.add(Restrictions.eq("grade_id", grade_id));
			}
		}
		if (StringUtils.isNotBlank(class_id)) {
			if (!"全部班级".equals(class_id) && !"".equals(class_id)) {
				detachedCriteria.add(Restrictions.eq("classes_id", class_id));
			}
		}
		if (StringUtils.isNotBlank(subject_id)) {
			if (!"全部科目".equals(subject_id) && !"".equals(subject_id)) {
				detachedCriteria.add(Restrictions.eq("subject_id", subject_id));

			}
		}
		if (StringUtils.isNotBlank(teacher_name)) {
			detachedCriteria.add(Restrictions.like("teacher_info", teacher_name + "%"));
		}
		if (StringUtils.isNotBlank(start_time) && StringUtils.isNotBlank(end_time)) {
			Date start_date_format = TimeUtil.getDate(start_time);
			Date end_date_format = TimeUtil.getDate(end_time);
			detachedCriteria.add(Restrictions.between("year_month_day_format", start_date_format, end_date_format));
		} else {

			if (StringUtils.isNotBlank(start_time)) {
				Date start_date_format = TimeUtil.getDate(start_time);
				detachedCriteria.add(Restrictions.ge("year_month_day_format", start_date_format));
			}
			if (StringUtils.isNotBlank(end_time)) {
				Date end_date_format = TimeUtil.getDate(end_time);
				detachedCriteria.add(Restrictions.le("year_month_day_format", end_date_format));
			}
		}

	}

	@Override
	public void taddHomeWork(File[] fileselect ,HomeWork model) throws IOException {

		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginTeacher");
		String teacher_id = teacher.getId();
		teacher = teacherDao.findById(teacher_id);
		Classes classes = teacher.getClasses();
		if(classes==null){
			return ;
		}
		String class_id = classes.getId();
		classes = classesDao.findById(class_id);
		HomeWork homeWork = new HomeWork();
		homeWork.setTeacher_info(teacher.getTeacher_name());
		homeWork.setPublish_time_name(TimeUtil.getCurrentDay());
		// TODO
		// homeWork.setSubject(subject);
		homeWork.setTeacher_info(teacher.getTeacher_name());
		/*
		 * Set<HomeWork> homeWorks = null; if(classes!=null){ homeWorks =
		 * classes.getHomeWorks(); }
		 */
		URL resource = SchoolAction.class.getClassLoader().getResource("");
		String path = resource.getPath();
		path = StringUtils.substringBeforeLast(path, "/WEB-INF/classes");
		path = path + "image/homework/";

		if (fileselect != null) {
			for (int i = 0; i < fileselect.length; i++) {

				File inFile = fileselect[i];
				FileInputStream fileInputStream = new FileInputStream(inFile);
				Random random = new Random();
				int nextInt = random.nextInt(1000000);
				String fileName = MD5Utils.md5(System.currentTimeMillis() + nextInt + "");
			 	homeWork.setToImageUrl(fileName + ".jpg");
				File outFile = new File(path + fileName + ".jpg");
				System.out.println(outFile.getAbsolutePath());
				if (!outFile.exists())
					outFile.createNewFile();
				FileOutputStream fileOutputStream = new FileOutputStream(outFile);
				int c;
				byte buffer[] = new byte[1024];
				while ((c = fileInputStream.read(buffer)) != -1) {
					for (int j = 0; j < c; j++)
						fileOutputStream.write(buffer[j]);
				}
				fileInputStream.close();
				fileOutputStream.close();
			}
		}
		String subject_id = model.getSubject_id();
		Subject subject = subjectDao.findById(subject_id);
		homeWork.setSubject(subject);
		
		homeWork.setClasses(classes);
		Grade grade = classes.getGrade();
		String grade_id = grade.getId();
		homeWork.setGrade_id(grade_id);
		homeWork.setYear_month_day(TimeUtil.getCurrentDay());
		homeWorkDao.save(homeWork);
	}

	@Override
	public List<HomeWork> findAll() {
		return homeWorkDao.findAll();
	}

	@Override
	public Classes getClasses(HomeWork homeWork) {
		String id = homeWork.getId();
		homeWork = homeWorkDao.findById(id);
		Classes classes = homeWork.getClasses();
		return classes;
	}

	public Grade getGrade(Classes classes) {
		String id = classes.getId();
		classes = classesDao.findById(id);
		Grade grade = classes.getGrade();
		return grade;
	}
}
