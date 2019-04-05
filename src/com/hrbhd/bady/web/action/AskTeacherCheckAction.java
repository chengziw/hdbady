package com.hrbhd.bady.web.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.domain.AskTeacherCheck;
import com.hrbhd.bady.service.IAskTeacherCheckService;
import com.hrbhd.bady.web.action.base.BaseAction;

@Controller
@Scope("prototype")
public class AskTeacherCheckAction extends BaseAction<AskTeacherCheck>{

	@Autowired
	private IAskTeacherCheckService askTeacherCheckService;
}
