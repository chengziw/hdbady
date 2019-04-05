package com.hrbhd.bady.service.impl;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hrbhd.bady.dao.ICurriculaTableDao;
import com.hrbhd.bady.dao.ICurriculaTableItemDao;
import com.hrbhd.bady.dao.IScheduleDao;
import com.hrbhd.bady.dao.ISchoolDao;
import com.hrbhd.bady.dao.IStudentDao;
import com.hrbhd.bady.dao.ITeacherDao;
import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.CurriculaTable;
import com.hrbhd.bady.domain.CurriculaTableItem;
import com.hrbhd.bady.domain.Schedule;
import com.hrbhd.bady.domain.School;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.service.IClassesService;
import com.hrbhd.bady.service.ICurriculaTableService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.PageBean;
import com.hrbhd.bady.util.TimeUtil;

@Service
@Transactional
public class CurriculaTableServiceImpl implements ICurriculaTableService{

	@Autowired
	private ICurriculaTableDao curriculaTableDao;
	@Autowired
	private ICurriculaTableItemDao curriculaTableItemDao;
	@Autowired
	private IScheduleDao scheduleDao;
	@Autowired
	private IClassesService classesService;
	@Autowired
	private ITeacherDao teacherDao;
	@Autowired
	private IStudentDao studentDao;
	@Autowired
	private ISchoolDao schoolDao;
	
	@Override
	public void pageQuery(PageBean pageBean) {
		curriculaTableDao.pageQuery(pageBean);
	}

	@Override
	public CurriculaTable findById(String id) {
		return curriculaTableDao.findById(id);
	}

	@Override
	public void editCurriculaTable(CurriculaTable model, String[] ids, String[] subject_names,
			String[]teacher_ids ,String[] teacher_names) throws IOException {
		
		CurriculaTable curriculaTable = curriculaTableDao.findById(model.getId());
		Set<CurriculaTableItem> curriculaTableItems = curriculaTable.getCurriculaTableItems();
		
		int i = 0;
		int j = 0;
		int k = 0;
		int l = 0;
		int m = 0;
		
		String json="";
		
		for (CurriculaTableItem curriculaTableItem : curriculaTableItems) {
			String id = ids[i++];
			String subject_name = subject_names[j++];
			String teacher_id = teacher_ids[k++];
			String teacher_name = teacher_names[l++];
			
			curriculaTableItem.setSubject_name(subject_name);
			curriculaTableItem.setTeacher_name(teacher_name);
			curriculaTableItem.setTeacher_id(teacher_id);
			curriculaTableItem.setCurriculaTable(curriculaTable);
			
			List<CurriculaTableItem> list3 = null;
			if(!"".equals(curriculaTableItem.getTeacher_id())){
				list3 = curriculaTableItemDao.findByWCT(curriculaTableItem);
			}
			if(list3!=null&&list3.size()>0){
				json = "{\"errMeg\": \"保存失败, 星期"+list3.get(0).getWeek()+"第"+list3.get(0).getCourse()+"节课同一时间"+list3.get(0).getTeacher_name()+"老师已经在其他班级有课程安排\"}";
				JsonUtil.writeJson(json);
				return ;
			}
			
		}
		curriculaTable.setCurriculaTableItems(curriculaTableItems);
		
		json = "{\"errMeg\":\"\"}";
		JsonUtil.writeJson(json);
		/*
		Set<CurriculaTableItem> curriculaTableItems = new HashSet<CurriculaTableItem>();
		for(int i=0;i<weeks.length;i++){
			
			CurriculaTableItem curriculaTableItem = new CurriculaTableItem(teacher_names[i], subject_names[i], courses[i], weeks[i]);
			curriculaTableItems.add(curriculaTableItem);
		}
		*/
		
	}

	@Override
	public List<CurriculaTableItem> getCurriculaTableItems(CurriculaTable model) {
		String id = model.getId();
		CurriculaTable curriculaTable = curriculaTableDao.findById(id);
		Set<CurriculaTableItem> curriculaTableItems = curriculaTable.getCurriculaTableItems();
		List<CurriculaTableItem> items = new ArrayList<CurriculaTableItem>(curriculaTableItems);
		return items;
	}

	@Override
	public void deleteCurriculaTable(CurriculaTable model) throws IOException{
		String id = model.getId();
		CurriculaTable curriculaTable = curriculaTableDao.findById(id);
		/*Set<CurriculaTableItem> curriculaTableItems = curriculaTable.getCurriculaTableItems();
		for (CurriculaTableItem curriculaTableItem : curriculaTableItems) {
			curriculaTableItemDao.delete(curriculaTableItem);
		}*/
		curriculaTableDao.delete(curriculaTable);
		
		String json = "{\"errMeg\":\"\"}";
		JsonUtil.writeJson(json);
	}

	@Override
	public void publishCurriculaTable(CurriculaTable model) throws IOException {
		String id = model.getId();
		CurriculaTable curriculaTable = curriculaTableDao.findById(id);
		curriculaTable.setSort("1");
		curriculaTable.setSort_label("已发布");
		curriculaTable.setPublish_time_label(TimeUtil.getCurrentDay());
		String json = "{\"errMeg\":\"\"}";
		JsonUtil.writeJson(json);
	}

