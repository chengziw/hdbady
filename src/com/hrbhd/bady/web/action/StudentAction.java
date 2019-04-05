package com.hrbhd.bady.web.action;

import com.hrbhd.bady.dao.IStudentDao;
import com.hrbhd.bady.domain.*;
import com.hrbhd.bady.service.*;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.MD5Utils;
import com.hrbhd.bady.util.TimeUtil;
import com.hrbhd.bady.web.action.base.BaseAction;
import com.opensymphony.xwork2.ActionContext;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.Restrictions;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.List;

@Controller
@Scope("prototype")
public class StudentAction extends BaseAction<Student> {

	@Autowired
	private IStudentService studentService;
	@Autowired
	private IClassesService classesService;
	@Autowired
	private IGradeService gradeService;
	@Autowired
	private IStudentChangeLogService studentChangeLogService;
	@Autowired
	private IStudentDao studentDao;
	@Autowired
	private INoticeStudentCheckService noticeStudentCheckService;
	@Autowired
	private IAskStudentCheckService askStudentCheckService;
	@Autowired
	private ISchoolService schoolService;

	private static final String STUDENT_ENTER = "1";
	private static final String STUDENT_ALLOT = "2";
	private static final String STUDENT_REGULATE = "3";
	private static final String STUDENT_EDIT = "4";
	private static final String STUDENT_RETIREMENT = "5";
	private static final String STUDENT_TOSCHOOL = "6";
	private static final String STUDENT_DELETE = "7";

	private String page;
	private String rows;
	private String start_date;

	private String end_date;
	private String change_date;
	public String order_student_no;

	public String studentIds;
	private File file;
	private String[] interests;

	private String tag;

	private String fileName;
	private InputStream fileInputStream;
	private File[] fileselect;

	private String flag;
	private String type;
	private String class_ids;

	private String[] filed;
	private String statuss;

