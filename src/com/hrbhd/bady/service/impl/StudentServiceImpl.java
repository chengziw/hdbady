package com.hrbhd.bady.service.impl;

import com.hrbhd.bady.dao.*;
import com.hrbhd.bady.domain.*;
import com.hrbhd.bady.service.IStudentChangeLogService;
import com.hrbhd.bady.service.IStudentService;
import com.hrbhd.bady.util.*;
import com.hrbhd.bady.web.action.SchoolAction;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.ServletOutputStream;
import java.io.*;
import java.lang.reflect.Field;
import java.net.URL;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
@Transactional
public class StudentServiceImpl implements IStudentService {

	@Autowired
	private IStudentDao studentDao;
	@Autowired
	private IClassesDao classesDao;
	@Autowired
	private IGradeDao gradeDao;
	@Autowired
	private IStudentChangeLogService studentChangeLogService;
	@Autowired
	private ITeacherDao teacherDao;
	@Autowired
	private IStudentImageUrlDao studentImageUrlDao;

	@Override
	public List<Student> findAll() {
		return studentDao.findAll();
	}

	@Override
	public void pageQuery(PageBean pageBean) {
		studentDao.pageQuery(pageBean);
	}

	@Override
	public List findAllClass() {
		return studentDao.findAllClass();
	}

	@Override
	public void changeStatus(Student model) {
		studentDao.saveOrUpdate(model);
	}

	@Override
	public Student findById(String id) {
		return studentDao.findById(id);
	}

	@Override
	public void save(Student student) {
		studentDao.save(student);
	}

	@Override
	public void update(Student student) {
		studentDao.update(student);
	}

	@Override
	public void delete(Student model) {
		String id = model.getId();
		Student student = studentDao.findById(id);
		studentDao.delete(student);
	}

	@Override
	public List<Student> findStudentByStudent_noAndGrade_idAndClass_id(String student_no, String grade_id,
			String class_id) {
		return studentDao.findStudentByStudent_noAndGrade_idAndClass_id(student_no, grade_id, class_id);
	}

	@Override
	public void batchEnterStudent(Student model, String studentIds, String STUDENT_ENTER) throws IOException {

		String[] ids = studentIds.split(",");
		for (String id : ids) {
			Student student = studentDao.findById(id);
			student.setEnter_date(model.getEnter_date());
			student.setStatus_name("3");
			student.setStatus_name_text("正常就读");

			studentChangeLogService.addLog(student, STUDENT_ENTER);
		}

		String json = JsonUtil.HANDLE_SUCCESS;
		System.out.println(json);
		JsonUtil.writeJson(json);
	}

	@Override
	public void batchAllotStudent(Student model, String studentIds, String STUDENT_ALLOT) throws IOException {

		String classes_id = model.getClasses().getId();
		Classes classes = classesDao.findById(classes_id);

		String[] ids = studentIds.split(",");
		for (String id : ids) {
			Student student = studentDao.findById(id);
			student.setClasses(classes);
			student.setStatus_name("2");
			student.setStatus_name_text("待确认入学");

			studentChangeLogService.addLog(student, STUDENT_ALLOT);
		}

		String json = JsonUtil.HANDLE_SUCCESS;
		System.out.println(json);
		JsonUtil.writeJson(json);

	}