	@Override
	public void addCurriculaTable(CurriculaTable model, String[] weeks, String[] courses, String[] subject_names,
			String[] teacher_ids, String[] teacher_names) throws IOException {
		
		String json="";
		//判断课表是否存在
		String class_id = model.getClasses().getId();
		CurriculaTable curriculaTable = curriculaTableDao.findByClassId(class_id);
		if(curriculaTable!=null){
			json = "{\"errMeg\":\"该班级已经存在课表,不允许重复创建\"}";
			JsonUtil.writeJson(json);
			return;
		}
		
		
		List<Schedule> list = scheduleDao.findAll();
		if(list!=null){
			Schedule schedule = list.get(0);
			
			String dayNum = schedule.getDayNum();
			String morning_has_num = schedule.getMorning_has_num();
			String afternoon_has_num = schedule.getAfternoon_has_num();
			String start_end_time = schedule.getStart_end_time();
			String week_type_label = schedule.getWeek_type_label();
			
			model.setDayNum(dayNum);
			model.setMorning_has_num(morning_has_num);
			model.setAfternoon_has_num(afternoon_has_num);
			model.setStart_end_time(start_end_time);
			model.setWeek_type_label(week_type_label);
		}
		model.setSort("0");
		model.setSort_label("未发布");
		//设置学期
		int currentYear = TimeUtil.getCurrentYear();
		int currentMonth = TimeUtil.getCurrentMonth();
		List<School> sList = schoolDao.findAll();
		School school = sList.get(0);
		int first_term_month = Integer.parseInt(school.getFirst_term_month());
		if(first_term_month>9){
			model.setTable_year(currentYear+"(秋季学期)");
		}else{
			model.setTable_year(currentYear+"(春季学期)");
		}
		/*Classes classes = model.getClasses();
		if(classes!=null){
			String id = classes.getId();
			Classes classes2 = classesService.findById(id);
			model.setClasses(classes2);
		}*/
		
		//curriculaTableDao.save(model);

		//List<CurriculaTableItem> list2 = curriculaTableItemDao.findAll();
		
		Set<CurriculaTableItem> curriculaTableItems = new HashSet<CurriculaTableItem>();
		
		for (int i=0;i<weeks.length;i++){ 
			CurriculaTableItem curriculaTableItem = new CurriculaTableItem();
			
			String week = weeks[i];
			String course = courses[i];
			String subject_name = subject_names[i];
			String teacher_id = teacher_ids[i];
			String teacher_name = teacher_names[i];
			
			curriculaTableItem.setWeek(week);
			curriculaTableItem.setCourse(course);
			curriculaTableItem.setSubject_name(subject_name);
			curriculaTableItem.setTeacher_id(teacher_id);
			curriculaTableItem.setTeacher_name(teacher_name);
			
			List<CurriculaTableItem> list3 = null;
			if(!"".equals(curriculaTableItem.getTeacher_id())){
				list3 = curriculaTableItemDao.findByWCT(curriculaTableItem);
			}
			if(list3!=null&&list3.size()>0){
				json = "{\"errMeg\": \"保存失败, 星期"+list3.get(0).getWeek()+"第"+list3.get(0).getCourse()+"节课同一时间"+list3.get(0).getTeacher_name()+"老师已经在其他班级有课程安排\"}";
				JsonUtil.writeJson(json);
				return ;
			}
			
			curriculaTableItems.add(curriculaTableItem);
			
			curriculaTableItem.setCurriculaTable(model);
			
		}
		model.setCurriculaTableItems(curriculaTableItems);
		
		//curriculaTableDao.update(model);
		curriculaTableDao.save(model);
		
		json = "{\"errMeg\":\"\"}";
		JsonUtil.writeJson(json);
		
	}

	@Override
	public void termQuery(CurriculaTable model, PageBean pageBean, DetachedCriteria detachedCriteria) throws UnsupportedEncodingException {
		detachedCriteria = pageBean.getDetachedCriteria();
		detachedCriteria.setProjection(null);

		String grade_id = model.getGrade_id();
		String class_id = model.getClass_id();
		String table_year = model.getTable_year();
		String sort_label = model.getSort_label();
		table_year = new String(table_year.getBytes("iso8859-1"), "utf-8");
		sort_label = new String(sort_label.getBytes("iso8859-1"), "utf-8");
		// start_date
		// end_date
		detachedCriteria.createAlias("classes", "c");
		if (StringUtils.isNotBlank(grade_id)) {
			if (!"全部年级".equals(grade_id)) {
				//detachedCriteria.add(Restrictions.eq("grade.id", grade_id));
				detachedCriteria.add(Restrictions.eq( "c.grade.id" ,  grade_id));
			}
		}
		if (StringUtils.isNotBlank(class_id)) {
			if (!"全部班级".equals(class_id)) {
				//detachedCriteria.add(Restrictions.eq("classes.id", class_id));
				detachedCriteria.add(Restrictions.eq( "c.id" , class_id));
			}
		}
		if (StringUtils.isNotBlank(table_year)) {
			if (!"全部学年".equals(table_year)) {
				detachedCriteria.add(Restrictions.eq("table_year", table_year));

			}
		}
		if (StringUtils.isNotBlank(sort_label)) {
			if (!"全部状态".equals(sort_label)) {
				detachedCriteria.add(Restrictions.eq("sort_label", sort_label));

			}
		}
	}

	@Override
	public Classes getClasses(Teacher teacher) {
		String id = teacher.getId();
		teacher = teacherDao.findById(id);
		Classes classes = teacher.getClasses();
		if(classes!=null){
			return classes;
		}
		return null;
	}

	@Override
	public CurriculaTable findByClassId(String cid) {
		
		return curriculaTableDao.findByClassId(cid);
	}

	@Override
	public Classes getClasses(Student student) {
		String id = student.getId();
		student = studentDao.findById(id);
		Classes classes = student.getClasses();
		if(classes!=null){
			return classes;
		}
		return null;
	}
}
