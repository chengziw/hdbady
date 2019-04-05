package com.hrbhd.bady.service.impl;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hrbhd.bady.dao.IStudentMonthCheckDao;
import com.hrbhd.bady.dao.IStudentVacationDao;
import com.hrbhd.bady.domain.StudentCheck;
import com.hrbhd.bady.domain.StudentMonthCheck;
import com.hrbhd.bady.domain.StudentVacation;
import com.hrbhd.bady.service.IStudentMonthCheckService;
import com.hrbhd.bady.util.PageBean;
import com.hrbhd.bady.util.TimeUtil;

@Service
@Transactional
public class StudentMonthCheckServiceImpl implements IStudentMonthCheckService{

	@Autowired
	private IStudentMonthCheckDao studentMonthCheckDao;
	@Autowired
	private IStudentVacationDao studentVacationDao;

	@Override
	public void pageQuery(PageBean pageBean) {
		studentMonthCheckDao.pageQuery(pageBean);
	}

	@Override
	public StudentMonthCheck findById(String id) {
		return studentMonthCheckDao.findById(id);
	}

	@Override
	public void save(StudentMonthCheck studentMonthCheck) {
		studentMonthCheckDao.save(studentMonthCheck);
	}

	@Override
	public void termQuery(StudentMonthCheck model, PageBean pageBean, DetachedCriteria detachedCriteria,
			String class_id, String end_month, String end_year, String grade_id, String start_month, String start_year,
			String status, String student_name) throws UnsupportedEncodingException {
		
		detachedCriteria = pageBean.getDetachedCriteria();
		detachedCriteria.setProjection(null);
		detachedCriteria.createAlias("student", "s");

		grade_id = new String(grade_id.getBytes("iso8859-1"), "utf-8");
		class_id = new String(class_id.getBytes("iso8859-1"), "utf-8");
		status = new String(status.getBytes("iso8859-1"), "utf-8");
		student_name = new String(student_name.getBytes("iso8859-1"), "utf-8");

		if (StringUtils.isNotBlank(grade_id)) {
			if (!"全部年级".equals(grade_id)&&!"".equals(grade_id)) {
				detachedCriteria.add(Restrictions.eq("s.grade_id", grade_id));
			}
		}
		if (StringUtils.isNotBlank(class_id)) {
			if (!"全部班级".equals(class_id)&&!"".equals(class_id)) {
				detachedCriteria.add(Restrictions.eq("s.class_id", class_id));
			}
		}
		if (StringUtils.isNotBlank(student_name)) {
			detachedCriteria.add(Restrictions.like("s.name",student_name  + "%"));
		}
		//TODO
		//暂时没做
		/*if (StringUtils.isNotBlank(class_id)) {
			if (!"全部状态".equals(class_id)) {
				detachedCriteria.add(Restrictions.eq("status", class_id));
			}
		}*/
		String start_date = start_year+"-"+start_month+"-"+1;
		String end_date = end_year+"-"+end_month+"-"+31;
		if (StringUtils.isNotBlank(start_date) && StringUtils.isNotBlank(end_date)) {
			Date start_date_format = TimeUtil.getDate(start_date);
			Date end_date_format = TimeUtil.getDate(end_date);
			detachedCriteria.add(Restrictions.between("date_label_format", start_date_format, end_date_format));
		}
		
	}

	@Override
	public List<StudentMonthCheck> findByMonthAndYear(String year_label, String month_label) {
		return studentMonthCheckDao.findByMonthAndYear(year_label,month_label);
	}

}