	@Override
	public void termQuery(Student model, PageBean pageBean, DetachedCriteria detachedCriteria, String start_date,
			String end_date) throws UnsupportedEncodingException {
		detachedCriteria = pageBean.getDetachedCriteria();

		detachedCriteria.setProjection(null);

		String status_name = model.getStatus_name();
		String grade_id = model.getGrade_id();
		String class_id = model.getClass_id();
		String age = model.getAge();
		String name = model.getName();
		// status_name = new String(status_name.getBytes("iso8859-1"), "utf-8");
		// name = new String(name.getBytes("iso8859-1"), "utf-8");
		// start_date
		// end_date
		System.out.println(model);
		if (StringUtils.isNotBlank(status_name)) {
			if (!"0".equals(status_name)) {
				detachedCriteria.add(Restrictions.eq("status_name", status_name));
			}

		}
		if (StringUtils.isNotBlank(grade_id)) {
			if (!"全部年级".equals(grade_id)) {
				detachedCriteria.add(Restrictions.eq("grade.id", grade_id));
			}
		}
		if (StringUtils.isNotBlank(class_id)) {
			if (!"全部班级".equals(class_id)) {
				detachedCriteria.add(Restrictions.eq("classes.id", class_id));
			}
		}
		if (StringUtils.isNotBlank(age)) {
			if (!"年龄".equals(age)) {
				detachedCriteria.add(Restrictions.eq("age", age));
			}
		}
		if (StringUtils.isNotBlank(name)) {
			detachedCriteria.add(Restrictions.like("name", name + "%"));
		}
		if (StringUtils.isNotBlank(start_date) && StringUtils.isNotBlank(end_date)) {
			Date start_date_format = TimeUtil.getDate(start_date);
			Date end_date_format = TimeUtil.getDate(end_date);
			detachedCriteria.add(Restrictions.between("enter_date_time", start_date_format, end_date_format));
		} else {

			if (StringUtils.isNotBlank(start_date)) {
				Date start_date_format = TimeUtil.getDate(start_date);
				detachedCriteria.add(Restrictions.ge("enter_date_time", start_date_format));
			}
			if (StringUtils.isNotBlank(end_date)) {
				Date end_date_format = TimeUtil.getDate(end_date);
				detachedCriteria.add(Restrictions.le("enter_date_time", end_date_format));
			}
		}
	}

	@Override
	public void editStudent(Student model) {

		String id = model.getId();
		Student student = studentDao.findById(id);

		// 暂时注释
		/*
		 * if (StringUtils.isNotBlank(model.getClass_id()) &&
		 * "1".equals(student.getStatus_name())) { student.setStatus_name("2");
		 * student.setStatus_name_text("待确认入学"); }
		 */
		student.setStudent_no(model.getStudent_no());

		/*
		 * student.setGrade_id(model.getGrade_id());
		 * student.setClass_id(model.getClass_id());
		 */

		student.setName(model.getName());
		student.setSex(model.getSex());
		student.setYearMonthDay(model.getYearMonthDay());

		student.setIs_local(model.getIs_local());
		student.setIs_teacherson(model.getIs_teacherson());
		student.setCensus_type(model.getCensus_type());
		student.setEnter_date(model.getEnter_date());

		student.setParent_name(model.getParent_name());
		student.setRelationship(model.getRelationship());
		student.setPhone(model.getPhone());
		student.setAddress(model.getAddress());

		student.setInterest(model.getInterest());

		student.setHealth_status(model.getHealth_status());
		student.setIs_allergy(model.getIs_allergy());
		student.setIs_predisease(model.getIs_predisease());
		student.setIs_health_form(model.getIs_health_form());

		student.setIs_health_verify(model.getIs_health_verify());
		student.setIs_ccine(model.getIs_ccine());
		student.setBlood_type(model.getBlood_type());
		student.setCommom_disease(model.getCommom_disease());

		student.setTimetype_id(model.getTimetype_id());
		student.setIs_only_child(model.getIs_only_child());
		student.setBirthplace(model.getBirthplace());
		student.setIdentity_card(model.getIdentity_card());

		student.setDemand(model.getDemand());
		student.setNote(model.getNote());
		student.setField1(model.getField1());
		student.setField2(model.getField2());
		student.setField3(model.getField3());
		
		String password = model.getPassword();
		if (!password.equals(student.getPassword())) {
			password = MD5Utils.md5(password);
			student.setPassword(password);
		}
	}

	@Override
	public void enterStudent(Student model) {
		String id = model.getId();
		/*
		 * String grade_id = model.getGrade_id(); String class_id =
		 * model.getClass_id();
		 */
		String class_id = model.getClass_id();
		Classes classes = classesDao.findById(class_id);
		String grade_id = model.getGrade_id();
		Grade grade = gradeDao.findById(grade_id);

		String enter_date = model.getEnter_date();
		String status_name = model.getStatus_name();

		Student student = findById(id);

		/*
		 * student.setGrade_id(grade_id); student.setClass_id(class_id);
		 */
		student.setClasses(classes);
		student.setGrade(grade);
		student.setEnter_date(enter_date);
		student.setStatus_name(status_name);
		student.setStatus_name_text("正常就读");
		System.out.println("changeStatus" + student);

	}

