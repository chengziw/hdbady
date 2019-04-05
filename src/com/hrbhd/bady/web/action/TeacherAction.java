package com.hrbhd.bady.web.action;

import java.io.File;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.security.KeyStore.PrivateKeyEntry;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.util.StringUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.struts2.ServletActionContext;
import org.apache.xmlbeans.impl.xb.xsdschema.RestrictionDocument.Restriction;
import org.apache.xmlbeans.impl.xb.xsdschema.impl.PublicImpl;
import org.aspectj.apache.bcel.generic.ReturnaddressType;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.hql.ast.tree.MapEntryNode;
import org.hibernate.type.SetType;
import org.junit.validator.PublicClassValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.domain.Ask;
import com.hrbhd.bady.domain.AskTeacherCheck;
import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.CurriculaTableItem;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.Notice;
import com.hrbhd.bady.domain.NoticeTeacherCheck;
import com.hrbhd.bady.domain.School;
import com.hrbhd.bady.domain.Structure;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.StudentCheck;
import com.hrbhd.bady.domain.StudentVacation;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.domain.TeacherDuty;
import com.hrbhd.bady.service.IAskService;
import com.hrbhd.bady.service.IAskTeacherCheckService;
import com.hrbhd.bady.service.IClassesService;
import com.hrbhd.bady.service.ICurriculaTableItemService;
import com.hrbhd.bady.service.INoticeService;
import com.hrbhd.bady.service.INoticeTeacherCheckService;
import com.hrbhd.bady.service.ISchoolService;
import com.hrbhd.bady.service.IStructureService;
import com.hrbhd.bady.service.IStudentCheckService;
import com.hrbhd.bady.service.IStudentService;
import com.hrbhd.bady.service.IStudentVacationService;
import com.hrbhd.bady.service.ITeacherChangeLogService;
import com.hrbhd.bady.service.ITeacherDutyService;
import com.hrbhd.bady.service.ITeacherService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.MD5Utils;
import com.hrbhd.bady.util.TimeUtil;
import com.hrbhd.bady.web.action.base.BaseAction;
import com.mchange.v2.async.StrandedTaskReporting;
import com.opensymphony.xwork2.ActionContext;

import freemarker.cache.StrongCacheStorage;
import freemarker.core.ReturnInstruction;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;
import net.sf.json.util.PropertyFilter;

@Controller
@Scope("prototype")
public class TeacherAction extends BaseAction<Teacher> {

	@Autowired
	private ITeacherService teacherService;
	@Autowired
	private IStructureService structureService;
	@Autowired
	private ITeacherDutyService teacherDutyService;
	@Autowired
	private ICurriculaTableItemService curriculaTableItemService;
	@Autowired
	private ITeacherChangeLogService teacherChangeLogService;
	@Autowired
	private IStudentCheckService studentCheckService;
	@Autowired
	private IStudentVacationService studentVacationService;
	@Autowired
	private INoticeTeacherCheckService noticeTeacherCheckService;
	@Autowired
	private IAskTeacherCheckService askTeacherCheckService;
	@Autowired
	private INoticeService noticeService;
	@Autowired
	private IClassesService classesService;
	@Autowired
	private ISchoolService schoolService;

	private static final String TEACHER_ADD = "入职";
	private static final String TEACHER_VACATION = "休假";
	private static final String TEACHER_LEAVE = "离职";
	private static final String TEACHER_RETIRE = "退休";
	private static final String TEACHER_RESUME = "复职";
	private static final String TEACHER_SHIFT = "调动";

	private String page;
	private String rows;
	private String[] subject_id;
	private File file;
	private String fileText;
	private String duty_id;
	private String entry_time_start;
	private String entry_time_end;
	private String tag;
	private String new_password;
	private String new_password_copy;

	private String rememberMe;
	private File[] fileselect;
	private String student_id;

	private String type;
	private String flag;

