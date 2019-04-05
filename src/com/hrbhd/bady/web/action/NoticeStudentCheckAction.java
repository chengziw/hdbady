package com.hrbhd.bady.web.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.dao.base.impl.BaseDaoImpl;
import com.hrbhd.bady.domain.NoticeStudentCheck;
import com.hrbhd.bady.service.INoticeStudentCheckService;
import com.hrbhd.bady.web.action.base.BaseAction;

@Controller
@Scope("prototype")
public class NoticeStudentCheckAction extends BaseAction<NoticeStudentCheck>{

	@Autowired
	private INoticeStudentCheckService noticeStudentCheckService;
}