	@Override
	public void changeGrader(Student model) {
		String id = model.getId();

		String class_id = model.getClasses().getId();
		Classes classes = classesDao.findById(class_id);

		String grade_id = model.getGrade().getId();
		Grade grade = gradeDao.findById(grade_id);

		Student student = findById(id);
		student.setClasses(classes);
		student.setGrade(grade);

		System.out.println("changGrade:" + student);

	}

	@Override
	public void leaveSchool(Student model) {
		String id = model.getId();
		String student_no = model.getStudent_no();
		String status_name = model.getStatus_name();
		String note = model.getNote();
		
		Student student = findById(id);
		student.setStatus_name(status_name);
		if ("4".equals(status_name)) {
			student.setStatus_name_text("已休学");
		}
		if ("5".equals(status_name)) {
			student.setStatus_name_text("已退学");
		}
		student.setNote(note);
		System.out.println("changeStatus" + student);

	}

	@Override
	public void backSchool(Student model) {
		String id = model.getId();
		String student_no = model.getStudent_no();
		/*
		 * String grade_id = model.getGrade_id(); String class_id =
		 * model.getClass_id();
		 */
		String class_id = model.getClasses().getId();
		Classes classes = classesDao.findById(class_id);
		String status_name = model.getStatus_name();

		Student student = findById(id);
		student.setClasses(classes);
		student.setStatus_name(status_name);
		student.setStatus_name_text("正常就读");
		System.out.println("changeStatus" + student);

	}

	@Override
	public void termQuery(Student model, PageBean pageBean, DetachedCriteria detachedCriteria) {

		pageBean.setCurrentPage(1);
		pageBean.setPageSize(1000);

		detachedCriteria = pageBean.getDetachedCriteria();

		String status_name = model.getStatus_name();
		String grade_id = model.getGrade_id();
		String class_id = model.getClass_id();

		System.out.println(model);
		if (StringUtils.isNotBlank(status_name)) {
			if (status_name != "") {
				detachedCriteria.add(Restrictions.eq("status_name", status_name));
			}

		}
		if (StringUtils.isNotBlank(grade_id)) {
			if (!"全部年级".equals(grade_id)) {
				detachedCriteria.add(Restrictions.eq("grade_id", grade_id));
			}
		}
		if (StringUtils.isNotBlank(class_id)) {
			if (!"全部班级".equals(class_id)) {
				detachedCriteria.add(Restrictions.eq("class_id", class_id));
			}
		}

	}

	/**
	 * 判断是否含有特殊字符
	 *
	 * @param str
	 * @return true为包含，false为不包含
	 */
	public static boolean isSpecialChar(String str) {
		String regEx = "[ _`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]|\n|\r|\t";
		Pattern p = Pattern.compile(regEx);
		Matcher m = p.matcher(str);
		return m.find();
	}

	public String checkProperty(Student student, String value) {
		if (isSpecialChar(value)) {
			return "输入不正确!";
		} else {
			return value;
		}
	}

