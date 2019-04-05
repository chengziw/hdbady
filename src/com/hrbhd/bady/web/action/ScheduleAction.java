package com.hrbhd.bady.web.action;

import java.io.IOException;

import java.nio.Buffer;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.objectweb.asm.tree.IntInsnNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.domain.Schedule;
import com.hrbhd.bady.service.IGradeService;
import com.hrbhd.bady.service.IScheduleService;
import com.hrbhd.bady.service.IStudentService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.ScheduleTime;
import com.hrbhd.bady.web.action.base.BaseAction;

import net.sf.json.JSONArray;

@Controller
@Scope("prototype")
public class ScheduleAction extends BaseAction<Schedule> {

	@Autowired
	private IScheduleService scheduleService;
	
	@Autowired
	private IStudentService studentService;
	
	private String page;
	private String rows;

	private String[] start_times;
	private String[] end_times;
	/*
	 * private List start_time; private List end_time;
	 */

	public void setPage(String page) {
		this.page = page;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	public void setStart_times(String[] start_times) {
		this.start_times = start_times;
	}
	
	public void setEnd_times(String[] end_times) {
		this.end_times = end_times;
	}
	
	/*
	 * public void setStart_time(List start_time) { this.start_time =
	 * start_time; }
	 * 
	 * public void setEnd_time(List end_time) { this.end_time = end_time; }
	 */

	public String pageQuery() throws IOException {

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));

		studentService.pageQuery(pageBean);

		JSONArray jsonObject = JSONArray.fromObject(pageBean.getRows());

		int total = pageBean.getTotal();

		String json1 = "{\"total\":" + total + ",\"rows\":";
		String json2 = jsonObject.toString();
		String json3 = "}";
		String json = json1 + json2 + json3;
		JsonUtil.writeJson(json);

		return NONE;
	}

	public String edit() {
		
		String id = model.getId();
		Schedule schedule = scheduleService.findById(id);
		ServletActionContext.getContext().getValueStack().set("schedule", schedule);
		
		String start_time = schedule.getStart_time();
		String end_time = schedule.getEnd_time();
		
		String[] split1 = start_time.split(",");
		String[] split2 = end_time.split(",");
		
		List<ScheduleTime> list = new ArrayList();
		for (int i = 0; i < split1.length; i++) {
			ScheduleTime scheduleTime = new ScheduleTime(split1[i],split2[i]);
			list.add(scheduleTime);
		}
		ServletActionContext.getContext().put("list", list);
		System.out.println(list);
		
		return "edit";
	}

	public String editSchedule() throws IOException {
		
	    scheduleService.editSchedule(model, start_times, end_times);
		String json = "{\"errMeg\":\"\"}";
		JsonUtil.writeJson(json);

		return NONE;
	}

}