	public void setPage(String page) {
		this.page = page;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	public void setSubject_id(String[] subject_id) {
		this.subject_id = subject_id;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public void setFileText(String fileText) {
		this.fileText = fileText;
	}

	public void setDuty_id(String duty_id) {
		this.duty_id = duty_id;
	}

	public void setEntry_time_start(String entry_time_start) {
		this.entry_time_start = entry_time_start;
	}

	public void setEntry_time_end(String entry_time_end) {
		this.entry_time_end = entry_time_end;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public void setNew_password(String new_password) {
		this.new_password = new_password;
	}

	public void setNew_password_copy(String new_password_copy) {
		this.new_password_copy = new_password_copy;
	}

	public void setRememberMe(String rememberMe) {
		this.rememberMe = rememberMe;
	}

	public void setFileselect(File[] fileselect) {
		this.fileselect = fileselect;
	}

	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String pageQuery() throws IOException {

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));

		if ("1".equals(tag)) {
			teacherService.termQuery(model, pageBean, detachedCriteria, entry_time_start, entry_time_end);
		}

		detachedCriteria.add(Restrictions.ne("phone", "admin"));

		teacherService.pageQuery(pageBean);

		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[] { "roles", "asks", "notices", "teacherVacations", "teacherChecks",
				"teacherMonthChecks", "teachers", "entry_time_name_date", "classes", "askTeacherChecks" });
		config.setJsonPropertyFilter(new PropertyFilter() {

			@Override
			public boolean apply(Object source, String name, Object value) {
				if (source instanceof TeacherDuty && name.equals("teachers")) {
					return true;
				}
				if (source instanceof Structure && name.equals("teachers")) {
					return true;
				}

				return false;
			}
		});

		/*
		 * config.setExcludes(new String[] { "roles" , "notices", "teachers"});
		 * config.setIgnoreDefaultExcludes(false);
		 * config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		 */

		JSONArray jsonObject = JSONArray.fromObject(pageBean.getRows(), config);

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
		Teacher teacher = teacherService.findById(id);
		Classes classes = teacher.getClasses();
		String subject_id = teacher.getSubject_id();
		if (StringUtils.isNotBlank(subject_id)) {
			String[] split = subject_id.split(",");
			List<String> subject_ids = Arrays.asList(split);
			ServletActionContext.getContext().put("subject_ids", subject_ids);
		}
		ActionContext.getContext().getValueStack().set("teacher", teacher);

		List<CurriculaTableItem> list = curriculaTableItemService.findByTeacherId(id);
		ActionContext.getContext().getValueStack().set("list", list);

		return "edit";
	}

	public String vacation() {

		String id = model.getId();
		Teacher teacher = teacherService.findById(id);
		ActionContext.getContext().getValueStack().set("teacher", teacher);
		return "vacation";
	}

	public String shift() {

		String id = model.getId();
		Teacher teacher = teacherService.findById(id);
		ActionContext.getContext().getValueStack().set("teacher", teacher);
		return "shift";
	}

	public String retireOrLeave() {

		String id = model.getId();
		Teacher teacher = teacherService.findById(id);
		ActionContext.getContext().getValueStack().set("teacher", teacher);
		return "retireOrLeave";
	}

	public String power() {

		String id = model.getId();
		Teacher teacher = teacherService.findById(id);
		ActionContext.getContext().getValueStack().set("teacher", teacher);
		return "power";
	}

	public String about() {

		String id = model.getId();
		Teacher teacher = teacherService.findById(id);
		ActionContext.getContext().getValueStack().set("teacher", teacher);
		return "about";
	}

	public String addTeacher() throws IOException {

		String json = "";
		String phone = model.getPhone();
		List<Teacher> teachers = teacherService.findByPhone(phone);
		if (teachers != null && teachers.size() > 0) {
			json = "{\"status\":0,\"info\":\"您输入的手机号码已经存在\"}";
			JsonUtil.writeJson(json);
			return NONE;
		}
		String worknumber = model.getWorknumber();
		List<Teacher> worknumbers = teacherService.findByWorknumber(worknumber);
		if (worknumbers != null && worknumbers.size() > 0) {
			json = "{\"status\":0,\"info\":\"您输入的工号已经存在\"}";
			JsonUtil.writeJson(json);
			return NONE;
		}

		model.setStatus("1");
		model.setStatus_name("正常在校");
		model.setEntry_time_name(TimeUtil.getCurrentDay());
		String password = model.getPassword();
		if (password != null) {
			password = MD5Utils.md5(password);
		 	model.setPassword(password);
		}
		String sid = model.getStructure_id();
		String tid = model.getDuty_id();
		Structure structure = structureService.findById(sid);
		TeacherDuty teacherDuty = teacherDutyService.findById(tid);
		model.setStructure(structure);
		model.setTeacherDuty(teacherDuty);
		model.setEntry_time_name(TimeUtil.getCurrentDay());
		model.setCreate_time_name(TimeUtil.getCurrentDay());

		teacherService.addTeacher(model, TEACHER_ADD);

		json = "{\"status\":1,\"info\":\"保存成功\"}";
		JsonUtil.writeJson(json);
		return NONE;
	}

