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

import com.hrbhd.bady.dao.ITeacherChangeLogDao;
import com.hrbhd.bady.domain.StudentChangeLog;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.domain.TeacherChangeLog;
import com.hrbhd.bady.service.ITeacherChangeLogService;
import com.hrbhd.bady.util.PageBean;
import com.hrbhd.bady.util.TimeUtil;

@Service
@Transactional
public class TeacherChangeLogServiceImpl implements ITeacherChangeLogService{

	@Autowired
	private ITeacherChangeLogDao teacherChangeLogDao;

	@Override
	public void pageQuery(PageBean pageBean) {
		teacherChangeLogDao.pageQuery(pageBean);
	}
	
	public void addLog(Teacher teacher, String state) {
		
		/*StudentChangeLog studentChangeLog = new StudentChangeLog();

		studentChangeLog.setStudent(student);*/
		TeacherChangeLog teacherChangeLog = new TeacherChangeLog();
		
		//teacherChangeLog.setTeacher(teacher);
		teacherChangeLog.setWorknumber(teacher.getWorknumber());
		teacherChangeLog.setTeacher_name(teacher.getTeacher_name());
		teacherChangeLog.setYearMonthDay(teacher.getBrither_name());
		teacherChangeLog.setPhone(teacher.getPhone());
		if(teacher.getStructure()!=null){
			teacherChangeLog.setStructure_name(teacher.getStructure().getName());
		}
		if(teacher.getTeacherDuty()!=null){
			teacherChangeLog.setDuty_name(teacher.getTeacherDuty().getDuty_name());
		}
		
		Teacher teacher1 = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginUser");
		if(teacher1!=null){
			teacherChangeLog.setOperation_name(teacher1.getTeacher_name());
		}
		teacherChangeLog.setNote("暂时没有");
		teacherChangeLog.setType_name(state);
		teacherChangeLog.setStatus_name(teacher.getStatus_name());
		teacherChangeLog.setCreate_name(TimeUtil.getCurrentDay());
		teacherChangeLog.setChange_time_name(TimeUtil.getCurrentDay());
		
		
		teacherChangeLogDao.save(teacherChangeLog);

	}

	@Override
	public void termQuery(TeacherChangeLog model, PageBean pageBean, DetachedCriteria detachedCriteria,
			String change_time_start,
			String change_time_end) throws UnsupportedEncodingException {
		
		detachedCriteria = pageBean.getDetachedCriteria();
		detachedCriteria.setProjection(null);
		String structure_name = model.getStructure_name();
		String type_name = model.getType_name();
		String teacher_name = model.getTeacher_name();
		
		/*structure_name = new String(structure_name.getBytes("iso8859-1"), "utf-8");
		type_name = new String(type_name.getBytes("iso8859-1"), "utf-8");
		teacher_name = new String(teacher_name.getBytes("iso8859-1"), "utf-8");
		*/
		
		if (StringUtils.isNotBlank(structure_name)) {
			if (!"华德幼儿园".equals(structure_name)&&!"全部部门".equals(structure_name)) {
				detachedCriteria.add(Restrictions.eq("structure_name", structure_name));
			}

		}
		if (StringUtils.isNotBlank(teacher_name)) {
			detachedCriteria.add(Restrictions.like("teacher_name", teacher_name+"%"));
		}
		if (StringUtils.isNotBlank(type_name)) {
			if (!"全部类型".equals(type_name)) {
				detachedCriteria.add(Restrictions.eq("type_name", type_name));
			}
		}
		if (StringUtils.isNotBlank(change_time_start) && StringUtils.isNotBlank(change_time_end)) {
			Date start_date_format = TimeUtil.getDate(change_time_start);
			Date end_date_format = TimeUtil.getDate(change_time_end);
		
			detachedCriteria.add(Restrictions.between("change_time_name_format", start_date_format, end_date_format));
		} else {

			if (StringUtils.isNotBlank(change_time_start)) {
				Date start_date_format = TimeUtil.getDate(change_time_start);
				detachedCriteria.add(Restrictions.ge("change_time_name_format", start_date_format));
			}
			if (StringUtils.isNotBlank(change_time_end)) {
				Date end_date_format = TimeUtil.getDate(change_time_end);
				detachedCriteria.add(Restrictions.le("change_time_name_format", end_date_format));
			}
		}
		
	}
	

}
