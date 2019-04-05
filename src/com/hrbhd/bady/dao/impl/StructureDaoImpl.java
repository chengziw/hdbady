package com.hrbhd.bady.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.hrbhd.bady.dao.IStructureDao;
import com.hrbhd.bady.dao.base.impl.BaseDaoImpl;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.Structure;

@Repository
public class StructureDaoImpl extends BaseDaoImpl<Structure> implements IStructureDao {

	@Override
	public List<Structure> findByParentId(String parent_id) {

		Criteria criteria = getSession().createCriteria(Structure.class, "s");
		List list = criteria.add(Restrictions.eq("parent_id", parent_id)).list();

		return list;
	}

	@Override
	public List<Structure> findByName(String name) {

		Criteria criteria = getSession().createCriteria(Structure.class, "s");
		List list = criteria.add(Restrictions.eq("name", name)).list();

		return list;
	}

	@Override
	public Structure findByPId(String id) {
		Criteria criteria = getSession().createCriteria(Structure.class, "s");
		List list = criteria.add(Restrictions.eq("parent_id", id)).list();
		Structure structure = null;
		if(list!=null&&list.size()>0){
			structure = (Structure) list.get(0);
		}
		return structure;
	}

	@Override
	public Integer getMaxId() {
		Integer maxId=100;
		Criteria criteria = getSession().createCriteria(Structure.class, "s");
		List list = criteria.setProjection(Projections.projectionList().add(Projections.max("iid"))).list();
		if(list!=null){
			maxId = (Integer) list.get(0);
		}
		
		return maxId;
	}

}