	public String resume() throws IOException {
		String id = model.getId();
		Teacher teacher = teacherService.findById(id);
		ActionContext.getContext().getValueStack().set("teacher", teacher);
		return "resume";
	}

	public String multiplex() throws IOException {
		String id = model.getId();
		Teacher teacher = teacherService.findById(id);
		ActionContext.getContext().getValueStack().set("teacher", teacher);
		return "multiplex";
	}

	public String leaveTeacher() throws IOException {

		teacherService.leaveTeacher(model, TEACHER_LEAVE);
		String json = JsonUtil.HANDLE_SUCCESS;
		JsonUtil.writeJson(json);
		return NONE;
	}

	public String retireTeacher() throws IOException {

		teacherService.retireTeacher(model, TEACHER_RETIRE);
		String json = JsonUtil.HANDLE_SUCCESS;
		JsonUtil.writeJson(json);
		return NONE;
	}

	public String editTeacher() throws IOException {

		String json = "";
		String id = model.getId();
		Teacher teacher = teacherService.findById(id);
		String dbPhone = teacher.getPhone();
		String phone = model.getPhone();
		String DBworknumber = teacher.getWorknumber();
		String worknumber = model.getWorknumber();
		List<Teacher> teachers = teacherService.findByPhone(phone);

		if (!phone.equals(dbPhone) && teachers != null && teachers.size() > 0) {
			json = "{\"status\":0,\"info\":\"您输入的手机号码已经存在\"}";
			JsonUtil.writeJson(json);
			return NONE;
		}
		
		List<Teacher> worknumbers = teacherService.findByWorknumber(worknumber);
		if (!worknumber.equals(DBworknumber)&&worknumbers != null && worknumbers.size() > 0) {
			json = "{\"status\":0,\"info\":\"您输入的工号已经存在\"}";
			JsonUtil.writeJson(json);
			return NONE;
		}

		teacherService.editTeacher(model);
		json = JsonUtil.HANDLE_SUCCESS;
		JsonUtil.writeJson(json);
		return NONE;
	}

	public String vacationTeacher() throws IOException {
		teacherService.vacationTeacher(model, TEACHER_VACATION);
		String json = JsonUtil.HANDLE_SUCCESS;
		JsonUtil.writeJson(json);
		return NONE;
	}

	public String shiftTeacher() throws IOException {
		teacherService.shiftTeacher(model, TEACHER_SHIFT);
		String json = JsonUtil.HANDLE_SUCCESS;
		JsonUtil.writeJson(json);
		return NONE;
	}

	public String resumeTeacher() throws IOException {
		teacherService.resumeTeacher(model, TEACHER_RESUME);
		String json = JsonUtil.HANDLE_SUCCESS;
		JsonUtil.writeJson(json);
		return NONE;
	}

	public String multiplexTeacher() throws IOException {
		teacherService.multiplexTeacher(model);
		String json = JsonUtil.HANDLE_SUCCESS;
		JsonUtil.writeJson(json);
		return NONE;
	}

	public String resolveTeacher() throws FileNotFoundException, IOException {

		List<Teacher> list = teacherService.resolveTeacher(model, file);

		String json = "";
		String json1 = "{\"status\": 1,\"info\": {\"total\": 3,\"rows\": ";
		String json3 = "}}";
		JSONArray jsonObject = JSONArray.fromObject(list);
		String json2 = jsonObject.toString();
		json = json1 + json2 + json3;

		JsonUtil.writeJson(json);

		return NONE;
	}

	public String importStudent() throws IOException {
		List<Teacher> list = teacherService.resolveTeacher(model, file);

		for (Teacher teacher : list) {
			teacherService.save(teacher);
		}
		String json = "{\"status\": 1,\"info\": {\"total\": 3,\"rows\": }}";
		JsonUtil.writeJson(json);
		return NONE;
	}

