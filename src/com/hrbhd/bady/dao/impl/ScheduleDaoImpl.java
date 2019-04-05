package com.hrbhd.bady.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.hrbhd.bady.dao.IScheduleDao;
import com.hrbhd.bady.dao.base.impl.BaseDaoImpl;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.Schedule;

@Repository
public class ScheduleDaoImpl extends BaseDaoImpl<Schedule> implements IScheduleDao{


}
