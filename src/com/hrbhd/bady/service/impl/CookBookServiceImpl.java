package com.hrbhd.bady.service.impl;

import com.hrbhd.bady.dao.IClassesDao;
import com.hrbhd.bady.dao.ICookBookDao;
import com.hrbhd.bady.dao.IGradeDao;
import com.hrbhd.bady.dao.ITeacherDao;
import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.CookBook;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.service.ICookBookService;
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

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.sql.Date;
import java.util.List;
import java.util.Random;

@Service
@Transactional
public class CookBookServiceImpl implements ICookBookService {

	@Autowired
	private ICookBookDao cookBookDao;
	@Autowired
	private IClassesDao classesDao;
	@Autowired
	private IGradeDao gradeDao;
	@Autowired
	private ITeacherDao teacherDao;

	@Override
	public void pageQuery(PageBean pageBean) {
		cookBookDao.pageQuery(pageBean);
	}

	@Override
	public CookBook findById(String id) {
		return cookBookDao.findById(id);
	}

	@Override
	public void termQuery(CookBook model, PageBean pageBean, DetachedCriteria detachedCriteria, String class_id,
			String grade_id, String type_id, String start_time, String end_time, String teacher_name) {

		detachedCriteria = pageBean.getDetachedCriteria();
		detachedCriteria.setProjection(null);

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
				detachedCriteria.createAlias("classes", "c");
				detachedCriteria.add(Restrictions.eq("classes_id", class_id));

			}
		}
		if (StringUtils.isNotBlank(type_id)) {
			if (!"全部食谱".equals(type_id)) {
				detachedCriteria.add(Restrictions.eq("type_name", type_id));

			}
		}
		if (StringUtils.isNotBlank(teacher_name)) {
			detachedCriteria.add(Restrictions.eq("teacher_info", teacher_name));
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
	public List<CookBook> findAll() {
		return cookBookDao.findAll();
	}

	@Override
	public void taddCookBook(File[] fileselect) throws IOException {

		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginTeacher");
		String teacher_id = teacher.getId();
		teacher = teacherDao.findById(teacher_id);
		Classes classes = teacher.getClasses();
		
		CookBook cookBook = new CookBook();
		cookBook.setTeacher_info(teacher.getTeacher_name());
		cookBook.setPublish_time_name(teacher.getTeacher_name());
		/*
		 * Set<HomeWork> homeWorks = null; if(classes!=null){ homeWorks =
		 * classes.getHomeWorks(); }
		 */
		URL resource = SchoolAction.class.getClassLoader().getResource("");
		String path = resource.getPath();
		path = StringUtils.substringBeforeLast(path, "/WEB-INF/classes");
		path = path + "/image/cookbook/";

		if (fileselect != null) {
			for (int i = 0; i < fileselect.length; i++) {

				File inFile = fileselect[i];
				FileInputStream fileInputStream = new FileInputStream(inFile);
				Random random = new Random();
				int nextInt = random.nextInt(1000000);
				String fileName = MD5Utils.md5(System.currentTimeMillis() + nextInt + "");
				cookBook.setToImageUrl(fileName + ".jpg");
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

		cookBook.setClasses(classes);
		cookBookDao.save(cookBook);

	}

	@Override
	public Classes getClasses(CookBook cookBook) {
		
		String id = cookBook.getId();
		cookBook = cookBookDao.findById(id);
		Classes classes = cookBook.getClasses();
		String class_id = classes.getId();
		classes = classesDao.findById(class_id);

		return classes;
	}

	@Override
	public Grade getGrade(Classes classes) {
		
		String class_id = classes.getId();
		classes = classesDao.findById(class_id);
		Grade grade = classes.getGrade();
		String grade_id = grade.getId();
		grade = gradeDao.findById(grade_id);
		
		return grade;
	}
}