	@Override
	public List<Student> resolveStudent(Student model, java.io.File file) throws FileNotFoundException, IOException {

		List<Student> list = new ArrayList<Student>();
		String grade_id = model.getGrade_id();
		String class_id = model.getClass_id();
		Grade grade = gradeDao.findById(grade_id);
		Classes classes = classesDao.findById(class_id);

		XSSFWorkbook workbook = new XSSFWorkbook(new FileInputStream(file));
		XSSFSheet sheet = workbook.getSheetAt(0);
		for (Row row : sheet) {
			Student student = new Student();
			student.setGrade(grade);
			student.setClasses(classes);
			student.setStatus_name("2");
			student.setStatus_name_text("待确认入学");
			int rowNum = row.getRowNum();
			if (rowNum == 0) {
				continue;
			}

			int columnNum = row.getPhysicalNumberOfCells();
			for (int i = 0; i < columnNum; i++) {

				if (i == 4 || i == 8) {
					continue;
				}

				if (row.getCell(i) != null) {
					row.getCell(i).setCellType(Cell.CELL_TYPE_STRING);
				}
			}

			if (row.getCell(0) != null) {
				String student_no = row.getCell(0).getStringCellValue();
				student.setStudent_no(student_no);
			}
			if (row.getCell(1) != null) {
				String name = row.getCell(1).getStringCellValue();
				student.setName(name);
			}
			if (row.getCell(2) != null) {
				String age = row.getCell(2).getStringCellValue();
				student.setAge(age);
			}
			if (row.getCell(3) != null) {
				String sex = row.getCell(3).getStringCellValue();
				student.setSex(checkProperty(student, sex));
				// student.setSex(sex);
			}
			if (row.getCell(4) != null) {

				row.getCell(4).setCellType(Cell.CELL_TYPE_FORMULA);
				java.util.Date date = row.getCell(4).getDateCellValue();
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				String yearMonthDay = format.format(date);
				System.out.println(yearMonthDay);
				student.setYearMonthDay(yearMonthDay);

			}
			if (row.getCell(5) != null) {
				String parent_name = row.getCell(5).getStringCellValue();
				student.setParent_name(parent_name);
			}
			if (row.getCell(6) != null) {
				String relationship = row.getCell(6).getStringCellValue();
				student.setRelationship(checkProperty(student, relationship));
				// student.setRelationship(relationship);
			}
			if (row.getCell(7) != null) {
				String phone = row.getCell(7).getStringCellValue();
				student.setPhone(phone);
			}
			if (row.getCell(8) != null) {
				row.getCell(8).setCellType(Cell.CELL_TYPE_FORMULA);
				java.util.Date date = row.getCell(8).getDateCellValue();
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				String enter_date = format.format(date);
				System.out.println(enter_date);
				student.setEnter_date(enter_date);
			}
			if (row.getCell(9) != null) {
				String is_local = row.getCell(9).getStringCellValue();
				model.setIs_local(checkProperty(student, is_local));
				// student.setIs_local(is_local);
			}
			if (row.getCell(10) != null) {
				String is_teacherson = row.getCell(10).getStringCellValue();
				student.setIs_teacherson(checkProperty(student, is_teacherson));
				// student.setIs_teacherson(is_teacherson);
			}
			if (row.getCell(11) != null) {
				String census_type = row.getCell(11).getStringCellValue();
				student.setCensus_type(census_type);
			}
			if (row.getCell(12) != null) {
				String address = row.getCell(12).getStringCellValue();
				student.setAddress(address);
			}
			if (row.getCell(13) != null) {
				String health_status = row.getCell(13).getStringCellValue();
				student.setHealth_status(checkProperty(student, health_status));
				// student.setHealth_status(health_status);
			}
			if (row.getCell(14) != null) {
				String blood_type = row.getCell(14).getStringCellValue();
				student.setBlood_type(checkProperty(student, blood_type));
				// student.setBlood_type(blood_type);
			}
			if (row.getCell(15) != null) {
				String interest = row.getCell(15).getStringCellValue();
				student.setInterest(checkProperty(student, interest));
				// student.setInterest(interest);
			}
			if (row.getCell(16) != null) {
				String demand = row.getCell(16).getStringCellValue();
				student.setDemand(demand);
			}
			if (row.getCell(17) != null) {
				String note = row.getCell(17).getStringCellValue();
				student.setNote(note);
			}
			if (row.getCell(18) != null) {
				String timetype_id = row.getCell(18).getStringCellValue();
				student.setTimetype_id(checkProperty(student, timetype_id));
				// student.setTimetype_id(timetype_id);
			}
			if (row.getCell(19) != null) {
				String is_only_child = row.getCell(19).getStringCellValue();
				student.setIs_only_child(checkProperty(student, is_only_child));
				// student.setIs_only_child(is_only_child);
			}
			if (row.getCell(20) != null) {
				String birthplace = row.getCell(20).getStringCellValue();
				student.setBirthplace(checkProperty(student, birthplace));
				// student.setBirthplace(birthplace);
			}
			if (row.getCell(21) != null) {
				String identity_card = row.getCell(21).getStringCellValue();
				student.setIdentity_card(identity_card);
			}
			list.add(student);
		}
		return list;
	}

