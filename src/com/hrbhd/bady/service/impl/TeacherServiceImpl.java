package com.hrbhd.bady.service.impl;

import java.io.File;


import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.ejb.EnterpriseBean;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.dev.EFBiffViewer;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.components.Password;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STString;
import org.quartz.simpl.ThreadContextClassLoadHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hrbhd.bady.dao.IElementDao;
import com.hrbhd.bady.dao.IPageDao;
import com.hrbhd.bady.dao.IRoleDao;
import com.hrbhd.bady.dao.IStructureDao;
import com.hrbhd.bady.dao.IStudentCheckDao;
import com.hrbhd.bady.dao.IStudentDao;
import com.hrbhd.bady.dao.IStudentImageUrlDao;
import com.hrbhd.bady.dao.ITeacherCheckDao;
import com.hrbhd.bady.dao.ITeacherDao;
import com.hrbhd.bady.dao.ITeacherDutyDao;
import com.hrbhd.bady.dao.impl.RoleDaoImpl;
import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.Element;
import com.hrbhd.bady.domain.HomeWork;
import com.hrbhd.bady.domain.Page;
import com.hrbhd.bady.domain.Role;
import com.hrbhd.bady.domain.Structure;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.StudentCheck;
import com.hrbhd.bady.domain.StudentImageUrl;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.domain.TeacherCheck;
import com.hrbhd.bady.domain.TeacherDuty;
import com.hrbhd.bady.service.IClassesService;
import com.hrbhd.bady.service.IStudentService;
import com.hrbhd.bady.service.ITeacherChangeLogService;
import com.hrbhd.bady.service.ITeacherService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.MD5Utils;
import com.hrbhd.bady.util.PageBean;
import com.hrbhd.bady.util.TimeUtil;
import com.hrbhd.bady.web.action.SchoolAction;

@Service
@Transactional
public class TeacherServiceImpl implements ITeacherService{

	@Autowired
	private ITeacherDao teacherDao;
	@Autowired
	private IStructureDao structureDao;
	@Autowired
	private ITeacherDutyDao teacherDutyDao;
	@Autowired
	private ITeacherChangeLogService teacherChangeLogService;
	@Autowired
	private IClassesService classesService;
	@Autowired
	private IStudentDao studentDao;
	@Autowired
	private IStudentImageUrlDao studentImageUrlDao;
	@Autowired
	private IStudentCheckDao studentCheckDao;
	@Autowired
	private ITeacherCheckDao teacherCheckDao;

	@Override
	public void pageQuery(PageBean pageBean) {

		teacherDao.pageQuery(pageBean);
	}

	@Override
	public void save(Teacher model) {
		teacherDao.save(model);
	}

	@Override
	public Teacher findById(String id) {
		return teacherDao.findById(id);
	}

	@Override
	public void leaveTeacher(Teacher model, String TEACHER_LEAVE) {
		String id = model.getId();
		String status = model.getStatus();
		//String status_name = model.getStatus_name();
		Teacher teacher = teacherDao.findById(id);
		teacher.setStatus("3");
		teacher.setStatus_name("已离职");
		teacherChangeLogService.addLog(teacher, TEACHER_LEAVE);
	}

	@Override
	public void retireTeacher(Teacher model, String TEACHER_RETIRE) {
		String id = model.getId();
		String status = model.getStatus();
		//String status_name = model.getStatus_name();
		Teacher teacher = teacherDao.findById(id);
		teacher.setStatus("4");
		teacher.setStatus_name("已退休");
		teacherChangeLogService.addLog(teacher, TEACHER_RETIRE);
	}

	@Override
	public void editTeacher(Teacher model) {
		String id = model.getId();
		Teacher teacher = teacherDao.findById(id);
		
		String teacher_name = model.getTeacher_name();
		String sex_name = model.getSex_name();
		String brither_name = model.getBrither_name();
		String entry_time_name = model.getEntry_time_name();
		
		String worknumber = model.getWorknumber();
		String phone = model.getPhone();
		String email = model.getEmail();
		String weixin = model.getWeixin();
		
		String qq = model.getQq();
		String field1 = model.getField1();
		String field2 = model.getField2();
		String field3 = model.getField3();
		
		String password = model.getPassword();
		if(!password.equals(teacher.getPassword())){
			password = MD5Utils.md5(password);
			teacher.setPassword(password);
		}
		String subject_id = model.getSubject_id();
		
		
		teacher.setTeacher_name(teacher_name);
		teacher.setSex_name(sex_name);
		teacher.setBrither_name(brither_name);
		teacher.setEntry_time_name(entry_time_name);
		
		teacher.setWorknumber(worknumber);
		teacher.setPhone(phone);
		teacher.setEmail(email);
		teacher.setWeixin(weixin);
		
		teacher.setQq(qq);
		teacher.setPassword(password);
		teacher.setSubject_id(subject_id);
		teacher.setField1(field1);
		teacher.setField2(field2);
		teacher.setField3(field3);
		
		ServletActionContext.getRequest().getSession().setAttribute("loginUser", teacher);
	
	}

