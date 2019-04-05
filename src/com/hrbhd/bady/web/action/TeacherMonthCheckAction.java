package com.hrbhd.bady.web.action;

import java.io.IOException;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.ClockConfig;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.Structure;
import com.hrbhd.bady.domain.StudentCheck;
import com.hrbhd.bady.domain.StudentMonthCheck;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.domain.TeacherCheck;
import com.hrbhd.bady.domain.TeacherDuty;
import com.hrbhd.bady.domain.TeacherMonthCheck;
import com.hrbhd.bady.service.IClockConfigService;
import com.hrbhd.bady.service.ITeacherCheckService;
import com.hrbhd.bady.service.ITeacherMonthCheckService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.TimeUtil;
import com.hrbhd.bady.web.action.base.BaseAction;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

@Controller
@Scope("prototype")
public class TeacherMonthCheckAction extends BaseAction<TeacherMonthCheck> {

	@Autowired
	private ITeacherMonthCheckService teacherMonthCheckService;
	@Autowired
	private IClockConfigService clockConfigService;
	@Autowired
	private ITeacherCheckService teacherCheckService;

	private String page;
	private String rows;
	private String tag;

	private String syear;
	private String smonth;

	private String start_month;
	private String start_year;
	private String end_month;

	private String end_year;
	private String status;
	private String teacher_name;

	private String structure_id;
	private String teacher_id;
	private String check_time;

	public void setPage(String page) {
		this.page = page;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public void setSyear(String syear) {
		this.syear = syear;
	}

	public void setSmonth(String smonth) {
		this.smonth = smonth;
	}

	public void setStart_year(String start_year) {
		this.start_year = start_year;
	}

	public void setStart_month(String start_month) {
		this.start_month = start_month;
	}

	public void setEnd_year(String end_year) {
		this.end_year = end_year;
	}

	public void setEnd_month(String end_month) {
		this.end_month = end_month;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setStructure_id(String structure_id) {
		this.structure_id = structure_id;
	}

	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}

	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}

	public void setCheck_time(String check_time) {
		this.check_time = check_time;
	}