	@Override
	public void addStudent(Student model, String[] sInterests, String STUDENT_EDIT) throws IOException {

		String json = "";
		String student_no = model.getStudent_no();
		String phone=model.getPhone();
		String class_id = model.getClass_id();

		List<Student> list = studentDao.findStudentByStudent_noAndClasses(student_no, class_id);
		List<Student> list2 = studentDao.findStudentByPhone(phone);

		// 不是原本的名字///////也不是数据库中其他名字//
		if (list != null && list.size() > 0) {
			json = "{\"status\": 0,\"info\": \"学号被其他学生使用, 请重新输入！\"}";
			JsonUtil.writeJson(json);
			return ;
		}
		if (list2 != null && list2.size() > 0) {
			json = "{\"status\": 0,\"info\": \"手机号被其他学生使用, 请重新输入！\"}";
			JsonUtil.writeJson(json);
			return ;
		}

		String grade_id = model.getGrade_id();
		Classes classes = null;
		Grade grade = null;
		if (grade_id != null) {
			grade = gradeDao.findById(grade_id);
			model.setGrade(grade);
		}
		if (class_id != null) {
			classes = classesDao.findById(class_id);
			model.setClasses(classes);
		}

		if (class_id != null) {
			model.setStatus_name("2");
			model.setStatus_name_text("带确认入学");
		} else {
			model.setStatus_name("1");
			model.setStatus_name_text("待分班");
		}

		// List<Student> list = studentService.findByClasses(classes);

			if (sInterests != null) {
				String interests[] = { "", "", "", "", "", "" };
				StringBuffer buffer = new StringBuffer();
				if (interests != null) {
					for (int i = 0; i < sInterests.length; i++) {
						int num = Integer.parseInt(sInterests[i]);
						interests[num] = sInterests[i];
					}
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
			studentChangeLogService.addLog(model, STUDENT_EDIT);

			String password = model.getPassword();
			password = MD5Utils.md5(password);
			model.setPassword(password);

			studentDao.save(model);
			json = JsonUtil.SAVE_SUCCESS;
		
		JsonUtil.writeJson(json);

	}

	@Override
	public List<Student> findByGrade_idAndClass_id(String grade_id, String class_id) {
		return studentDao.findByGrade_idAndClass_id(grade_id, class_id);
	}

	@Override
	public List<Student> findByClasses(Classes classes) {
		return studentDao.findByClasses(classes);
	}

	@Override
	public List<Student> findStudentByStudent_noAndClasses(String student_no, String class_id) {
		return studentDao.findStudentByStudent_noAndClasses(student_no, class_id);
	}

	@Override
	public List<Student> finByLikeName(String student_name) {
		return studentDao.finByLikeName(student_name);
	}

	@Override
	public Classes getClasses(Student student) {

		String id = student.getId();
		student = studentDao.findById(id);
		Classes classes = student.getClasses();

		return classes;
	}

	@Override
	public List<Student> findByPhone(String phone) {
		return studentDao.findByPhone(phone);
	}

	@Override
	public List<Student> findByPhoneAndPassword(String phone, String password) {
		return studentDao.findByPhoneAndPassword(phone, password);
	}

	@Override
	public List<StudentImageUrl> getImageUrl(Student student) {

		String id = student.getId();
		student = studentDao.findById(id);
		Set<StudentImageUrl> studentImageUrls = student.getStudentImageUrls();
		List<StudentImageUrl> list = new ArrayList<>(studentImageUrls);

		return list;
	}

	@Override
	public List<Student> getStudent(Teacher teacher) {

		String teacher_id = teacher.getId();
		teacher = teacherDao.findById(teacher_id);
		Classes classes = teacher.getClasses();
		String classes_id = classes.getId();
		classes = classesDao.findById(classes_id);
		Set<Student> students = classes.getStudents();
		List<Student> list = new ArrayList<>(students);

		return list;

	}

	@Override
	public void importPicture(Student model, File[] fileselect) throws IOException {

		String id = model.getId();
		Student student = studentDao.findById(id);
		Set<StudentImageUrl> studentImageUrls = student.getStudentImageUrls();

		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginTeacher");
		/*
		 * Set<HomeWork> homeWorks = null; if(classes!=null){ homeWorks =
		 * classes.getHomeWorks(); }
		 */
		URL resource = SchoolAction.class.getClassLoader().getResource("");
		String path = resource.getPath();
		path = StringUtils.substringBeforeLast(path, "/WEB-INF/classes");
		path = path + "/image/student/";

		for (int i = 0; i < fileselect.length; i++) {

			File inFile = fileselect[i];
			FileInputStream fileInputStream = new FileInputStream(inFile);
			Random random = new Random();
			int nextInt = random.nextInt(1000000);
			String fileName = MD5Utils.md5(System.currentTimeMillis() + nextInt + "");
			File outFile = new File(path + fileName + ".jpg");
			System.out.println(outFile.getAbsolutePath());
			if (!outFile.exists())
				outFile.createNewFile();
			FileOutputStream fileOutputStream = new FileOutputStream(outFile);
			int c;
			byte buffer[] = new byte[1024];
			while ((c = fileInputStream.read(buffer)) != -1) {
				for (int j = 0; j < c; j++)
					fileOutputStream.write(buffer[j]);
			}
			fileInputStream.close();
			fileOutputStream.close();

			StudentImageUrl studentImageUrl = new StudentImageUrl();
			studentImageUrl.setStudent(student);
			studentImageUrl.setImage_url(fileName + ".jpg");
			studentImageUrlDao.save(studentImageUrl);
		}

	}

	@Override
	public void changeInfo(Student model, String type) {

		Student student = (Student) ServletActionContext.getRequest().getSession().getAttribute("loginParent");
		String id = student.getId();
		student = studentDao.findById(id);

		switch (type) {
		case "phone":
			String phone = model.getPhone();
			student.setPhone(phone);
			break;
		case "qq":
			String qq = model.getQq();
			student.setQq(qq);
			break;
		case "email":
			String email = model.getEmail();
			student.setEmail(email);
			break;
		case "weixin":
			String weixin = model.getWeixin();
			student.setWeixin(weixin);
			break;
		default:
			break;
		}

		ServletActionContext.getRequest().getSession().setAttribute("loginParent", student);

	}

	@Override
	public void exportStudent(String class_ids, String[] filed, String statuss) throws NoSuchFieldException,
			SecurityException, IllegalArgumentException, IllegalAccessException, IOException {

		String[] classesSplit = class_ids.split(",");
		String[] statusSplit = statuss.split(",");

		List<Student> list = null;
		// 在内存中创建一个Excel文件，通过输出流写到客户端提供下载
		HSSFWorkbook workbook = new HSSFWorkbook();
		// 创建一个sheet页
		HSSFSheet sheet = workbook.createSheet("学生数据");
		for (int i = 0; i < classesSplit.length; i++) {
			String class_id = classesSplit[i];
			Classes classes = classesDao.findById(class_id);
			String class_name = classes.getClass_name();
			list = studentDao.findByClasses(classes);

			if (list != null && list.size() > 0) {
				for (int j = 0; j < list.size(); j++) {
					Student student = list.get(j);
					HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum() + 1);
					for (int k = 0; k < filed.length; k++) {
						String parameter = filed[k];
						if (parameter.equals("class_name")) {
							dataRow.createCell(k).setCellValue(class_name);
							continue;
						}
						Field field = student.getClass().getDeclaredField(parameter);
						field.setAccessible(true);
						Object value = field.get(student);
						// field.set(student, value);
						dataRow.createCell(k).setCellValue((String) value);
					}
					System.out.println(student);
				}
			}
		}

		// 创建标题行
		/*
		 * HSSFRow headRow = sheet.createRow(0);
		 * headRow.createCell(0).setCellValue("分区编号");
		 * headRow.createCell(1).setCellValue("区域编号");
		 * headRow.createCell(2).setCellValue("地址关键字");
		 * headRow.createCell(3).setCellValue("省市区");
		 */

		String filename = "学生数据.xls";
		String agent = ServletActionContext.getRequest().getHeader("User-Agent");
		filename = FileUtil.encodeDownloadFilename(filename, agent);
		// 一个流两个头
		ServletOutputStream out = ServletActionContext.getResponse().getOutputStream();
		String contentType = ServletActionContext.getServletContext().getMimeType(filename);
		ServletActionContext.getResponse().setContentType(contentType);
		ServletActionContext.getResponse().setHeader("content-disposition", "attchment;filename=" + filename);
		workbook.write(out);

	}

}
