package com.hrbhd.bady.web.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.util.StringUtil;
import org.apache.struts2.ServletActionContext;
import org.objectweb.asm.tree.IntInsnNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.domain.ClockConfig;
import com.hrbhd.bady.service.IClockConfigService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.web.action.base.BaseAction;

import net.sf.json.JSONObject;

@Controller
@Scope("prototype")
public class ClockConfigAction extends BaseAction<ClockConfig> {

	@Autowired
	private IClockConfigService clockConfigService;
	
	private String[] months;
	private String[] clock_days;

	public void setMonths(String[] months) {
		this.months = months;
	}

	public void setClock_days(String[] clock_days) {
		this.clock_days = clock_days;
	}

	public String query() throws IOException{

		List<ClockConfig> list = clockConfigService.findClockConfig();
		ClockConfig clockConfig = list.get(0);
		
		StringBuffer buffer = new StringBuffer();
		buffer.append("{\"errMeg\": \"\",\"result\": {");
		
		String month = clockConfig.getMonth();
		String[] clock_month = month.split(",");
		
		for(int i=0;i<12;i++){
			buffer.append("\"clock_month"+(i+1)+"\": "+clock_month[i]+",");
		}
		
		/*buffer.append("\"clock_month1\": "+clockConfig.getMonth1()+",");
		buffer.append("\"clock_month2\": "+clockConfig.getMonth2()+",");
		buffer.append("\"clock_month3\": "+clockConfig.getMonth3()+",");
		buffer.append("\"clock_month4\": "+clockConfig.getMonth4()+",");
		buffer.append("\"clock_month5\": "+clockConfig.getMonth5()+",");
		buffer.append("\"clock_month6\": "+clockConfig.getMonth6()+",");
		buffer.append("\"clock_month7\": "+clockConfig.getMonth7()+",");
		buffer.append("\"clock_month8\": "+clockConfig.getMonth8()+",");
		buffer.append("\"clock_month9\": "+clockConfig.getMonth9()+",");
		buffer.append("\"clock_month10\": "+clockConfig.getMonth10()+",");
		buffer.append("\"clock_month11\": "+clockConfig.getMonth11()+",");
		buffer.append("\"clock_month11\": "+clockConfig.getMonth12()+",");*/
		
		
		buffer.append("\"teacher_arrive_time\": \""+clockConfig.getTeacher_arrive_time()+"\",");
		buffer.append("\"teacher_leave_time\": \""+clockConfig.getTeacher_leave_time()+"\",");
		
		buffer.append("\"student_arrive_time\": \""+clockConfig.getStudent_arrive_time()+"\",");
		buffer.append("\"student_leave_time\": \""+clockConfig.getStudent_leave_time()+"\",");
		
		buffer.append("\"teacher_arrive_time\": \""+clockConfig.getTeacher_arrive_time()+"\",");
		buffer.append("\"teacher_arrive_time\": \""+clockConfig.getTeacher_arrive_time()+"\",");
		
		buffer.append("\"teacher_arrive_time\": \""+clockConfig.getTeacher_arrive_time()+"\",");
		buffer.append("\"teacher_arrive_time\": \""+clockConfig.getTeacher_arrive_time()+"\",");
		
		if("1".equals(clockConfig.getClock_day1())){
			buffer.append("\"clock_day1\": \"<span style=\\\"color: #CC0000\\\">休息</span>\",");
		}else{
			buffer.append("\"clock_day1\": \"正常\",");
		}
		if("1".equals(clockConfig.getClock_day2())){
			buffer.append("\"clock_day2\": \"<span style=\\\"color: #CC0000\\\">休息</span>\",");
		}else{
			buffer.append("\"clock_day2\": \"正常\",");
		}
		if("1".equals(clockConfig.getClock_day3())){
			buffer.append("\"clock_day3\": \"<span style=\\\"color: #CC0000\\\">休息</span>\",");
		}else{
			buffer.append("\"clock_day3\": \"正常\",");
		}
		if("1".equals(clockConfig.getClock_day4())){
			buffer.append("\"clock_day4\": \"<span style=\\\"color: #CC0000\\\">休息</span>\",");
		}else{
			buffer.append("\"clock_day4\": \"正常\",");
		}
		if("1".equals(clockConfig.getClock_day5())){
			buffer.append("\"clock_day5\": \"<span style=\\\"color: #CC0000\\\">休息</span>\",");
		}else{
			buffer.append("\"clock_day5\": \"正常\",");
		}
		if("1".equals(clockConfig.getClock_day6())){
			buffer.append("\"clock_day6\": \"<span style=\\\"color: #CC0000\\\">休息</span>\",");
		}else{
			buffer.append("\"clock_day6\": \"正常\",");
		}
		if("1".equals(clockConfig.getClock_day7())){
			buffer.append("\"clock_day7\": \"<span style=\\\"color: #CC0000\\\">休息</span>\",");
		}else{
			buffer.append("\"clock_day7\": \"正常\",");
		}
		
		if("1".equals(clockConfig.getTeacher_clock_type())){
			buffer.append("\"teacherClockType\": \"仅支持手机APP打卡\",");
		}else if("2".equals(clockConfig.getTeacher_clock_type())){
			buffer.append("\"teacherClockType\": \"仅支持考勤机打卡\",");
		}else{
			buffer.append("\"teacherClockType\": \"支持手机APP和考勤机打卡\",");
		}
		
		if("1".equals(clockConfig.getStudent_clock_type())){
			buffer.append("\"studentClockType\": \"仅支持手机APP打卡\",");
		}else if("2".equals(clockConfig.getTeacher_clock_type())){
			buffer.append("\"studentClockType\": \"仅支持考勤机打卡\",");
		}else{
			buffer.append("\"studentClockType\": \"支持手机APP和考勤机打卡\",");
		}
		
		buffer.append("\"studentSmsType\": 0,");
		buffer.append("\"studentWxType\": 1");
		
		buffer.append("}}");
		//for(int i=0;i<7;i++){
			//buffer.append("\"clock_day"+i+1+"\":");
			
		//}
		
		//JSONObject object = JSONObject.fromObject(clockConfig);
		String json = buffer.toString();
		JsonUtil.writeJson(json);
		
		return NONE;
	}
	
	public String editClockConfig() throws IOException {
		System.out.println(months);
		if (months != null) {
			for (String string : months) {
				System.out.println(string);
			}
		}
		clockConfigService.editClockConfig(model, months, clock_days);
		String json = "{\"errMeg\":\"\"}";
		JsonUtil.writeJson(json);

		return NONE;
	}

	public String edit() {

		List<ClockConfig> list = clockConfigService.findClockConfig();

		ClockConfig clockConfig = list.get(0);
		ServletActionContext.getContext().getValueStack().set("clockConfig", clockConfig);

		String month = clockConfig.getMonth();
		if (StringUtils.isNotBlank(month)) {
			String[] split1 = month.split(",");
			List<String> months = Arrays.asList(split1);
			ServletActionContext.getContext().put("months", months);
		}

		/*String clock_day = clockConfig.getClock_day();
		if (StringUtils.isNotBlank(clock_day)) {
			String[] split2 = clock_day.split(",");
			List<String> clock_days = Arrays.asList(split2);
			ServletActionContext.getContext().put("clock_days", clock_days);
		}*/
		
		/*List<String> week = new ArrayList<String>();
		week.add("星期一");
		week.add("星期二");
		week.add("星期三");
		week.add("星期四");
		week.add("星期五");
		week.add("星期六");
		week.add("星期天");
		ServletActionContext.getContext().put("week", week);*/
		
		return "edit";
	}
}