	@Override
	public void vacationTeacher(Teacher model, String TEACHER_VACATION) {
		String id = model.getId();
		String change_date = model.getChange_date();
		String note = model.getNote();
		
		Teacher teacher = teacherDao.findById(id);
		teacher.setChange_date(change_date);
		teacher.setNote(note);
		
		teacher.setStatus("2");
		teacher.setStatus_name("休假中");
		teacherChangeLogService.addLog(teacher, TEACHER_VACATION);
		
	}

	@Override
	public void shiftTeacher(Teacher model, String TEACHER_SHIFT) {
		String id = model.getId();
		
		String tid = model.getTeacherDuty().getId();
		String sid = model.getStructure().getId();
		TeacherDuty teacherDuty = teacherDutyDao.findById(tid);
		Structure structure = structureDao.findById(sid);
		
		String change_date = model.getChange_date();
		String note = model.getNote();
		
		Teacher teacher = teacherDao.findById(id);
		
		teacher.setTeacherDuty(teacherDuty);
		teacher.setStructure(structure);
	
		teacher.setChange_date(change_date);
		teacher.setNote(note);
		teacherChangeLogService.addLog(teacher, TEACHER_SHIFT);
	}

	@Override
	public void resumeTeacher(Teacher model, String TEACHER_RESUME) {
		String id = model.getId();
		String change_date = model.getChange_date();
		String note = model.getNote();
		
		Teacher teacher = teacherDao.findById(id);
		teacher.setStatus_name("正常在校");
		teacher.setStatus("1");
		teacher.setChange_date(change_date);
		teacher.setNote(note);
		teacherChangeLogService.addLog(teacher, TEACHER_RESUME);
	}

	@Override
	public void multiplexTeacher(Teacher model) {
		String id = model.getId();
		String change_date = model.getChange_date();
		String note = model.getNote();
		
		Teacher teacher = teacherDao.findById(id);
		teacher.setStatus_name("正常在校");
		teacher.setStatus("1");
		teacher.setChange_date(change_date);
		teacher.setNote(note);
	}
	
	@Override
	public List<Teacher> resolveTeacher(Teacher model, File file) throws FileNotFoundException, IOException {
		List<Teacher> list = new ArrayList<Teacher>();
		XSSFWorkbook workbook = new XSSFWorkbook(new FileInputStream(file));
		XSSFSheet sheet = workbook.getSheetAt(0);
		for (Row row : sheet) {
			Teacher teacher = new Teacher();
			teacher.setStatus_name("正常在校");
			teacher.setStatus("1");
			int rowNum = row.getRowNum();
			if (rowNum == 0) {
				continue;
			}
			int columnNum = row.getPhysicalNumberOfCells();
			for (int i = 0; i < columnNum; i++) {

				if (i == 3 || i == 6) {
					continue;
				}

				if (row.getCell(i) != null) {
					row.getCell(i).setCellType(Cell.CELL_TYPE_STRING);
				}
			}
			if (row.getCell(0) != null) {
				String worknumber = row.getCell(0).getStringCellValue();
				teacher.setWorknumber(worknumber);
			}
			if (row.getCell(1) != null) {
				String teacher_name = row.getCell(1).getStringCellValue();
				teacher.setTeacher_name(teacher_name);
			}
			if (row.getCell(2) != null) {
				String sex_name = row.getCell(2).getStringCellValue();
				teacher.setSex_name(sex_name);
			}
			if (row.getCell(3) != null) {
				row.getCell(4).setCellType(Cell.CELL_TYPE_FORMULA);
				java.util.Date date = row.getCell(4).getDateCellValue();
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				String brither_name = format.format(date);
				System.out.println(brither_name);
				teacher.setBrither_name(brither_name);
			}
			if (row.getCell(4) != null) {
				String structure_name = row.getCell(3).getStringCellValue();
				teacher.setStructure_name(structure_name);
			}
			if (row.getCell(5) != null) {
				String duty_name = row.getCell(5).getStringCellValue();
				teacher.setDuty_name(duty_name);
			}
			if (row.getCell(6) != null) {
				row.getCell(8).setCellType(Cell.CELL_TYPE_FORMULA);
				java.util.Date date = row.getCell(8).getDateCellValue();
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				String entry_time_name = format.format(date);
				System.out.println(entry_time_name);
				teacher.setEntry_time_name(entry_time_name);
			}
			if (row.getCell(7) != null) {
				String phone = row.getCell(7).getStringCellValue();
				teacher.setPhone(phone);
			}
			if (row.getCell(8) != null) {
				String password = row.getCell(6).getStringCellValue();
				teacher.setPassword(password);
			}
			if (row.getCell(9) != null) {
				String weixin = row.getCell(9).getStringCellValue();
				teacher.setWeixin(weixin);
			}
			if (row.getCell(10) != null) {
				String qq = row.getCell(10).getStringCellValue();
				teacher.setQq(qq);
			}
			if (row.getCell(11) != null) {
				String email = row.getCell(11).getStringCellValue();
				teacher.setEmail(email);
			}
			if (row.getCell(12) != null) {
				String subject_id = row.getCell(12).getStringCellValue();
				teacher.setSubject_id(subject_id);
			}
			list.add(teacher);
		}
		return list;
	}

