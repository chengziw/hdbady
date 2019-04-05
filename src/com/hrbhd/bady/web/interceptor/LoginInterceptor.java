package com.hrbhd.bady.web.interceptor;

import org.apache.struts2.ServletActionContext;

import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.Teacher;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class LoginInterceptor extends MethodFilterInterceptor {

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {

		StringBuffer requestURL = ServletActionContext.getRequest().getRequestURL();
		String url = requestURL.toString();

		if(url.contains("page")){
			return invocation.invoke();
		}
		if(url.contains("teacherLogin")){
			return invocation.invoke();
		}
		if(url.contains("parentLogin")){
			return invocation.invoke();
		}
		
		int index = url.lastIndexOf("_");
		String substring = url.substring(index - 1);
		substring = substring.substring(0, 1);

		if ("t".equals(substring)) {
			Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginTeacher");
			if (teacher == null) {
				return "teacherLogin";
			}

		} else if ("p".equals(substring)) {
			Student student = (Student) ServletActionContext.getRequest().getSession().getAttribute("loginParent");
			if (student == null) {
				return "parentLogin";
			}
			
		}
		return invocation.invoke();

	}

}
