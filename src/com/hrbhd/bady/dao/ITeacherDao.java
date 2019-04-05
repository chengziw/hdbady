package com.hrbhd.bady.dao;

import java.util.List;

import com.hrbhd.bady.dao.base.IBaseDao;
import com.hrbhd.bady.dao.base.impl.BaseDaoImpl;
import com.hrbhd.bady.domain.Structure;
import com.hrbhd.bady.domain.Teacher;

public interface ITeacherDao extends IBaseDao<Teacher>{

	public List findTeacher(String teacher_name);

	public List<Teacher> findByPhone(String phone);

	public List<Teacher> findByPhoneAndPassword(String phone, String password);

	public List<Teacher> findAllTeacherByStatus();

	public List<Teacher> findByDutyName(String duty_name);

	public List<Teacher> findByStructureName(String structure_name);

	public List<Teacher> findByStructure(Structure structure);

	public List<Teacher> findAllTeacherLikeTeacherName(String teacher_name);

	public List<Teacher> findAllTeacherByIdAndPassword(String id, String password);

	public List<Teacher> findByWorknumber(String worknumber);

	public List<Teacher> findAllTeacherByStatusAndName(String teacher_name);


}
