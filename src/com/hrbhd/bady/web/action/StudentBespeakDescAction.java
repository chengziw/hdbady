package com.hrbhd.bady.web.action;

import java.io.IOException;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.domain.StudentBespeak;
import com.hrbhd.bady.domain.StudentBespeakDesc;
import com.hrbhd.bady.domain.StudentChangeLog;
import com.hrbhd.bady.service.IGradeService;
import com.hrbhd.bady.service.IStudentBespeakDescService;
import com.hrbhd.bady.service.IStudentBespeakService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.TimeUtil;
import com.hrbhd.bady.web.action.base.BaseAction;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

@Controller
@Scope("prototype")
public class StudentBespeakDescAction extends BaseAction<StudentBespeakDesc> {

	@Autowired
	private IStudentBespeakDescService studentBespeakDescService;
	
	private String id;
	public void setId(String id) {
		this.id = id;
	}
	
	private String page;
	private String rows;
	
	public void setPage(String page) {
		this.page = page;
	}
	public void setRows(String rows) {
		this.rows = rows;
	}
	
	public String addDesc() throws IOException{
		
		studentBespeakDescService.addDesc(model);
		
		String json="{\"status\":1,\"info\":[]}";
		JsonUtil.writeJson(json);
		
		return NONE;
	}
	
	public String PageQuery() throws IOException{
		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));
			
		detachedCriteria = pageBean.getDetachedCriteria();
		
		String id = model.getId();
		detachedCriteria.add(Restrictions.eq("bespeak_id", id));
		
		studentBespeakDescService.pageQuery(pageBean);
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] { "studentBespeak"});
		JSONArray jsonObject = JSONArray.fromObject(pageBean.getRows(), jsonConfig);
		int total = pageBean.getTotal();
		
		//String json = "{\"total\":1,\"rows\":[{\"id\":\"13\",\"bespeak_id\":\"33\",\"teacher_id\":\"1\",\"desctext\":\"\u53d1\u7684\",\"create_time\":\"1485843251\",\"teacher_name\":\"\u5510\u56fd\u8f89(18565689925)\",\"teacher_phone\":\"18565689925\",\"create_time_name\":\"2017-01-31 14:14:11\"}]}";	
		String json1= "{\"total\":"+total+",\"rows\":";
		String json2 = jsonObject.toString();
		String json3 = "}";
		String json = json1 + json2 + json3;
		JsonUtil.writeJson(json);
		System.out.println(json);

		
		return NONE;
	}
	
	
}