	public String findTeacher() throws IOException {

		// List list = teacherService.findAll();

		String teacher_name = model.getTeacher_name();
		List list = teacherService.findTeacher(teacher_name);

		System.out.println(list);
		JSONArray jsonObject = JSONArray.fromObject(list);

		/*
		 * StringBuffer buffer = new StringBuffer(); for(int
		 * i=0;i<list.size();i++){ Object teacher = list.get(i); JSONObject
		 * object = JSONObject.fromObject(teacher);
		 * buffer.append(object.toString()); if(i==list.size()-1){ continue; }
		 * buffer.append(","); }
		 */

		int total = list.size();

		String json1 = "{\"total\":" + total + ",\"rows\":";
		String json2 = jsonObject.toString();
		// String json2=buffer.toString();
		String json3 = "}";
		String json = json1 + json2 + json3;
		JsonUtil.writeJson(json);

		return NONE;
	}

	public String findAllTeacherByStatus() throws IOException {

		List<Teacher> list = teacherService.findAllTeacherByStatus();
		if (list != null && list.size() > 0) {
			StringBuffer buffer = new StringBuffer();
			buffer.append("[{\"id\":\"\",\"text\":\"请选择老师\"},");
			// buffer.append("[");
			for (int i = 0; i < list.size(); i++) {
				buffer.append(
						"{\"id\":\"" + list.get(i).getId() + "\",\"text\":\"" + list.get(i).getTeacher_name() + "\"},");
				if (i == list.size() - 1) {
					buffer.append("{\"id\":\"" + list.get(i).getId() + "\",\"text\":\"" + list.get(i).getTeacher_name()
							+ "\"}");
				}
			}

			buffer.append("]");
			String json = buffer.toString();
			JsonUtil.writeJson(json);
			System.out.println(json);
		}

		return NONE;

	}

	public String findAllTeacherToClassAdd() throws IOException {

		String teacher_name = model.getTeacher_name();
		List<Teacher> list = teacherService.findAllTeacherByStatusAndName(teacher_name);
		if (list != null && list.size() > 0) {
			StringBuffer buffer = new StringBuffer();
			/*
			 * buffer.append(
			 * "[{\"id\":\"\",\"text\":\"请选择老师\",\"selected\":true},");
			 */
			buffer.append("[");

			for (int i = 0; i < list.size(); i++) {
				Structure structure = list.get(i).getStructure();
				String structure_name = "";
				if (structure != null) {
					structure_name = structure.getName();
				}
				String duty_name = "";
				TeacherDuty teacherDuty = list.get(i).getTeacherDuty();
				if (teacherDuty != null) {
					duty_name = teacherDuty.getDuty_name();
				}
				if (i == list.size() - 1) {
					buffer.append("{\"id\": \"" + list.get(i).getId() + "\", \"teacher_name\": \""
							+ list.get(i).getTeacher_name() + "\",\"sex_name\": \"" + list.get(i).getSex_name()
							+ "\",\"structure_name\": \"" + structure_name + "\",\"duty_name\": \"" + duty_name
							+ "\"}");
				} else {
					buffer.append("{\"id\": \"" + list.get(i).getId() + "\", \"teacher_name\": \""
							+ list.get(i).getTeacher_name() + "\",\"sex_name\": \"" + list.get(i).getSex_name()
							+ "\",\"structure_name\": \"" + structure_name + "\",\"duty_name\": \"" + duty_name
							+ "\"},");
				}
			}

			buffer.append("]");
			String json = buffer.toString();
			JsonUtil.writeJson(json);
			System.out.println(json);
		}

		return NONE;

	}

