package com.hrbhd.bady.dao.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.hrbhd.bady.dao.ITeacherDao;
import com.hrbhd.bady.dao.base.impl.BaseDaoImpl;
import com.hrbhd.bady.domain.Structure;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.util.PageBean;

@Repository
public class TeacherDaoImpl extends BaseDaoImpl<Teacher> implements ITeacherDao {

	@Override
	public List findTeacher(String teacher_name) {
		// String sql="SELECT teacher_name,sex_name,structure_name,duty_name
		// FROM t_teacher;";

		Criteria criteria = getSession().createCriteria(Teacher.class, "t");
		List list = criteria.add(Restrictions.like("teacher_name", "%" + teacher_name + "%")).list();

		/*
		 * String queryString =
		 * "from Teacher t where t.teacher_name like'%"+teacher_name+"%'"; List
		 * list = getSession().createQuery(queryString).list();
		 */

		return list;
	}

	@Override
	public List<Teacher> findByPhone(String phone) {
		Criteria criteria = getSession().createCriteria(Teacher.class, "t");
		List list = criteria.add(Restrictions.eq("phone", phone)).list();
		return list;
	}

	@Override
	public List<Teacher> findByPhoneAndPassword(String phone, String password) {
		Criteria criteria = getSession().createCriteria(Teacher.class, "t");

		criteria.add(Restrictions.eq("phone", phone));
		criteria.add(Restrictions.eq("password", password));
		System.out.println(password);
		List list = criteria.list();

		return list;
	}

	@Override
	public List<Teacher> findAllTeacherByStatus() {
		Criteria criteria = getSession().createCriteria(Teacher.class, "t");
		criteria.add(Restrictions.eq("status", "1"));
		criteria.add(Restrictions.ne("teacher_name", "admin"));
		List list = criteria.list();
		return list;
	}

	@Override
	public List<Teacher> findByDutyName(String duty_name) {
		Criteria criteria = getSession().createCriteria(Teacher.class, "t");
		List list = criteria.add(Restrictions.eq("duty_name", duty_name)).list();
		return list;
	}

	@Override
	public List<Teacher> findByStructureName(String structure_name) {
		Criteria criteria = getSession().createCriteria(Teacher.class, "t");
		List list = criteria.add(Restrictions.eq("structure_name", structure_name)).list();
		return list;
	}

	@Override
	public List<Teacher> findByStructure(Structure structure) {
		Criteria criteria = getSession().createCriteria(Teacher.class, "t");
		List list = criteria.add(Restrictions.eq("structure.id", structure.getId())).list();
		return list;
	}

	@Override
	public List<Teacher> findAllTeacherLikeTeacherName(String teacher_name) {
		Criteria criteria = getSession().createCriteria(Teacher.class, "t");
		criteria.add(Restrictions.ne("phone", "admin"));
		List list = criteria.add(Restrictions.like("teacher_name", "%" + teacher_name + "%")).list();
		return list;
	}

	@Override
	public List<Teacher> findAllTeacherByIdAndPassword(String id, String password) {
		Criteria criteria = getSession().createCriteria(Teacher.class, "t");
		criteria.add(Restrictions.eq("id", id));
		criteria.add(Restrictions.eq("password", password));
		List list = criteria.list();
		return list;
	}

	@Override
	public List<Teacher> findByWorknumber(String worknumber) {
		Criteria criteria = getSession().createCriteria(Teacher.class, "t");
		criteria.add(Restrictions.eq("worknumber", worknumber));
		List list = criteria.list();
		return list;
	}

	@Override
	public List<Teacher> findAllTeacherByStatusAndName(String teacher_name) {
		Criteria criteria = getSession().createCriteria(Teacher.class, "t");
		criteria.add(Restrictions.eq("status", "1"));
		if (StringUtils.isNotBlank(teacher_name)) {
			criteria.add(Restrictions.like("teacher_name", teacher_name+"%"));
		}
		criteria.add(Restrictions.ne("teacher_name", "admin"));
		List list = criteria.list();
		return list;
	}

}