	@Override
	public List findTeacher(String teacher_name) {
		return teacherDao.findTeacher(teacher_name);
	}

	@Override
	public List findAll() {
		return teacherDao.findAll();
	}

	@Override
	public List<Teacher> findByPhone(String phone) {
		return teacherDao.findByPhone(phone);
	}

	@Override
	public List<Teacher> findByPhoneAndPassword(String phone, String password) {
		return teacherDao.findByPhoneAndPassword(phone,password);
	}

	@Override
	public List<Teacher> findAllTeacherByStatus() {
		return teacherDao.findAllTeacherByStatus();
	}

	@Override
	public Set<String> getPagePower(Teacher teacher) {
		
		String id = teacher.getId();
		teacher = teacherDao.findById(id);
		Set<String> pset = new HashSet<String>(); 
		
		Set<Role> roles = teacher.getRoles();
		if(roles!=null&&roles.size()>0){
			for (Role role : roles) {
				Set<Page> pages = role.getPages();
				if(pages!=null&&pages.size()>0){
					for (Page page : pages) {
						String code = page.getCode();
						pset.add(code);
					}
				}
			}
		}
		return pset;
	}

	@Override
	public Set<String> getElementPower(Teacher teacher) {
		
		String id = teacher.getId();
		teacher = teacherDao.findById(id);
		Set<String> eset = new HashSet<String>();
		
		Set<Role> roles = teacher.getRoles();
		if(roles!=null&&roles.size()>0){
			for (Role role : roles) {
				Set<Element> elements = role.getElements();
				if(elements!=null&&elements.size()>0){
					for (Element element : elements) {
						String code = element.getCode();
						eset.add(code);
					}
				}
			}
		}
		return eset;
	}

	@Override
	public List<Teacher> findByDutyName(String duty_name) {
		
		return teacherDao.findByDutyName(duty_name);
	}

	@Override
	public List<Teacher> findByStructureName(String structure_name) {
		return teacherDao.findByStructureName(structure_name);
	}

	@Override
	public List<Teacher> findByStructure(Structure structure) {
		return teacherDao.findByStructure(structure);
	}

	@Override
	public void termQuery(Teacher model, PageBean pageBean, DetachedCriteria detachedCriteria, String entry_time_start,
			String entry_time_end) {
		detachedCriteria = pageBean.getDetachedCriteria();

		detachedCriteria.setProjection(null);

		String duty_name = model.getDuty_name();
		String status = model.getStatus();
		String structure_name = model.getStructure_name();
		String teacher_name = model.getTeacher_name();
		
	
		System.out.println(model);
		if (StringUtils.isNotBlank(duty_name)) {
			if (!"全部职务".equals(duty_name)) {
				detachedCriteria.add(Restrictions.eq("teacherDuty.id", duty_name));
			}

		}
		if (StringUtils.isNotBlank(status)) {
			if (!"全部状态".equals(status)&&!"-1".equals(status)) {
				detachedCriteria.add(Restrictions.eq("status", status));
			}
		}
		if (StringUtils.isNotBlank(structure_name)) {
			if (!"1".equals(structure_name)&&!"全部部门".equals(structure_name)) {
				detachedCriteria.add(Restrictions.eq("structure.id", structure_name));
			}
		}
		if (StringUtils.isNotBlank(teacher_name)) {
				detachedCriteria.add(Restrictions.like("teacher_name", teacher_name+"%"));
		}
		
		if (StringUtils.isNotBlank(entry_time_start) && StringUtils.isNotBlank(entry_time_end)) {
			Date start_date_format = TimeUtil.getDate(entry_time_start);
			Date end_date_format = TimeUtil.getDate(entry_time_end);
		
			detachedCriteria.add(Restrictions.between("entry_time_name_date", start_date_format, end_date_format));
		} else {

			if (StringUtils.isNotBlank(entry_time_start)) {
				Date start_date_format = TimeUtil.getDate(entry_time_start);
				detachedCriteria.add(Restrictions.ge("entry_time_name_date", start_date_format));
			}
			if (StringUtils.isNotBlank(entry_time_end)) {
				Date end_date_format = TimeUtil.getDate(entry_time_end);
				detachedCriteria.add(Restrictions.le("entry_time_name_date", end_date_format));
			}
		}
	}

