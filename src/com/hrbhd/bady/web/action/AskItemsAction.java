package com.hrbhd.bady.web.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.domain.AskItems;
import com.hrbhd.bady.service.IAskItemsService;
import com.hrbhd.bady.web.action.base.BaseAction;

@Controller
@Scope("prototype")
public class AskItemsAction extends BaseAction<AskItems>{

	@Autowired
	private IAskItemsService askItemsService;
	
	
}