	public String findAllTeacherToVacationAdd() throws IOException {

		String teacher_name = model.getTeacher_name();
		List<Teacher> list = teacherService.findAllTeacherLikeTeacherName(teacher_name);
		if (list != null && list.size() > 0) {
			StringBuffer buffer = new StringBuffer();

			buffer.append("{\"total\":" + list.size() + ",\"rows\": [");

			for (int i = 0; i < list.size(); i++) {
				TeacherDuty teacherDuty = list.get(i).getTeacherDuty();
				String duty_name = "";
				if (teacherDuty != null) {
					duty_name = teacherDuty.getDuty_name();
				}
				if (i == list.size() - 1) {
					buffer.append("{\"id\": \"" + list.get(i).getId() + "\",\"teacher_name\": \""
							+ list.get(i).getTeacher_name() + "\",\"sex_name\": \"" + list.get(i).getSex_name()
							+ "\",\"duty_name\": \"" + duty_name + "\"}");
				} else {
					buffer.append("{\"id\": \"" + list.get(i).getId() + "\",\"teacher_name\": \""
							+ list.get(i).getTeacher_name() + "\",\"sex_name\": \"" + list.get(i).getSex_name()
							+ "\",\"duty_name\": \"" + duty_name + "\"},");
				}
			}

			buffer.append("]}");
			String json = buffer.toString();
			JsonUtil.writeJson(json);
			System.out.println(json);
		}

		return NONE;
	}

	public String loginPrepare() {

		HttpServletRequest request = ServletActionContext.getRequest();
		Cookie cookies[] = request.getCookies();// 声明一个cookie对象
		String phone = null;// 登录的用户名
		String password = null; // 登录的密码
		for (int i = 0; i < cookies.length; i++) { // 取最后一次保存的用户名和密码
			if (cookies[i].getName().equals("phone")) {
				phone = cookies[i].getValue();
				System.out.println(phone);
			}
			if (cookies[i].getName().equals("password")) {
				password = cookies[i].getValue();
				System.out.println(password);
			}
		}
		ServletActionContext.getContext().getValueStack().set("phone", phone);
		ServletActionContext.getContext().getValueStack().set("password", password);

		return "login";
	}

