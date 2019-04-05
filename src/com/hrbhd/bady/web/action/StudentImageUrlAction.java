package com.hrbhd.bady.web.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.domain.StudentImageUrl;
import com.hrbhd.bady.service.IStudentImageUrlService;
import com.hrbhd.bady.web.action.base.BaseAction;

@Controller
@Scope("prototype")
public class StudentImageUrlAction extends BaseAction<StudentImageUrl>{

	@Autowired
	private IStudentImageUrlService studentImageUrlService;
}
