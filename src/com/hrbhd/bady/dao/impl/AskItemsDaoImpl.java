package com.hrbhd.bady.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.hrbhd.bady.dao.IAskItemsDao;
import com.hrbhd.bady.dao.base.impl.BaseDaoImpl;
import com.hrbhd.bady.domain.Ask;
import com.hrbhd.bady.domain.AskItems;
import com.hrbhd.bady.domain.Grade;

@Repository
public class AskItemsDaoImpl extends BaseDaoImpl<AskItems> implements IAskItemsDao{

}