	public String login() throws IOException {

		String json = "";
		Subject subject = SecurityUtils.getSubject();// 状态为“未认证”
		String phone = model.getPhone();
		String password = model.getPassword();
		password = MD5Utils.md5(password);
		// 构造一个用户名密码令牌
		AuthenticationToken token = new UsernamePasswordToken(model.getPhone(), password);

		try {
			subject.login(token);
		} catch (UnknownAccountException e) {
			json = "{ \"status\": 2, \"info\": \"用户不存在！\"}";
			JsonUtil.writeJson(json);
			return NONE;
		} catch (Exception e) {
			e.printStackTrace();
			json = "{\"status\": 3,\"info\": \"密码不正确！\"}";
			JsonUtil.writeJson(json);
			return NONE;
		}
		// 获取认证信息对象中存储的User对象
		Teacher teacher = (Teacher) subject.getPrincipal();
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setMaxInactiveInterval(60 * 60 * 12);
		session.setAttribute("loginUser", teacher);

		if ("1".equals(rememberMe)) {
			Cookie namecookie = new Cookie("phone", phone);// 新建cookie对象
			Cookie passwordcookie = new Cookie("password", password);
			namecookie.setMaxAge(60 * 60 * 24 * 365);// 设置cookie对象的有效时间
			passwordcookie.setMaxAge(60 * 60 * 24 * 365);
			ServletActionContext.getResponse().addCookie(namecookie);
			ServletActionContext.getResponse().addCookie(passwordcookie);
		} else {
			HttpServletRequest request = ServletActionContext.getRequest();
			Cookie cookies[] = request.getCookies();
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("phone")) {
					cookies[i].setMaxAge(0);
					cookies[i].setPath("/");
				}
				if (cookies[i].getName().equals("password")) {
					cookies[i].setMaxAge(0);
					cookies[i].setPath("/");
				}
			}

		}

		String id = teacher.getId();
		teacherService.setTeacherLoginTime(id);

		json = "{\"status\": 1,\"info\": \"登录成功！\"}";
		JsonUtil.writeJson(json);

		return "home";

	}

	public String teacherLogin() throws IOException {

		String json = "";
		String phone = model.getPhone();
		String password = model.getPassword();
		password = MD5Utils.md5(password);

		List<Teacher> list1 = teacherService.findByPhone(phone);
		if (list1 != null && list1.size() > 0) {

			List<Teacher> list2 = teacherService.findByPhoneAndPassword(phone, password);
			if (list2 != null && list2.size() > 0) {
				ServletActionContext.getRequest().getSession().setAttribute("loginTeacher", list1.get(0));
				ServletActionContext.getRequest().getSession().setMaxInactiveInterval(12 * 60 * 60);
				json = "{\"status\": 1,\"info\": \"登录成功！\"}";

			} else {
				json = "{\"status\": 3,\"info\": \"密码不正确！\"}";
			}

		} else {
			json = "{ \"status\": 2, \"info\": \"用户不存在！\"}";
		}

		JsonUtil.writeJson(json);
		return NONE;
	}

	public String logout() {

		ServletActionContext.getRequest().getSession().removeAttribute("loginUser");

		HttpServletRequest request = ServletActionContext.getRequest();
		Cookie cookies[] = request.getCookies();// 声明一个cookie对象
		String phone = null;// 登录的用户名
		String password = null; // 登录的密码
		for (int i = 0; i < cookies.length; i++) { // 取最后一次保存的用户名和密码
			if (cookies[i].getName().equals("phone")) {
				phone = cookies[i].getValue();
				System.out.println(phone);
			}
			if (cookies[i].getName().equals("password")) {
				password = cookies[i].getValue();
				System.out.println(password);
			}
		}
		ServletActionContext.getContext().getValueStack().set("phone", phone);
		ServletActionContext.getContext().getValueStack().set("password", password);

		return "index";
	}

	public String findAllTeacherToRole() throws IOException {

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));

		detachedCriteria = pageBean.getDetachedCriteria();

		String structure_id = model.getStructure_id();
		String teacher_name = model.getTeacher_name();

		if (StringUtils.isNotBlank(structure_id)) {
			Structure structure = structureService.findById(structure_id);
			String structure_name = structure.getName();
			detachedCriteria.add(Restrictions.eq("structure_name", structure_name));
		}
		if (StringUtils.isNotBlank(teacher_name)) {
			teacher_name = new String(teacher_name.getBytes("iso8859-1"), "utf-8");
			detachedCriteria.add(Restrictions.eq("teacher_name", "%" + teacher_name + "%"));
		}

		teacherService.pageQuery(pageBean);

		List<Teacher> list = pageBean.getRows();
		StringBuffer buffer = new StringBuffer();
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				if (i == list.size() - 1) {
					buffer.append("{\"id\": \"" + list.get(i).getId() + "\", \"teacherName\": \""
							+ list.get(i).getTeacher_name() + "\",\"dutyName\": \"" + list.get(i).getDuty_name()
							+ "\",\"sexName\": \"" + list.get(i).getSex_name() + "\",\"phone\": \""
							+ list.get(i).getPhone() + "\"}");
				} else {
					buffer.append("{\"id\": \"" + list.get(i).getId() + "\", \"teacherName\": \""
							+ list.get(i).getTeacher_name() + "\",\"dutyName\": \"" + list.get(i).getDuty_name()
							+ "\",\"sexName\": \"" + list.get(i).getSex_name() + "\",\"phone\": \""
							+ list.get(i).getPhone() + "\"},");
				}
			}
		}

		int total = pageBean.getTotal();

		String json1 = "{\"total\":" + total + ",\"rows\":[";
		String json2 = buffer.toString();
		String json3 = "]}";
		String json = json1 + json2 + json3;
		JsonUtil.writeJson(json);

		return NONE;
	}

	public String editSelf() throws IOException {

		teacherService.editSelf(model);

		return NONE;
	}
	
	public String findAll() throws IOException{
		
		List list = teacherService.findAll();
		JSONArray jsonArray = JSONArray.fromObject(list);
		String json = jsonArray.toString();
		JsonUtil.writeJson(json);
		return NONE;
	}

	public String editPassword() throws IOException {

		teacherService.editPassword(model, new_password, new_password_copy);

		return NONE;
	}

	public String t_news() {

		return "t_news";
	}

	public String t_teacherNews() throws IOException {
		
		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginTeacher");
		String teacher_id = teacher.getId();
		String class_id = teacher.getClass_id();
		Classes classes = classesService.findById(class_id);
		Set<Student> students = classes.getStudents();
		
		List<StudentVacation> svlist= new ArrayList<StudentVacation>();
		int vacationSize=0;
		int noticeSize =0;
		int askSize =0;
		int comeSize = 0;
		int noComeSize = 0;
		
		for (Student student : students) {
			String student_id = student.getId();
			List<StudentVacation> list = studentVacationService.findByStudentIdAndStatus(student_id);
			svlist.addAll(list);
			
		}
		if(svlist!=null){
			vacationSize = svlist.size();
		}
		
		List<NoticeTeacherCheck> nlist = noticeTeacherCheckService.findByTeacherAndChecked(teacher_id);
		if(nlist!=null){
			noticeSize = nlist.size();
		}
		
		List<AskTeacherCheck> aList = askTeacherCheckService.findByTeacherAndChecked(teacher_id);
		if(aList!=null){
			askSize = aList.size();
		}
		
		String currentDay = TimeUtil.getCurrentDay();
		List<StudentCheck> sList1 = studentCheckService.findByclassIdAndDayAndStatus(class_id,"1",currentDay);
		List<StudentCheck> sList2 = studentCheckService.findByclassIdAndDayAndStatus(class_id,"2",currentDay);
		if(sList1!=null){
			noComeSize = sList1.size();
		}
		if(sList2!=null){
			comeSize = sList2.size();
		}
		
		StringBuffer buffer = new StringBuffer();
		
		buffer.append("{\"messageList\":[");
		buffer.append("{");
		buffer.append("\"desc\":\"今天已到学生"+comeSize+"，未到"+noComeSize+"\",");
		buffer.append("\"title\":\"学生签到\",");
		buffer.append("\"type\":1");
		buffer.append("},");
		buffer.append("{");
		buffer.append("\"desc\":\"您有"+vacationSize+"个请假的学生\",");
		buffer.append("\"title\":\"学生请假\",");
		buffer.append("\"type\":2");
		buffer.append("},");
		buffer.append("{");
		buffer.append("\"desc\":\"您有"+noticeSize+"条通知公告未提交\",");
		buffer.append("\"type\":4");
		buffer.append("},");
		buffer.append("{");
		buffer.append("\"desc\":\"您有"+askSize+"条问卷调查未提交\",");
		buffer.append("\"title\":\"问卷调查\",");
		buffer.append("\"type\":5");
		buffer.append("}");
		buffer.append("]}");

		String json = buffer.toString();
		JsonUtil.writeJson(json);

		return NONE;
	}

	public String t_login() {

		return "t_login";
	}

	public String t_phone() {

		return "t_phone";
	}

	public String t_home() {
		
		List<School> list = schoolService.findAll();
		if(list!=null&&list.size()>0){
			School school = list.get(0);
			String longitude = school.getLongitude();
			String latitude = school.getLatitude();
			ServletActionContext.getRequest().getSession().setAttribute("longitude", longitude);
			ServletActionContext.getRequest().getSession().setAttribute("latitude", latitude);
		}

		if ("1".equals(flag)) {
			return "t_news";
		}

		return "t_home";
	}

	public String t_aboutWe() {

		return "t_aboutWe";
	}

	public String t_about() {

		return "t_about";
	}

	public String t_email() {

		return "t_email";
	}

	public String t_img() {

		return "t_img";
	}

	public String t_logout() {

		ServletActionContext.getRequest().getSession().removeAttribute("loginTeacher");
		/*
		 * HttpServletRequest request = ServletActionContext.getRequest();
		 * Cookie cookies[] = request.getCookies();// 声明一个cookie对象 String phone
		 * = null;// 登录的用户名 String password = null; // 登录的密码 for (int i = 0; i <
		 * cookies.length; i++) { // 取最后一次保存的用户名和密码 if
		 * (cookies[i].getName().equals("phone")) { phone =
		 * cookies[i].getValue(); System.out.println(phone); } if
		 * (cookies[i].getName().equals("password")) { password =
		 * cookies[i].getValue(); System.out.println(password); } }
		 * ServletActionContext.getContext().getValueStack().set("phone",
		 * phone);
		 * ServletActionContext.getContext().getValueStack().set("password",
		 * password);
		 */

		return "t_logout";
	}

	public String t_mine() {

		return "t_mine";
	}

	public String tphone() {

		return "tphone";
	}

	public String t_qq() {

		return "t_qq";
	}

	public String t_question() {

		return "t_question";
	}

	public String t_wechat() {

		return "t_wechat";
	}

	public String t_changeInfo() {

		teacherService.changeInfo(model, type);

		return "t_about";
	}

}
