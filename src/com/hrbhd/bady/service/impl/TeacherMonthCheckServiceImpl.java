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

import com.hrbhd.bady.dao.ITeacherMonthCheckDao;
import com.hrbhd.bady.domain.TeacherMonthCheck;
import com.hrbhd.bady.service.ITeacherMonthCheckService;
import com.hrbhd.bady.util.PageBean;
import com.hrbhd.bady.util.TimeUtil;

@Service
@Transactional
public class TeacherMonthCheckServiceImpl implements ITeacherMonthCheckService {

	@Autowired
	private ITeacherMonthCheckDao teacherMonthCheckDao;

	@Override
	public void pageQuery(PageBean pageBean) {
		teacherMonthCheckDao.pageQuery(pageBean);
	}

	@Override
	public void save(TeacherMonthCheck teacherMonthCheck) {
		teacherMonthCheckDao.save(teacherMonthCheck);
	}

	@Override
	public void termQuery(TeacherMonthCheck model, PageBean pageBean, DetachedCriteria detachedCriteria,
			String start_year, String start_month, String end_year, String end_month, String status,
			String structure_id, String teacher_name) throws UnsupportedEncodingException {

		detachedCriteria = pageBean.getDetachedCriteria();
		detachedCriteria.setProjection(null);
		detachedCriteria.createAlias("teacher", "t");

		structure_id = new String(structure_id.getBytes("iso8859-1"), "utf-8");
		status = new String(status.getBytes("iso8859-1"), "utf-8");
		teacher_name = new String(teacher_name.getBytes("iso8859-1"), "utf-8");

		if (StringUtils.isNotBlank(structure_id)) {
			if (!"全部部门".equals(structure_id) && !"1".equals(structure_id)) {
				detachedCriteria.add(Restrictions.eq("t.structure_id", structure_id));
			}
		}
		// TODO
		// 暂时没做
		/*
		 * if (StringUtils.isNotBlank(check_status)) { if
		 * (!"全部状态".equals(check_status)) {
		 * detachedCriteria.add(Restrictions.eq("check_status", check_status));
		 * 
		 * } }
		 */
		if (StringUtils.isNotBlank(teacher_name)) {
			detachedCriteria.add(Restrictions.like("t.teacher_name", teacher_name + "%"));
		}

		String start_date = start_year + "-" + start_month + "-" + 1;
		String end_date = end_year + "-" + end_month + "-" + 31;
		if (StringUtils.isNotBlank(start_date) && StringUtils.isNotBlank(end_date)) {
			Date start_date_format = TimeUtil.getDate(start_date);
			Date end_date_format = TimeUtil.getDate(end_date);
			detachedCriteria.add(Restrictions.between("date_label_format", start_date_format, end_date_format));
		}

	}

	@Override
	public TeacherMonthCheck findById(String id) {
		return teacherMonthCheckDao.findById(id);
	}

	@Override
	public List<TeacherMonthCheck> findByMonthAndYear(String year_label, String month_label) {
		return teacherMonthCheckDao.findByMonthAndYear(year_label,month_label);
	}
}
