package com.hrbhd.bady.service.impl;

import java.io.IOException;


import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.components.Else;
import org.hibernate.cache.entry.StructuredCacheEntry;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.hql.ast.tree.MapEntryNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hrbhd.bady.dao.IClassesDao;
import com.hrbhd.bady.dao.IGradeDao;
import com.hrbhd.bady.dao.IStudentBespeakDao;
import com.hrbhd.bady.dao.IStudentDao;
import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.StudentBespeak;
import com.hrbhd.bady.domain.StudentBespeakDesc;
import com.hrbhd.bady.domain.StudentChangeLog;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.service.IStudentBespeakService;
import com.hrbhd.bady.service.IStudentChangeLogService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.MD5Utils;
import com.hrbhd.bady.util.PageBean;
import com.hrbhd.bady.util.TimeUtil;

import freemarker.template.utility.StringUtil;

@Service
@Transactional
public class StudentBespeakServiceImpl implements IStudentBespeakService {

	@Autowired
	private IStudentDao studentDao;
	@Autowired
	private IClassesDao classesDao;
	@Autowired
	private IGradeDao gradeDao;
	@Autowired
	private IStudentBespeakDao studentBespeakDao;

	@Override
	public void pageQuery(PageBean pageBean) {
		studentBespeakDao.pageQuery(pageBean);
	}

	@Override
	public void addBespeakStudent(StudentBespeak model) throws IOException {
		studentBespeakDao.save(model);

		String json = JsonUtil.HANDLE_SUCCESS;
		JsonUtil.writeJson(json);
	}

	@Override
	public StudentBespeak findById(String id) {
		return studentBespeakDao.findById(id);
	}

	@Override
	public void updata(StudentBespeak model) {
		studentBespeakDao.update(model);
	}

	@Override
	public void checkBespeakStudent(StudentBespeak model) throws IOException {
		String id = model.getId();
		StudentBespeak studentBespeak = studentBespeakDao.findById(id);

		String password = studentBespeak.getPassword();
		password = MD5Utils.md5(password);
		studentBespeak.setPassword(password);
		
		String status_name = model.getStatus_name();

		Grade grade = null;
		Classes classes = null;
		String grade_id = model.getGrade_id();
		String class_id = model.getClass_id();
		if ("请选择".equals(grade_id)) {
			model.setGrade_id("");
		}
		if ("请选择".equals(class_id)) {
			model.setClasses(null);
		}
		if (StringUtils.isNotBlank(grade_id)) {
			grade = gradeDao.findById(grade_id);
			studentBespeak.setGrade(grade);
		}
		if (StringUtils.isNotBlank(class_id)) {
			classes = classesDao.findById(class_id);
			studentBespeak.setClasses(classes);
		}
		//////////////////////////
		String status = "";
		String stauts_text = "";
		if (StringUtils.isNotBlank(class_id)) {
			status = "2";
			stauts_text = "待确认入学";
		} else {
			status = "1";
			stauts_text = "待分班";
		}
		studentBespeak.setStatus_name(status_name);
		//////////////////////////////
		if ("3".equals(status_name)) {

			Student student = new Student(studentBespeak.getStudent_no(), studentBespeak.getName(),
					studentBespeak.getSex(), studentBespeak.getYearMonthDay(), studentBespeak.getAge(),
					studentBespeak.getGrade(),studentBespeak.getPassword(), studentBespeak.getClasses(), studentBespeak.getParent_name(),
					studentBespeak.getPhone(), studentBespeak.getEnter_date(), studentBespeak.getAddress(),
					studentBespeak.getEdit(), studentBespeak.getIs_local(), studentBespeak.getIs_teacherson(),
					studentBespeak.getCensus_type(), studentBespeak.getRelationship(),
					studentBespeak.getHealth_status(), studentBespeak.getIs_allergy(),
					studentBespeak.getIs_predisease(), studentBespeak.getIs_health_form(),
					studentBespeak.getIs_health_verify(), studentBespeak.getIs_ccine(), studentBespeak.getBlood_type(),
					studentBespeak.getCommom_disease(), studentBespeak.getTimetype_id(),
					studentBespeak.getIs_only_child(), studentBespeak.getBirthplace(),
					studentBespeak.getIdentity_card(), studentBespeak.getDemand(), studentBespeak.getNote(),
					studentBespeak.getInterest());

			student.setStatus_name(status);
			student.setStatus_name_text(stauts_text);
			student.setEnter_date(TimeUtil.getCurrentDay());

			studentDao.save(student);
		}

		String json = JsonUtil.HANDLE_SUCCESS;
		JsonUtil.writeJson(json);

	}

	@Override
	public void saveOrUpdate(StudentBespeak model) {
		studentBespeakDao.saveOrUpdate(model);
	}

	@Override
	public List<StudentBespeakDesc> descPageQuery(StudentBespeak model) {
		String id = model.getId();
		StudentBespeak studentBespeak = studentBespeakDao.findById(id);

		Set<StudentBespeakDesc> studentBespeakDesc = studentBespeak.getStudentBespeakDesc();

		List<StudentBespeakDesc> studentBespeakDescs = new ArrayList<StudentBespeakDesc>(studentBespeakDesc);

		return studentBespeakDescs;
	}

