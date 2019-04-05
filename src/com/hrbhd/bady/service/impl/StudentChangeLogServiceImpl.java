package com.hrbhd.bady.service.impl;


import java.sql.Date;
import java.util.List;

import javax.jws.WebParam.Mode;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.struts2.ServletActionContext;
import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.Subqueries;
import org.hibernate.envers.Audited;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hrbhd.bady.dao.IClassesChangeLogDao;
import com.hrbhd.bady.dao.IClassesDao;
import com.hrbhd.bady.dao.IGradeDao;
import com.hrbhd.bady.dao.IStudentChangeLogDao;
import com.hrbhd.bady.dao.IStudentDao;
import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.StudentChangeLog;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.service.IStudentChangeLogService;
import com.hrbhd.bady.util.PageBean;
import com.hrbhd.bady.util.TimeUtil;


@Service
@Transactional
public class StudentChangeLogServiceImpl implements IStudentChangeLogService {
	@Autowired
	private IStudentChangeLogDao studentChangeLogDao;
	@Autowired
	private IClassesDao classesDao;
	@Autowired
	private IGradeDao gradeDao;
    
	@Override
	public List<StudentChangeLog> findAll() {
		studentChangeLogDao.findAll();
		return null;
	}
	
	@Override
	public void pageQuery(PageBean pageBean) {
		studentChangeLogDao.pageQuery(pageBean);
	}

	@Override
	public void addLog(Student student, String state) {
		StudentChangeLog studentChangeLog = new StudentChangeLog();

		//studentChangeLog.setStudent(student);
		
		studentChangeLog.setStudent_name(student.getName());
		if(student.getGrade()!=null){
			studentChangeLog.setGrade_name(student.getGrade().getName());
		}
		if(student.getClasses()!=null){
			studentChangeLog.setClass_name(student.getClasses().getClass_name());
		}
		studentChangeLog.setYearMonthDay(student.getYearMonthDay());
		studentChangeLog.setSex_name(student.getSex());
		
		//需要更改
		studentChangeLog.setType_name(state);
		studentChangeLog.setChange_date_name(TimeUtil.getCurrentDay());
		studentChangeLog.setNote(student.getNote());
		//需要更改
		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginUser");
		if(teacher!=null){
			studentChangeLog.setTeacher_name(teacher.getTeacher_name());
		}
		studentChangeLog.setCreate_name(TimeUtil.getCurrentDay());
		
		studentChangeLogDao.save(studentChangeLog);
	
	}
	
	@Override
	public void termQuery(StudentChangeLog model, PageBean pageBean, DetachedCriteria detachedCriteria, String change_time_start,
			String change_time_end) {
		
		detachedCriteria = pageBean.getDetachedCriteria();
		//detachedCriteria.createAlias("student", "s");
		String type_name = model.getType_name();
		String grade_name = model.getGrade_name();
		String class_name = model.getClass_name();
		String student_name = model.getStudent_name();
		
		if (StringUtils.isNotBlank(type_name)) {
			if (!"全部状态".equals(type_name)) {
				detachedCriteria.add(Restrictions.eq("type_name", type_name));
			}

		}
		if (StringUtils.isNotBlank(grade_name)) {
			if (!"全部年级".equals(grade_name)) {
				//detachedCriteria.add(Restrictions.eq("student.grade_id", grade_id));
				//detachedCriteria.createAlias("children", "c").add(Expression.eq( "c.name" ,  childName));
				detachedCriteria.add(Restrictions.eq( "grade_name" ,  grade_name));
				//下面的东西也好使
				//detachedCriteria.createAlias("student", "s").add(Restrictions.eq( "s.grade.id" ,  grade_id));
			}
		}
		if (StringUtils.isNotBlank(class_name)) {
			if (!"全部班级".equals(class_name)) {
				//detachedCriteria.add(Restrictions.eq("student.classes.id", class_id));
				detachedCriteria.add(Restrictions.eq( "class_name" ,  class_name));
			}
		}
		if (StringUtils.isNotBlank(student_name)) {
			detachedCriteria.add(Restrictions.like("student_name", student_name+"%"));
		}
		if (StringUtils.isNotBlank(change_time_start) && StringUtils.isNotBlank(change_time_end)) {
			Date start_date_format = TimeUtil.getDate(change_time_start);
			Date end_date_format = TimeUtil.getDate(change_time_end);
			detachedCriteria.add(Restrictions.between("change_date_name_format", start_date_format, end_date_format));
		} else {

			if (StringUtils.isNotBlank(change_time_start)) {
				Date start_date_format = TimeUtil.getDate(change_time_start);
				detachedCriteria.add(Restrictions.ge("change_date_name_format", start_date_format));
			}
			if (StringUtils.isNotBlank(change_time_end)) {
				Date end_date_format = TimeUtil.getDate(change_time_end);
				detachedCriteria.add(Restrictions.le("change_date_name_format", end_date_format));
			}

		}
		/*Criteria criteria = session.createCriteria(ServiceType.class, "servicetype");
		DetachedCriteria serviceCriteria = DetachedCriteria.forClass(Services.class, "service");
		serviceCriteria.add(Restrictions.eq("ACTIVE", new Integer(1)));
		serviceCriteria.add(Property.forName("servicetype.ID").eqProperty("service.IS_57"));
		criteria.add(Subqueries.exists(serviceCriteria.setProjection(Projections.property("service.ID"))));
		return criteria.list();*/
		
		/*//定义子查询对象并命名别名
		DetachedCriteria queryCar = DetachedCriteria.forClass(ExportCarrier.class,"carrier");
	
		//添加子查询与主查询的主外键关联关系，若有多个条件则适当增加
		queryCar.add(Property.forName("file.id").eqProperty("carrier.exportFile"));
		//添加子查询的查询内容，至少有一个，否则会报错，此处可以随便添加子查询的任何属性不影响主查询的数据输出。
		query.add(Subqueries.exists(queryCar.setProjection(Projections.property("carrier.id"))));
		//查询所有符合条件的结果并保存
		List<ExportFile> exportFileList=exportFileService.getEntitys(query);*/
	
	}
	
}
