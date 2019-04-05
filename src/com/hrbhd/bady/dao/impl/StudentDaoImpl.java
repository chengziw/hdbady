package com.hrbhd.bady.dao.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.hrbhd.bady.dao.IStudentDao;
import com.hrbhd.bady.dao.base.impl.BaseDaoImpl;
import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.StudentChangeLog;

@Repository
public class StudentDaoImpl extends BaseDaoImpl<Student> implements IStudentDao {

	@Override
	public List findAllClass() {
		String sql = "SELECT DISTINCT class_id FROM t_student;";
		return getSession().createSQLQuery(sql).list();

	}

	@Override
	public List<Student> findStudentByStudent_noAndGrade_idAndClass_id(String student_no, String grade_id,
			String class_id) {

		Criteria criteria = getSession().createCriteria(Student.class, "s");

		if (StringUtils.isNotBlank(grade_id) && StringUtils.isNotBlank(class_id)) {
			criteria.add(Restrictions.eq("grade_id", grade_id));
			criteria.add(Restrictions.eq("class_id", class_id));
		}

		criteria.add(Restrictions.eq("student_no", student_no));

		List list = criteria.list();

		return list;
	}

	@Override
	public List<Student> findStudentNumberByGrade_idAndClass_id(String grade, String class_name) {
		Criteria criteria = getSession().createCriteria(Student.class, "s");
		criteria.add(Restrictions.eq("grade_id", grade));
		criteria.add(Restrictions.eq("class_id", class_name));
		List list = criteria.list();

		return list;
	}

	@Override
	public List<Student> findByGrade_idAndClass_id(String grade_id, String class_id) {
		Criteria criteria = getSession().createCriteria(Student.class, "s");
		criteria.add(Restrictions.eq("grade_id", grade_id));
		criteria.add(Restrictions.eq("class_id", class_id));
		List list = criteria.list();

		return list;
	}

	@Override
	public List<Student> findByClasses(Classes classes) {
		String id = classes.getId();
		Criteria criteria = getSession().createCriteria(Student.class, "s");
		criteria.add(Restrictions.eq("class_id", id));
		List list = criteria.list();
		return list;
	}

	@Override
	public List<Student> findStudentByStudent_noAndClasses(String student_no, String class_id) {
		Criteria criteria = getSession().createCriteria(Student.class, "s");
		if (StringUtils.isNotBlank(class_id)) {
			criteria.add(Restrictions.eq("class_id", class_id));
		}
		if (StringUtils.isNotBlank(student_no)) {
			criteria.add(Restrictions.eq("student_no", student_no));
		}
		List list = criteria.list();
		return list;
	}
	@Override
	public List<Student> findStudentByPhone(String phone) {
		Criteria criteria = getSession().createCriteria(Student.class, "s");
		if (StringUtils.isNotBlank(phone)) {
			criteria.add(Restrictions.eq("phone", phone));
		}
		List list = criteria.list();
		return list;
	}

	@Override
	public List<Student> finByLikeName(String student_name) {
		Criteria criteria = getSession().createCriteria(Student.class, "s");
		if(StringUtils.isNotBlank(student_name)){
			criteria.add(Restrictions.like("name", "%" + student_name + "%"));
		}
		criteria.add(Restrictions.eq("status_name", "3"));
		List list = criteria.list();
		return list;
	}

	@Override
	public List<Student> findByPhone(String phone) {
		Criteria criteria = getSession().createCriteria(Student.class, "s");
		criteria.add(Restrictions.eq("phone", phone));
		List list = criteria.list();
		return list;
	}

	@Override
	public List<Student> findByPhoneAndPassword(String phone, String password) {
		Criteria criteria = getSession().createCriteria(Student.class, "s");
		criteria.add(Restrictions.eq("phone", phone));
		criteria.add(Restrictions.eq("password", password));
		List list = criteria.list();
		return list;
	}

}