	public void setPage(String page) {
		this.page = page;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public void setChange_date(String change_date) {
		this.change_date = change_date;
	}

	public void setOrder_student_no(String order_student_no) {
		this.order_student_no = order_student_no;
	}

	public void setStudentIds(String studentIds) {
		this.studentIds = studentIds;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public void setInterests(String[] interests) {
		this.interests = interests;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public String getFileName() {
		return fileName;
	}
	
	public InputStream getFileInputStream() {
		return fileInputStream;
	}

	public void setFileInputStream(InputStream fileInputStream) {
		this.fileInputStream = fileInputStream;
	}

	public void setFileselect(File[] fileselect) {
		this.fileselect = fileselect;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setClass_ids(String class_ids) {
		this.class_ids = class_ids;
	}

	public void setFiled(String[] filed) {
		this.filed = filed;
	}

	public void setStatuss(String statuss) {
		this.statuss = statuss;
	}

	public String pageQuery() throws IOException {

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));

		if ("1".equals(tag)) {
			studentService.termQuery(model, pageBean, detachedCriteria, start_date, end_date);
		}
		studentService.pageQuery(pageBean);

		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[] { "enter_date_time", "asks", "notices", "studentVacations", "studentChecks",
				"studentMonthChecks", "studentChangeLogs", "askStudentChecks", "noticeStudentChecks",
				"studentImageUrls" });
		config.setJsonPropertyFilter(new PropertyFilter() {

			@Override
			public boolean apply(Object source, String name, Object value) {
				if (source instanceof Classes && name.equals("students")) {
					return true;
				}
				if (source instanceof Classes && name.equals("studentBespeaks")) {
					return true;
				}
				if (source instanceof Classes && name.equals("curriculaTable")) {
					return true;
				}
				if (source instanceof Classes && name.equals("classType")) {
					return true;
				}
				if (source instanceof Classes && name.equals("classesChangeLogs")) {
					return true;
				}
				if (source instanceof Classes && name.equals("homeWorks")) {
					return true;
				}
				if (source instanceof Classes && name.equals("create_time_format")) {
					return true;
				}
				if (source instanceof Classes && name.equals("cookBooks")) {
					return true;
				}
				if (source instanceof Classes && name.equals("studentChecks")) {
					return true;
				}
				if (source instanceof Classes && name.equals("teacher")) {
					return true;
				}
				if (source instanceof Grade && name.equals("classes")) {
					return true;
				}
				if (source instanceof Grade && name.equals("subjects")) {
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

	public String edit() {
		String id = model.getId();
		Student student = studentService.findById(id);
		String interest = student.getInterest();
		if (StringUtils.isNotBlank(interest)) {
			String[] split = interest.split(",");
			List<String> interests = Arrays.asList(split);
			ServletActionContext.getContext().put("interests", interests);
		}
		ActionContext.getContext().getValueStack().set("student", student);
		return "edit";
	}

	public String enter() {
		String id = model.getId();
		Student student = studentService.findById(id);
		ActionContext.getContext().getValueStack().set("student", student);
		return "enter";
	}

	public String delete() {
		String id = model.getId();
		Student student = studentService.findById(id);
		ActionContext.getContext().getValueStack().set("student", student);
		return "delete";
	}

	public String regulate() {
		String id = model.getId();
		Student student = studentService.findById(id);
		ActionContext.getContext().getValueStack().set("student", student);
		return "regulate";
	}

	public String toschool() {
		String id = model.getId();
		Student student = studentService.findById(id);
		ActionContext.getContext().getValueStack().set("student", student);
		return "toschool";
	}

	public String retirement() {
		String id = model.getId();
		Student student = studentService.findById(id);
		ActionContext.getContext().getValueStack().set("student", student);
		return "retirement";
	}

	public String about() {
		String id = model.getId();
		Student student = studentService.findById(id);
		ActionContext.getContext().getValueStack().set("student", student);
		return "about";
	}

	public String addStudent() throws IOException {

		studentService.addStudent(model, interests, STUDENT_EDIT);

		return NONE;

	}

	@Test
	public String editStudent() throws IOException {

		System.out.println(studentService);
		System.out.println("studentService" + studentService);
		String json = "";
		String id = model.getId();
		Student student = studentService.findById(id);
		String student_no = model.getStudent_no();
		String DBstudent_no = student.getStudent_no();

		String class_id = student.getClass_id();

		List<Student> list = studentService.findStudentByStudent_noAndClasses(student_no, class_id);

		// 不是原本的名字///////也不是数据库中其他名字//
		if (!student_no.equals(DBstudent_no) && list != null && list.size() > 0) {
			json = "{\"status\": 0,\"info\": \"学号被其他学生使用, 请重新输入！\"}";
		} else {
			if (this.interests != null && list != null && list.size() > 0) {
				String interests[] = { "", "", "", "", "", "" };
				StringBuffer buffer = new StringBuffer();
				for (int i = 0; i < this.interests.length; i++) {
					int num = Integer.parseInt(this.interests[i]);
					interests[num] = this.interests[i];
				}
				for (int i = 0; i < interests.length; i++) {
					if (i == interests.length - 1) {
						buffer.append(interests[i]);
					} else {
						buffer.append(interests[i] + ",");
					}
				}
				model.setInterest(buffer.toString());
			}
			studentChangeLogService.addLog(student, STUDENT_EDIT);
			studentService.editStudent(model);
			json = JsonUtil.SAVE_SUCCESS;
		}

		JsonUtil.writeJson(json);

		return NONE;
	}

	// var url =
	// '${pageContext.request.contextPath}/studentAction_changeStatus.action?student_no='+student_no+'&status_name=3';

	public String enterStudent() throws IOException {
		Student student = studentService.findById(model.getId());
		studentChangeLogService.addLog(student, "1");
		studentService.enterStudent(model);

		String json = JsonUtil.SAVE_SUCCESS;
		JsonUtil.writeJson(json);
		return NONE;
	}

	public String deleteStudent() throws IOException {
		Student student = studentService.findById(model.getId());
		studentChangeLogService.addLog(student, STUDENT_DELETE);

		studentService.delete(model);

		String json = JsonUtil.SAVE_SUCCESS;
		JsonUtil.writeJson(json);
		return NONE;
	}

	public String changeGrader() throws IOException {
		Student student = studentService.findById(model.getId());
		studentChangeLogService.addLog(student, STUDENT_REGULATE);
		studentService.changeGrader(model);

		String json = JsonUtil.SAVE_SUCCESS;
		JsonUtil.writeJson(json);
		return NONE;
	}

	public String leaveSchool() throws IOException {
		Student student = studentService.findById(model.getId());
		studentChangeLogService.addLog(student, STUDENT_RETIREMENT);
		studentService.leaveSchool(model);

		String json = JsonUtil.SAVE_SUCCESS;
		JsonUtil.writeJson(json);
		return NONE;
	}

	public String backSchool() throws IOException {
		Student student = studentService.findById(model.getId());
		studentChangeLogService.addLog(student, STUDENT_TOSCHOOL);
		studentService.backSchool(model);

		String json = JsonUtil.SAVE_SUCCESS;
		JsonUtil.writeJson(json);

		return NONE;
	}

	public String pageQuery2() throws IOException {
		pageBean.setCurrentPage(1);
		pageBean.setPageSize(10000);

		// detachedCriteria.createAlias("classes", "c");
		String status_name = model.getStatus_name();
		String grade_id = model.getGrade_id();
		if ("1".equals(status_name)) {
			detachedCriteria.add(Restrictions.eq("status_name", "1"));
			if (!"".equals(grade_id)) {
				detachedCriteria.add(Restrictions.eq("grade_id", "grade_id"));
			}
		}
		if ("2".equals(status_name)) {
			detachedCriteria.add(Restrictions.eq("status_name", "2"));
			if (!"".equals(grade_id)) {
				detachedCriteria.add(Restrictions.eq("grade_id", "grade_id"));
			}
		}

		studentService.pageQuery(pageBean);

		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[] { "enter_date_time", "asks", "notices", "studentVacations", "studentChecks",
				"studentMonthChecks", "studentChangeLogs", "askStudentChecks", "noticeStudentChecks",
				"studentImageUrls" });
		config.setJsonPropertyFilter(new PropertyFilter() {

			@Override
			public boolean apply(Object source, String name, Object value) {
				if (source instanceof Classes && name.equals("students")) {
					return true;
				}
				if (source instanceof Classes && name.equals("studentBespeaks")) {
					return true;
				}
				if (source instanceof Classes && name.equals("curriculaTable")) {
					return true;
				}
				if (source instanceof Classes && name.equals("classType")) {
					return true;
				}
				if (source instanceof Classes && name.equals("classesChangeLogs")) {
					return true;
				}
				if (source instanceof Classes && name.equals("homeWorks")) {
					return true;
				}
				if (source instanceof Classes && name.equals("create_time_format")) {
					return true;
				}
				if (source instanceof Classes && name.equals("cookBooks")) {
					return true;
				}
				if (source instanceof Classes && name.equals("studentChecks")) {
					return true;
				}
				if (source instanceof Classes && name.equals("teacher")) {
					return true;
				}
				if (source instanceof Grade && name.equals("classes")) {
					return true;
				}
				if (source instanceof Grade && name.equals("subjects")) {
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

	public String batchAllotStudent() throws IOException {

		studentService.batchAllotStudent(model, studentIds, STUDENT_ALLOT);

		return NONE;
	}

	public String batchEnterStudent() throws IOException {

		studentService.batchEnterStudent(model, studentIds, STUDENT_ENTER);

		return NONE;
	}

	public String resolveStudent() throws IOException {

		List<Student> list = studentService.resolveStudent(model, file);

		String json = "";
		String json1 = "{\"status\": 1,\"info\": {\"total\": 3,\"rows\": ";
		String json3 = "}}";
		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[] { "classes", "grade" });
		JSONArray jsonObject = JSONArray.fromObject(list, config);
		String json2 = jsonObject.toString();
		json = json1 + json2 + json3;

		JsonUtil.writeJson(json);

		return NONE;
	}

	public String importStudent() throws IOException {
		List<Student> list = studentService.resolveStudent(model, file);

		for (Student student : list) {
			studentService.save(student);
		}
		String json = "{\"errMeg\":\"\"}";
		JsonUtil.writeJson(json);
		return NONE;
	}

	public String findAllClass() throws IOException {
		List list = studentService.findAllClass();
		JsonUtil.write2Json(list);
		return NONE;
	}

	@Test
	public String findGradeAndClass() throws IOException {

		StringBuffer buffer = new StringBuffer();
		buffer.append("[{\"id\": 0,\"name\": \"全部年级\",\"pid\": 0,\"children\": [");
		List<Grade> grades = gradeService.findAll();
		if (grades != null && grades.size() > 0) {
			for (int i = 0; i < grades.size(); i++) {

				String gid = grades.get(i).getId();
				// String gid = i + 10 + "";
				Grade grade = grades.get(i);
				String gname = grades.get(i).getName();
				String gpid = "1";

				buffer.append("{");
				buffer.append("\"id\": \"" + gid + "\",");
				buffer.append("\"name\": \"" + gname + "\",");
				buffer.append("\"pid\": \"" + 2 + "\",");
				buffer.append("\"children\": [");

				List<Classes> classess = classesService.findAllClassByGrade(grade);
				if (classess != null && classess.size() > 0) {
					for (int j = 0; j < classess.size(); j++) {

						String cid = classess.get(j).getId();
						// String cid = 100 + j + "";
						String cname = classess.get(j).getClass_name();
						String cpid = gid;

						buffer.append("{");
						buffer.append("\"id\": \"" + cid + "\",");
						buffer.append("\"name\": \"" + cname + "\",");
						buffer.append("\"pid\": \"" + 3 + "\" ");

						if (j == classess.size() - 1) {
							buffer.append("}");
						} else {
							buffer.append("},");
						}
					}
				}
				buffer.append("]");

				if (i == grades.size() - 1) {
					buffer.append("}");
				} else {
					buffer.append("},");
				}
			}

			buffer.append("]}]");
		}
		JsonUtil.writeJson(buffer.toString());
		return NONE;
	}

	public String getExportStatus() throws IOException {

		String json = "{\"stauts\":true}";
		JsonUtil.writeJson(json);

		return NONE;
	}

	public String exportStudent() throws IOException, NoSuchFieldException, SecurityException, IllegalArgumentException,
			IllegalAccessException {

		studentService.exportStudent(class_ids, filed, statuss);

		return NONE;
	}

	public String downloadStudentTemplet() throws IOException {

		fileName = "student.xlsx";
		//String filePath = ServletActionContext.getServletContext().getRealPath("/image/download/student.xlsx");
		String filePath = "D:\\hdbady" + "/download/student.xlsx";
		fileInputStream = new FileInputStream(filePath);
		return SUCCESS;
	}

	public String p_about() {
		return "p_about";
	}

	public String p_aboutt() {

		return "p_aboutt";
	}

	public String p_aboutStudent() throws IOException {

		Student student = (Student) ServletActionContext.getRequest().getSession().getAttribute("loginParent");
		Classes classes = studentService.getClasses(student);
		String classes_id = "";
		String classes_name = "";
		if (classes != null) {
			classes_id = classes.getId();
			classes_name = classes.getClass_name();
		}
		StringBuffer buffer = new StringBuffer();
		buffer.append("{");

		buffer.append("\"birthday\":\"" + student.getYearMonthDay() + "\",");
		buffer.append("\"gradeId\":\"" + classes_id + "\",");
		buffer.append("\"gradeName\":\"" + classes_name + "\",");
		buffer.append("\"parentName\":\"" + student.getParent_name() + "\",");
		buffer.append("\"parentPhone\":\"" + student.getPhone() + "\",");
		buffer.append("\"aihao\":\"" + student.getInterest() + "\",");
		buffer.append("\"sex\":\"" + student.getSex() + "\",");
		buffer.append("\"studentid\":\"" + student.getStudent_no() + "\",");
		buffer.append("\"studentName\":\"" + student.getName() + "\"");

		buffer.append("}");

		String json = buffer.toString();
		JsonUtil.writeJson(json);

		return NONE;
	}

	public String parentLogin() throws IOException {

		String json = "";
		String phone = model.getPhone();
		String password = model.getPassword();
		password = MD5Utils.md5(password);

		List<Student> list1 = studentService.findByPhone(phone);
		if (list1 != null && list1.size() > 0) {

			List<Student> list2 = studentService.findByPhoneAndPassword(phone, password);
			if (list2 != null && list2.size() > 0) {
				ServletActionContext.getRequest().getSession().setAttribute("loginParent", list1.get(0));
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

	public String p_studentPhone() throws IOException {

		Student student = (Student) ServletActionContext.getRequest().getSession().getAttribute("loginParent");
		List<StudentImageUrl> list = studentService.getImageUrl(student);
		StudentImageUrl studentImageUrl = null;

		String json = "";
		StringBuffer buffer = new StringBuffer();

		buffer.append("{\"haseMore\":true,");
		buffer.append("\"img\":[");
		for (int i = 0; i < list.size(); i++) {
			studentImageUrl = list.get(i);
			buffer.append("{");
			buffer.append("\"imgurl\": \"image/student/" + studentImageUrl.getImage_url() + "\"");
			if (i == list.size() - 1) {
				buffer.append("}");
			} else {
				buffer.append("},");
			}
		}
		buffer.append("]}");

		json = buffer.toString();
		JsonUtil.writeJson(json);

		return NONE;
	}

	public String t_studentPhoto() {

		return "t_studentPhoto";
	}

	public String t_studentPhotoPublish() {

		return "t_studentPhotoPublish";
	}

	public String t_importPicture() throws IOException {

		studentService.importPicture(model, fileselect);

		return "t_studentPhoto";
	}

	public String t_studentList() throws IOException {

		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginTeacher");
		List<Student> list = studentService.getStudent(teacher);
		Student student = null;

		StringBuffer buffer = new StringBuffer();
		buffer.append("{\"hasMore\": \"False\",\"nextPageNum\": \"0\",");
		buffer.append("\"studentList\": [");

		for (int i = 0; i < list.size(); i++) {
			student = list.get(i);
			buffer.append("{");

			buffer.append("\"studentid\":\"" + student.getId() + "\",");
			buffer.append("\"studentName\":\"" + student.getName() + "\",");
			buffer.append("\"studentsex\":\"" + student.getSex() + "\"");

			if (i == list.size() - 1) {
				buffer.append("}");
			} else {
				buffer.append("},");
			}
		}

		buffer.append("],");
		buffer.append("\"ok\": \"True\",");
		buffer.append("\"serverTime\": \"" + TimeUtil.getCurrentTime() + "\"");
		buffer.append("}");

		String json = buffer.toString();
		JsonUtil.writeJson(json);

		return NONE;
	}

	public String p_news() {

		return "p_news";
	}

	public String p_studentNews() throws IOException {

		Student student = (Student) ServletActionContext.getRequest().getSession().getAttribute("loginParent");
		String student_id = student.getId();
		int noticeSize =0;
		int askSize =0;

		List<NoticeTeacherCheck> nlist = noticeStudentCheckService.findByStudentAndChecked(student_id);
		if(nlist!=null){
			noticeSize = nlist.size();
		}
		List<AskTeacherCheck> aList = askStudentCheckService.findByStudentAndChecked(student_id);
		if(aList!=null){
			askSize = aList.size();
		}
		
		StringBuffer buffer = new StringBuffer();

		buffer.append("{\"messageList\":[");
		buffer.append("{");
		buffer.append("\"desc\":\"您有"+noticeSize+"条通知公告未提交\",");
		buffer.append("\"title\":\"通知公告\",");
		buffer.append("\"type\":1");
		buffer.append("},");
		buffer.append("{");
		buffer.append("\"desc\":\"您有"+askSize+"条问卷调查未提交\",");
		buffer.append("\"title\":\"问卷调查\",");
		buffer.append("\"type\":2");
		buffer.append("}");
		buffer.append("]}");

		String json = buffer.toString();
		JsonUtil.writeJson(json);

		return NONE;
	}

	public String p_login() {

		return "p_login";
	}

	public String p_home() {

		List<School> list = schoolService.findAll();
		if(list!=null&&list.size()>0){
			School school = list.get(0);
			String longitude = school.getLongitude();
			String latitude = school.getLatitude();
			ServletActionContext.getRequest().getSession().setAttribute("longitude", longitude);
			ServletActionContext.getRequest().getSession().setAttribute("latitude", latitude);
		}
		
		if ("1".equals(flag)) {
			return "p_news";
		}

		return "p_home";
	}

	public String p_aboutWe() {

		return "p_aboutWe";
	}

	public String p_email() {

		return "p_email";
	}

	public String p_img() {

		return "p_img";
	}

	public String p_logout() {

		ServletActionContext.getRequest().getSession().removeAttribute("loginParent");

		return "p_logout";
	}

	public String p_mine() {

		return "p_mine";
	}

	public String p_phone() {

		return "p_phone";
	}

	public String p_qq() {

		return "p_qq";
	}

	public String p_question() {

		return "p_question";
	}

	public String p_setParent() {

		return "p_setParent";
	}

	public String p_wechat() {

		return "p_wechat";
	}

	public String p_changeInfo() {

		studentService.changeInfo(model, type);

		return "p_about";
	}

}