	public String pageQuery() throws IOException {

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));

		detachedCriteria = pageBean.getDetachedCriteria();
		detachedCriteria.setProjection(null);
		detachedCriteria.createAlias("teacher", "t");
		detachedCriteria.add(Restrictions.ne("t.phone", "admin"));
		
		if ("1".equals(tag)) {
			teacherMonthCheckService.termQuery(model, pageBean, detachedCriteria, start_year, start_month, end_year,
					end_month, status, structure_id, teacher_name);
		}
		teacherMonthCheckService.pageQuery(pageBean);

		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[] { "teacherChecks", "date_label_format" });
		config.setJsonPropertyFilter(new PropertyFilter() {

			@Override
			public boolean apply(Object source, String name, Object value) {
				if (source instanceof Teacher && name.equals("roles")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("asks")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("notices")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("teacherVacations")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("teacherChecks")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("teacherMonthChecks")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("teachers")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("entry_time_name_date")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("classes")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("askTeacherChecks")) {
					return true;
				}
				if (source instanceof Teacher && name.equals("classes")) {
					return true;
				}
				if (source instanceof TeacherDuty && name.equals("teachers")) {
					return true;
				}
				if (source instanceof Structure && name.equals("teachers")) {
					return true;
				}

				return false;
			}
		});

		JSONArray jsonObject = JSONArray.fromObject(pageBean.getRows(), config);

		int total = pageBean.getTotal();

		String json1 = "{\"total\":" + total + ",\"rows\":";
		String json2 = jsonObject.toString();
		String json3 = "}";
		String json = json1 + json2 + json3;
		JsonUtil.writeJson(json);
		return NONE;
	}

	public String about() {

		String id = model.getId();
		TeacherMonthCheck teacherMonthCheck = teacherMonthCheckService.findById(id);
		ServletActionContext.getContext().getValueStack().set("teacherMonthCheck", teacherMonthCheck);

		List<ClockConfig> list = clockConfigService.findClockConfig();
		ClockConfig clockConfig = list.get(0);
		String month = clockConfig.getMonth();
		String[] clock_month = month.split(",");
		int currentMonth = TimeUtil.getCurrentMonth();
		String monthMustCome = clock_month[currentMonth - 1];
		ServletActionContext.getContext().getValueStack().set("monthMustCome", monthMustCome);

		return "about";
	}

	/**原因 ,页面刚打开,id值为空.
	 * 
	 * nopoint,
	 * @return
	 * @throws IOException
	 */
	
	public String aboutTeacherMonthCheck() throws IOException {

		/*String syear = "2017";
		String smonth = "4";*/
		
		List<ClockConfig> clist = clockConfigService.findClockConfig();
		ClockConfig clockConfig = clist.get(0);
		String cmonth = clockConfig.getMonth();
		String[] clock_month = cmonth.split(",");
		String monthMustCome = clock_month[Integer.parseInt(smonth)-1];
		ServletActionContext.getContext().getValueStack().set("monthMustCome", monthMustCome);
		
		//实际
		List<TeacherCheck> status0 =  teacherCheckService.findByTeacherAndStatus(teacher_id,smonth);
		ServletActionContext.getContext().getValueStack().set("status0", status0);
		//正常
		List<TeacherCheck> status1 =  teacherCheckService.findByTeacherAndStatus(teacher_id,smonth,"0","0");
		ServletActionContext.getContext().getValueStack().set("status1", status1);
		//迟到
		List<TeacherCheck> status2 =  teacherCheckService.findByTeacherAndStatus(teacher_id,smonth,"4","");
		ServletActionContext.getContext().getValueStack().set("status2", status2);
		//早退
		List<TeacherCheck> status3 =  teacherCheckService.findByTeacherAndStatus(teacher_id,smonth,"","4");
		ServletActionContext.getContext().getValueStack().set("status3", status3);
		
		
		String id = model.getId();
		TeacherMonthCheck teacherMonthCheck = teacherMonthCheckService.findById(id);
		// ServletActionContext.getContext().getValueStack().set("studentMonthCheck",
		// studentMonthCheck);

		StringBuffer buffer = new StringBuffer();
		buffer.append("{\"status\": 1,\"info\": [");
		//找到此学生这一个月的出勤内容
		//Set<StudentCheck> studentChecks = studentMonthCheck.getStudentChecks();
		//List<StudentCheck> list = new ArrayList<StudentCheck>(studentChecks);
		//List<StudentCheck> list = studentCheckService.getMonthCheckStudent(syear,smonth);
		List<TeacherCheck> list = teacherCheckService.findTeacherCheckByYearAndMonthAndTeacherId(syear,smonth,teacher_id);

		// 某月第一天是星期几
		int firstDayToWeek = TimeUtil.getWhereDayWhereMonthToWeek(syear + "-" + smonth + "-" + "1");
		// 某年
		int year = Integer.parseInt(syear);
		// 某月
		int month = Integer.parseInt(smonth);
		// 当月有多少天
		int monthDay = TimeUtil.getMonthLastDay(year, month);
		// 某月的前一个月有多少天
		int lastMonthDay = TimeUtil.getMonthLastDay(year, month - 1);
		
		
		//设置教师考勤页面上面的几个参数
		/*String currentClockDay = clockConfig.getClockDay(month);
		teacherCheckService.findByTeacherAndMonth(teacher, month+"")*/

		for (int i = 0; i < firstDayToWeek - 1; i++) {

			int dateDay = lastMonthDay - firstDayToWeek + 2 + i;
			int dateMonth = month - 1;
			if(month==1){
				dateMonth=12;
			}
			String dateTime = "";
			String showStstus = "pre";

			buffer.append("{");
			buffer.append("\"dateTime\": \"\",");
			buffer.append("\"dateMonth\": \"" + dateMonth + "\",");
			buffer.append("\"dateDay\": \"" + dateDay + "\",");
			buffer.append("\"showStstus\": \"pre\"");
			buffer.append("},");
		}
		List<String> clockDayList = clockConfig.getClockDayList();

		for (int i = 0; i < monthDay; i++) {
			//TODO
			//判断是周几,设置周几休息就......
			//休息日,请假,缺卡,来了
			// 0 , 1 , 2 , 
			buffer.append("{");
			if (list!=null&&list.size()>0&&list.get(i) != null) {
				buffer.append("\"day_label\": \"" + list.get(i).getDate_label() + "\",");
				buffer.append("\"week_label\": \"" + list.get(i).getWeek_label() + "\",");
				buffer.append("\"dateMonth\": \"" + list.get(i).getMonth_label() + "\",");
				buffer.append("\"dateDay\": \""+list.get(i).getDay_label()+"\",");
				buffer.append("\"status\": \"" + list.get(i).getStatus() + "\",");
				buffer.append("\"up_status\": \"" + list.get(i).getUp_status() + "\",");
				buffer.append("\"down_status\": \"" + list.get(i).getDown_status() + "\",");
				buffer.append("\"arrive_time\": \"" + list.get(i).getArrive_time() + "\",");
				buffer.append("\"arrive_status\": \"" + list.get(i).getArrive_status() + "\",");
				buffer.append("\"leave_time\": \"" + list.get(i).getLeave_time() + "\",");
				buffer.append("\"leave_status\": \"" + list.get(i).getLeave_status() + "\"");
				buffer.append("},");
			}else{
				buffer.append("\"day_label\": \"\",");
				buffer.append("\"week_label\": \"\",");
				buffer.append("\"dateMonth\": \"\",");
				buffer.append("\"dateDay\": \"\",");
				buffer.append("\"status\": \"11\",");
				buffer.append("\"up_status\": \"\",");
				buffer.append("\"down_status\": \"\",");
				buffer.append("\"arrive_time\": \"\",");
				buffer.append("\"arrive_status\": \"\",");
				buffer.append("\"leave_time\": \"\",");
				buffer.append("\"leave_status\": \"\"");
				buffer.append("},");
			}
		}
		//某月最后一天
		String lastDay = TimeUtil.getMonthLastDay(year,month)+"";
		// 注意:周日是0
		// 某月最后一天是星期几
		int lastDayToWeek = TimeUtil.getWhereDayWhereMonthToWeek(syear + "-" + smonth + "-" + lastDay);
		for (int i = 0; i <= 6 - lastDayToWeek; i++) {

			int dateDay = i + 1;
			int dateMonth = month + 1;
			if(month==12){
				dateMonth=1;
			}
			String dateTime = "";
			String showStstus = "pre";

			buffer.append("{");
			buffer.append("\"dateTime\":\"\",");
			buffer.append("\"dateMonth\": \"" + dateMonth + "\",");
			buffer.append("\"dateDay\": \"" + dateDay + "\",");
			buffer.append("\"showStstus\": \"next\"");
			if (i == 6 - lastDayToWeek) {
				buffer.append("}");
			} else {
				buffer.append("},");
			}
		}
		buffer.append("]}");

		String json = buffer.toString();
		JsonUtil.writeJson(json);
		System.out.println(json);

		return NONE;
	}

	/**
	 * 手机端操作
	 */
	public String t_teacherMonthCheck() {

		return "t_teacherMonthCheck";
	}

	/**
	 * 把它放到TeacherMonthCheck中更为合理 教师端考勤记录页面数据的查询
	 * 
	 * @return
	 * @throws IOException
	 */
	public String t_pageQuery() throws IOException {

		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginTeacher");
		List<TeacherCheck> teacherChecks = teacherCheckService.findByTeacherAndMonth(teacher, check_time);

		StringBuffer buffer = new StringBuffer();
		buffer.append("{\"daylist\":[");

		for (int i = 0; i < teacherChecks.size(); i++) {
			TeacherCheck teacherCheck = teacherChecks.get(i);
			String status = teacherCheck.getStatus();

			buffer.append("{");

			buffer.append("\"day\":" + teacherCheck.getDay_label() + ",");
			buffer.append("\"morningStatus\":" + teacherCheck.getMorningStatus() + ",");
			buffer.append("\"morningStatusLabel\":\"" + teacherCheck.getArrive_status() + "\",");
			buffer.append("\"arriveTime\":\"" + teacherCheck.getArrive_time() + "\",");
			buffer.append("\"afternoonStatus\":" + teacherCheck.getAfternoonStatus() + ",");
			buffer.append("\"afternoonStatusLabel\":\"" + teacherCheck.getLeave_status() + "\",");
			buffer.append("\"leaveTime\":\"" + teacherCheck.getLeave_time() + "\"");

			if (i == teacherChecks.size() - 1) {
				buffer.append("}");
			} else {
				buffer.append("},");
			}
		}

		buffer.append("]}");

		String json = buffer.toString();
		JsonUtil.writeJson(json);

		return NONE;
	}

}