	@Override
	public void editBespeakStudent(StudentBespeak model) throws IOException {

		String id = model.getId();
		StudentBespeak studentBespeak = studentBespeakDao.findById(id);

		studentBespeak.setStudent_no(model.getStudent_no());
		studentBespeak.setName(model.getName());
		studentBespeak.setSex(model.getSex());
		studentBespeak.setYearMonthDay(model.getYearMonthDay());
		studentBespeak.setAge(model.getAge());
		studentBespeak.setGrade_id(model.getGrade_id());
		studentBespeak.setClass_id(model.getClass_id());
		studentBespeak.setParent_name(model.getParent_name());
		studentBespeak.setPhone(model.getPhone());
		studentBespeak.setEnter_date(model.getEnter_date());
		studentBespeak.setAddress(model.getAddress());
		studentBespeak.setEdit(model.getEdit());
		studentBespeak.setIs_local(model.getIs_local());
		studentBespeak.setIs_teacherson(model.getIs_teacherson());
		studentBespeak.setCensus_type(model.getCensus_type());
		studentBespeak.setRelationship(model.getRelationship());
		studentBespeak.setHealth_status(model.getHealth_status());
		studentBespeak.setIs_allergy(model.getIs_allergy());
		studentBespeak.setIs_predisease(model.getIs_predisease());
		studentBespeak.setIs_health_form(model.getIs_health_form());
		studentBespeak.setIs_health_verify(model.getIs_health_verify());
		studentBespeak.setIs_ccine(model.getIs_ccine());
		studentBespeak.setBlood_type(model.getBlood_type());
		studentBespeak.setCommom_disease(model.getCommom_disease());
		studentBespeak.setTimetype_id(model.getTimetype_id());
		studentBespeak.setIs_only_child(model.getIs_only_child());
		studentBespeak.setBirthplace(model.getBirthplace());
		studentBespeak.setIdentity_card(model.getIdentity_card());
		studentBespeak.setDemand(model.getDemand());
		studentBespeak.setNote(model.getNote());
		studentBespeak.setInterest(model.getInterest());
		String password = model.getPassword();
		if(!password.equals(studentBespeak.getPassword())){
			password = MD5Utils.md5(password);
			studentBespeak.setPassword(password);
		}

		model.setStatus_name(studentBespeak.getStatus_name());

		String json = JsonUtil.SAVE_SUCCESS;
		JsonUtil.writeJson(json);

	}

	public void termQuery(StudentBespeak model, PageBean pageBean, DetachedCriteria detachedCriteria) throws UnsupportedEncodingException {
		detachedCriteria = pageBean.getDetachedCriteria();

		String grade_id = model.getGrade_id();
		String class_id = model.getClass_id();
		String age = model.getAge();
		String status_name = model.getStatus_name();
		/*String bespeak_type_name = model.getBespeak_type_name();
		String status_name = model.getStatus_name();
		String attend_shool_time_name = model.getAttend_shool_time_name();*/
		String name = model.getName();

		if (StringUtils.isNotBlank(grade_id)) {
			if (!"全部年级".equals(grade_id)) {
				detachedCriteria.add(Restrictions.eq("grade_id", grade_id));
			}
		}
		if (StringUtils.isNotBlank(class_id)) {
			if (!"全部班级".equals(class_id)) {
				detachedCriteria.add(Restrictions.eq("class_id", class_id));
			}
		}
		if (StringUtils.isNotBlank(age)) {
			if (!"年龄".equals(age)) {
				detachedCriteria.add(Restrictions.eq("age", age));
			}

		}
	    if (StringUtils.isNotBlank(status_name)) {
			if (!"0".equals(status_name)) {
				detachedCriteria.add(Restrictions.eq("status_name", status_name));
			}

		}
		if (StringUtils.isNotBlank(name)) {
			/*detachedCriteria.add(Restrictions.eq("name", name+"%"));*/
			detachedCriteria.add(Restrictions.like("name", "%"+name+"%"));
			
		}

		/*if (StringUtils.isNotBlank(attend_shool_time_name)) {
			
			if(!"预期到校报名时间".equals(attend_shool_time_name)){

				String currentTime = TimeUtil.getCurrentTime();
				Date enter_date_format = TimeUtil.getDate(currentTime);

				if("今天到校报名".equals(attend_shool_time_name)){
					enter_date_format.setHours(enter_date_format.getHours()+12);
					detachedCriteria.add(Restrictions.lt("enter_date_format", enter_date_format));
				}
				if("明天到校报名".equals(attend_shool_time_name)){
					enter_date_format.setDate(enter_date_format.getDay()+1);
					enter_date_format.setHours(enter_date_format.getHours()+12);
					detachedCriteria.add(Restrictions.lt("enter_date_format", enter_date_format));
				}
				if("后天到校报名".equals(attend_shool_time_name)){
					enter_date_format.setDate(enter_date_format.getDay()+2);
					enter_date_format.setHours(enter_date_format.getHours()+12);
					detachedCriteria.add(Restrictions.lt("enter_date_format", enter_date_format));
				}
			}
			
		}*/

	}

	@Override
	public void paddBespeakStudent(StudentBespeak model) throws IOException {
		
		studentBespeakDao.save(model);
		String json = JsonUtil.HANDLE_SUCCESS;
		JsonUtil.writeJson(json);
		
	}

}
