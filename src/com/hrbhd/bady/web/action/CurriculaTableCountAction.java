package com.hrbhd.bady.web.action;


import org.springframework.beans.factory.annotation.Autowired;

import com.hrbhd.bady.domain.CurriculaTableCount;
import com.hrbhd.bady.service.ICurriculaTableCountService;
import com.hrbhd.bady.web.action.base.BaseAction;

public class CurriculaTableCountAction extends BaseAction<CurriculaTableCount>{

	@Autowired
	private ICurriculaTableCountService curriculaTableCountService;
}