	@Override
	public void addTeacher(Teacher model, String TEACHER_ADD) {
		model.setCreate_time_name(TimeUtil.getCurrentTime());
		teacherDao.save(model);
		teacherChangeLogService.addLog(model, TEACHER_ADD);
	}

	@Override
	public List<Teacher> findAllTeacherLikeTeacherName(String teacher_name) {
		return teacherDao.findAllTeacherLikeTeacherName(teacher_name);
	}
	
	public String findAllTeacherToCurriculaTableAdd(){

		String json="";
		List<Teacher> list = teacherDao.findAllTeacherByStatus();
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
			json = buffer.toString();
		}
		return json;
	}

	@Override
	public void editSelf(Teacher model) throws IOException {

		String id = model.getId();
		String phone = model.getPhone();
		String weixin = model.getWeixin();
		
		Teacher teacher = teacherDao.findById(id);
		teacher.setPhone(phone);
		teacher.setWeixin(weixin);
		
		ServletActionContext.getRequest().getSession().setAttribute("loginUser", teacher);
		
		String json ="{\"status\": 1,\"info\": \"保存成功\"}";
		JsonUtil.writeJson(json);
		
	}

	@Override
	public void editPassword(Teacher model,String new_password, String new_password_copy) throws IOException {
		
		String id = model.getId();
		String password = model.getPassword();
		String md5Password = MD5Utils.md5(password);
		List<Teacher> list =  teacherDao.findAllTeacherByIdAndPassword(id,md5Password);
		String json="";
		if(list!=null&&list.size()>0){
			if(new_password.equals(new_password_copy)){
				Teacher teacher = teacherDao.findById(id);
				String md5NewPassword = MD5Utils.md5(new_password);
				teacher.setPassword(md5NewPassword);
				json="{\"status\":1,\"info\":\"保存成功\"}";
			}else{
				json="{\"status\":0,\"info\":\"两次输入的新密码不一致\"}";
			}
		}else{
			json="{\"status\":0,\"info\":\"请输入正确的旧密码\"}";
		}
		JsonUtil.writeJson(json);
	}

	@Override
	public StudentCheck findByStudentIdAndDate(String student_id) {
		
		return studentCheckDao.findByStudentIdAndDate(student_id);
	}

	@Override
	public void changeInfo(Teacher model,String type) {
		
		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginTeacher");
		String id = teacher.getId();
		teacher = teacherDao.findById(id);
		
		switch (type) {
		case "phone":
			String phone = model.getPhone();
			teacher.setPhone(phone);
			break;
		case "qq":
			String qq = model.getQq();
			teacher.setQq(qq);
			break;
		case "email":
			String email = model.getEmail();
			teacher.setEmail(email);
			break;
		case "weixin":
			String weixin = model.getWeixin();
			teacher.setWeixin(weixin);
			break;
		default:
			break;
		}
		
		ServletActionContext.getRequest().getSession().setAttribute("loginTeacher", teacher);
		
	}

	@Override
	public void setTeacherLoginTime(String id) {
		
		Teacher teacher = teacherDao.findById(id);
		teacher.setLast_login_time_name(TimeUtil.getCurrentTime());
	}

	@Override
	public List<Teacher> findByWorknumber(String worknumber) {
		return teacherDao.findByWorknumber(worknumber);
	}

	@Override
	public List<Teacher> findAllTeacherByStatusAndName(String teacher_name) {
		return teacherDao.findAllTeacherByStatusAndName(teacher_name);
	}

}
