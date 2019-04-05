package com.hrbhd.bady.web.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.domain.NoticeTeacherCheck;
import com.hrbhd.bady.service.INoticeTeacherCheckService;
import com.hrbhd.bady.web.action.base.BaseAction;

@Controller
@Scope("prototype")
public class NoticeTeacherCheckAction extends BaseAction<NoticeTeacherCheck>{

	@Autowired
	private INoticeTeacherCheckService noticeTeacherCheckService;
}
