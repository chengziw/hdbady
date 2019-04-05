package com.hrbhd.bady.web.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.domain.AskStudentCheck;
import com.hrbhd.bady.service.IAskStudentCheckService;
import com.hrbhd.bady.web.action.base.BaseAction;

@Controller
@Scope("prototype")
public class AskStudentCheckAction extends BaseAction<AskStudentCheck>{

	@Autowired
	private IAskStudentCheckService askStudentCheckService;
}
