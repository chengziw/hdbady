package com.hrbhd.bady.service.impl;

import java.awt.image.BufferedImageFilter;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.hrbhd.bady.dao.IClassesDao;
import com.hrbhd.bady.dao.IGradeDao;
import com.hrbhd.bady.dao.INoticeDao;
import com.hrbhd.bady.dao.INoticeStudentCheckDao;
import com.hrbhd.bady.dao.INoticeTeacherCheckDao;
import com.hrbhd.bady.dao.IStructureDao;
import com.hrbhd.bady.dao.IStudentDao;
import com.hrbhd.bady.dao.ITeacherDao;
import com.hrbhd.bady.domain.Ask;
import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.Notice;
import com.hrbhd.bady.domain.NoticeStudentCheck;
import com.hrbhd.bady.domain.NoticeTeacherCheck;
import com.hrbhd.bady.domain.Structure;
import com.hrbhd.bady.domain.StructureAdapter;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.service.INoticeService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.PageBean;
import com.hrbhd.bady.util.TimeUtil;
import com.hrbhd.bady.util.TreeBuilder2;

@Service
@Transactional
public class NoticeServiceImpl implements INoticeService {

	@Autowired
	private INoticeDao noticeDao;
	@Autowired
	private IGradeDao gradeDao;
	@Autowired
	private IClassesDao classesDao;
	@Autowired
	private ITeacherDao teacherDao;
	@Autowired
	private IStudentDao studentDao;
	@Autowired
	private IStructureDao structureDao;
	@Autowired
	private INoticeStudentCheckDao noticeStudentCheckDao;
	@Autowired
	private INoticeTeacherCheckDao noticeTeacherCheckDao;

	@Override
	public void pageQuery(PageBean pageBean) {
		noticeDao.pageQuery(pageBean);
	}

	@Override
	public void save(Notice model) {
		noticeDao.save(model);
	}

	@Override
	public void addNotice(Notice model, String[] push_ranges) throws IOException {

		String notice_type = model.getNotice_type();
		List<String> slist = Arrays.asList(push_ranges);
		List<String> removeList = new ArrayList<String>();
		Set<Student> students = new HashSet<Student>();
		Set<Teacher> teachers = new HashSet<Teacher>();

		StringBuffer buffer = new StringBuffer();
		if ("1".equals(notice_type)) {
			// 职务
			// CopyOnWriteArrayList<String> slist =
			// (CopyOnWriteArrayList<String>) Arrays.asList(push_ranges);
			if (push_ranges != null && push_ranges.length > 0) {
				for (int i = 0; i < push_ranges.length; i++) {
					String id = push_ranges[i];
					Structure structure = structureDao.findByPId(id);
					if (structure != null) {
						removeList.remove(id);
					}
					// 把id都存进去,方便回显.
					if (i == push_ranges.length - 1) {
						buffer.append(id);
					} else {
						buffer.append(id + ",");
					}
				}
			}
			slist.removeAll(removeList);
			for (String string : slist) {
				Structure structure = structureDao.findById(string);
				// String structure_name = structure.getName();
				// List<Teacher> tlist =
				// teacherService.findByStructureName(structure_name);
				if (structure != null) {
					List<Teacher> tlist = teacherDao.findByStructure(structure);
					HashSet<Teacher> tset = new HashSet<Teacher>(tlist);
					teachers.addAll(tset);
				}
				// 建立关联
			}
			// model.setTeachers(teachers);
		} else {
			// 班级
			// CopyOnWriteArrayList<String> slist =
			// (CopyOnWriteArrayList<String>) Arrays.asList(push_ranges);
			if (push_ranges != null && push_ranges.length > 0) {
				for (int i = 0; i < push_ranges.length; i++) {
					/*
					 * if("0".equals(push_ranges[i])){ continue; }
					 */
					String id = push_ranges[i];
					Grade grade = gradeDao.findById(id);
					if (grade != null) {
						removeList.remove(id);
					}
					
					// 把id都存进去,方便回显.
					if (i == push_ranges.length - 1) {
						buffer.append(id);
					} else {
						buffer.append(id + ",");
					}
				}
			}
			slist.removeAll(removeList);
			for (String string : slist) {
				Classes classes = classesDao.findById(string);
				// String class_id = classes.getId();
				// List<Student> stulist =
				// studentService.findByGrade_idAndClass_id(grade_id, class_id);
				// 为了单独判断一种情况,就是列表显示的全部学校,此时id为0.找不到classes.
				if (classes != null) {
					List<Student> stulist = studentDao.findByClasses(classes);
					HashSet<Student> sset = new HashSet<Student>(stulist);
					students.addAll(sset);
				}
				classes = null;
			}
			// model.setStudents(students);

		}

		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginUser");
		String teacher_name = teacher.getTeacher_name();
		model.setCreate_teacher_name(teacher_name);

		String currentTime = TimeUtil.getCurrentTime();
		model.setCreate_time_name(currentTime);

		model.setPush_range(buffer.toString());
		
		noticeDao.save(model);

		// 建立关联
		if (teachers.size() > 0) {
			Set<NoticeTeacherCheck> noticeTeacherChecks = new HashSet<NoticeTeacherCheck>();
			for (Teacher teacher1 : teachers) {
				NoticeTeacherCheck noticeTeacherCheck = new NoticeTeacherCheck();
				noticeTeacherCheck.setTeacher(teacher1);
				// TODO
				// 可能需要改
				noticeTeacherCheck.setNotice(model);
				noticeTeacherCheckDao.save(noticeTeacherCheck);
				noticeTeacherChecks.add(noticeTeacherCheck);
			}
			model.setNoticeTeacherChecks(noticeTeacherChecks);
		}
		// 建立关联
		if (students.size() > 0) {
			Set<NoticeStudentCheck> noticeStudentChecks = new HashSet<NoticeStudentCheck>();
			for (Student student1 : students) {
				NoticeStudentCheck noticeStudentCheck = new NoticeStudentCheck();
				noticeStudentCheck.setStudent(student1);
				noticeStudentCheck.setNotice(model);
				noticeStudentCheckDao.save(noticeStudentCheck);
				noticeStudentChecks.add(noticeStudentCheck);
			}
			model.setNoticeStudentChecks(noticeStudentChecks);
		}

		String json = "{\"status\": 1, \"info\": \"保存成功\"}";
		JsonUtil.writeJson(json);
	}

	@Override
	public Notice findById(String id) {
		return noticeDao.findById(id);
	}

	@Override
	public void delete(Notice notice) {
		noticeDao.delete(notice);
	}

	@Override
	public void putOutNotice(Notice model) throws IOException {

		String id = model.getId();
		String is_check = model.getIs_check();

		Notice notice = noticeDao.findById(id);
		notice.setIs_check(is_check);

		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginUser");
		String teacher_id = teacher.getId();
		String teacher_name = teacher.getTeacher_name();
		String currentTime = TimeUtil.getCurrentTime();
		notice.setCheck_teacher_id(teacher_id);
		notice.setCheck_teacher_name(teacher_name);
		notice.setCheck_time_name(currentTime);

		String json = "{\"status\": 1, \"info\": \"发布成功！\"}";
		JsonUtil.writeJson(json);
	}

	@Override
	public void editNotice(Notice model) throws IOException {

		String id = model.getId();
		String title = model.getTitle();
		String descs = model.getDescs();

		Notice notice = noticeDao.findById(id);
		notice.setTitle(title);
		notice.setDescs(descs);

		String json = "{\"status\": 1,\"info\": \"操作成功！\"}";
		JsonUtil.writeJson(json);

	}

	@Override
	public List<Notice> findAll() {
		return noticeDao.findAll();
	}

	@Override
	public void findNoCheck(Notice model) throws IOException {

		String id = model.getId();
		Notice notice = noticeDao.findById(id);
		String notice_type = notice.getNotice_type();

		String json = "";
		StringBuffer buffer = new StringBuffer();

		if ("1".equals(notice_type)) {
			buffer.append("{");
			NoticeTeacherCheck noticeTeacherCheck = null;
			List<NoticeTeacherCheck> noticeTeacherChecks = noticeTeacherCheckDao.findByNoticeIdAndNOCheck(id);
			if (noticeTeacherChecks != null && noticeTeacherChecks.size() > 0) {
				buffer.append("\"total\": " + noticeTeacherChecks.size() + ",");
				buffer.append("\"rows\": [");
				for (int i = 0; i < noticeTeacherChecks.size(); i++) {
					noticeTeacherCheck = noticeTeacherChecks.get(i);
					Teacher teacher = noticeTeacherCheck.getTeacher();
					buffer.append("{");

					/*buffer.append("\"id\": \"" + noticeTeacherCheck.getId() + "\",");
					buffer.append("\"notice_id\": \"" + id + "\",");
					buffer.append("\"user_id\": \"" + teacher.getId() + "\",");
					buffer.append("\"view_time\": \"0\",");*/
					buffer.append("\"show_name\": \"" + teacher.getTeacher_name() + "\",");
					/*buffer.append("\"is_push_ok\": \"1\",");
					buffer.append("\"student_id\": \"0\",");*/
					buffer.append("\"view_time_name\": \"未查看\"");

					if (i == noticeTeacherChecks.size()-1) {
						buffer.append("}");
					} else {
						buffer.append("},");
					}
				}

				buffer.append("]");
			}
		buffer.append("}");
		} else {
			buffer.append("{");
			NoticeStudentCheck noticeStudentCheck = null;
			List<NoticeStudentCheck> noticeStudentChecks = noticeStudentCheckDao.findByNoticeIdAndNoCheck(id);
			if (noticeStudentChecks != null && noticeStudentChecks.size() > 0) {

				buffer.append("\"total\": " + noticeStudentChecks.size() + ",");
				buffer.append("\"rows\": [");
				for (int i = 0; i < noticeStudentChecks.size(); i++) {
					noticeStudentCheck = noticeStudentChecks.get(i);
					Student student = noticeStudentCheck.getStudent();
					buffer.append("{");

					/*buffer.append("\"id\": \"" + noticeStudentCheck.getId() + "\",");
					buffer.append("\"notice_id\": \"" + id + "\",");
					buffer.append("\"user_id\": \"0\",");
					buffer.append("\"view_time\": \"0\",");*/
					buffer.append("\"show_name\": \"" + student.getParent_name() + "\",");
					/*buffer.append("\"is_push_ok\": \"1\",");
					buffer.append("\"student_id\": \"" + student.getId() + "\",");*/
					buffer.append("\"view_time_name\": \"未查看\"");

					if (i == noticeStudentChecks.size()-1) {
						buffer.append("}");
					} else {
						buffer.append("},");
					}
				}

				buffer.append("]");
			}
			buffer.append("}");
		}
		json = buffer.toString();
		JsonUtil.writeJson(json);
	}

	@Override
	public void findCheck(Notice model) throws IOException {

		String id = model.getId();
		Notice notice = noticeDao.findById(id);
		String notice_type = notice.getNotice_type();

		String json = "";
		StringBuffer buffer = new StringBuffer();
		buffer.append("{");
		if ("1".equals(notice_type)) {
			NoticeTeacherCheck noticeTeacherCheck = null;
			List<NoticeTeacherCheck> noticeTeacherChecks = noticeTeacherCheckDao.findByNoticeIdAndCheck(id);
			if (noticeTeacherChecks != null && noticeTeacherChecks.size() > 0) {
				buffer.append("\"total\": " + noticeTeacherChecks.size() + ",");
				buffer.append("\"rows\": [");
				for (int i = 0; i < noticeTeacherChecks.size(); i++) {
					noticeTeacherCheck = noticeTeacherChecks.get(i);
					Teacher teacher = noticeTeacherCheck.getTeacher();
					buffer.append("{");

					/*buffer.append("\"id\": \"" + noticeTeacherCheck.getId() + "\",");
					buffer.append("\"notice_id\": \"" + id + "\",");
					buffer.append("\"user_id\": \"" + teacher.getId() + "\",");
					buffer.append("\"view_time\": \"0\",");*/
					buffer.append("\"show_name\": \"" + teacher.getTeacher_name() + "\",");
					/*buffer.append("\"is_push_ok\": \"1\",");
					buffer.append("\"student_id\": \"0\",");*/
					//TODO
					//时间哈
					buffer.append("\"view_time_name\": \"已查看\"");

					if (i == noticeTeacherChecks.size()-1) {
						buffer.append("}");
					} else {
						buffer.append("},");
					}
				}

				buffer.append("]");
			}
			buffer.append("}");
		} else {
			NoticeStudentCheck noticeStudentCheck = null;
			List<NoticeStudentCheck> noticeStudentChecks = noticeStudentCheckDao.findByNoticeIdAndCheck(id);
			if (noticeStudentChecks != null && noticeStudentChecks.size() > 0) {

				buffer.append("\"total\": " + noticeStudentChecks.size() + ",");
				buffer.append("\"rows\": [");
				for (int i = 0; i < noticeStudentChecks.size(); i++) {
					noticeStudentCheck = noticeStudentChecks.get(i);
					Student student = noticeStudentCheck.getStudent();
					buffer.append("{");

					/*buffer.append("\"id\": \"" + noticeStudentCheck.getId() + "\",");
					buffer.append("\"notice_id\": \"" + id + "\",");
					buffer.append("\"user_id\": \"0\",");
					buffer.append("\"view_time\": \"0\",");*/
					buffer.append("\"show_name\": \"" + student.getParent_name() + "\",");
					/*buffer.append("\"is_push_ok\": \"1\",");
					buffer.append("\"student_id\": \"" + student.getId() + "\",");*/
					//TODO
					//时间哈
					buffer.append("\"view_time_name\": \"已查看\"");

					if (i == noticeStudentChecks.size()-1) {
						buffer.append("}");
					} else {
						buffer.append("},");
					}
				}

				buffer.append("]");
			}
			buffer.append("}");

		}

		json = buffer.toString();
		JsonUtil.writeJson(json);

	}

	@Override
	public void checkRange(Notice model) throws IOException {
		
		String id = model.getId();
		Notice notice = noticeDao.findById(id);
		String ask_type = notice.getNotice_type();
		String push_range = notice.getPush_range();

		String json = "";
		StringBuffer buffer = new StringBuffer();
		String[] ids = push_range.split(",");
		// 转换之后的集合
		List<StructureAdapter> structure2s = new ArrayList<StructureAdapter>();
		List<Classes> classes = new ArrayList<Classes>();

		buffer.append("{\"status\": 1,\"info\":");
		if ("1".equals(ask_type)) {
			for (int i = 0; i < ids.length; i++) {
				Structure structure = structureDao.findById(ids[i]);
				StructureAdapter structure2 = new StructureAdapter(structure.getId(), structure.getName(),
						structure.getParent_id());
				structure2s.add(structure2);
			}

			TreeBuilder2 treeBuilder2 = new TreeBuilder2(structure2s);
			buffer.append(treeBuilder2.buildJSONTree());

		} else {
			List<String> list = Arrays.asList(ids);
			Set<Grade> grades = new HashSet<Grade>();
			for (int i = 0; i < ids.length; i++) {
				Classes classe = classesDao.findById(ids[i]);
				if (classe != null) {
					Grade grade = classe.getGrade();
					grades.add(grade);
				}
			}
			int i = 0;
			buffer.append("[");
			for (Grade grade : grades) {
				buffer.append("{");
				buffer.append("\"id\": \"" + i + "\",");
				buffer.append("\"name\": \"" + grade.getName() + "\",");
				buffer.append("\"pid\": 0,");
				buffer.append("\"children\": [");

				Set<Classes> classess = grade.getClasses();
				int j = 0;
				for (Classes classe : classess) {

					String id2 = classe.getId();
					if(list.contains(id2)){
						
						buffer.append("{");
						buffer.append("\"id\": \"" + j + "\",");
						buffer.append("\"name\": \"" + classe.getClass_name() + "\",");
						buffer.append("\"pid\": 0");
						buffer.append("},");
						
						/*if (j == classess.size()-1) {
							buffer.append("}");
						} else {
							buffer.append("},");
						}*/
						
					}	
					j++;
				}
				buffer.deleteCharAt(buffer.length()-1);
				
				buffer.append("]");
				if (i == grades.size()-1) {
					buffer.append("}");
				} else {
					buffer.append("},");
				}
				i++;
			}
			buffer.append("]");
		
		}
		buffer.append("}");

		json = buffer.toString();
		JsonUtil.writeJson(json);
		
	}

	@Override
	public void termQuery(Notice model, PageBean pageBean, DetachedCriteria detachedCriteria, String start_time,
			String end_time) {

		detachedCriteria = pageBean.getDetachedCriteria();
		detachedCriteria.setProjection(null);

		String notice_type = model.getNotice_type();
		String create_teacher_name = model.getCreate_teacher_name();
		String title = model.getTitle();
		
		//status_name = new String(status_name.getBytes("iso8859-1"), "utf-8");
		//name = new String(name.getBytes("iso8859-1"), "utf-8");
		
		if (StringUtils.isNotBlank(notice_type)) {
			if (!"0".equals(notice_type)) {
				detachedCriteria.add(Restrictions.eq("notice_type", notice_type));
			}

		}
		if (StringUtils.isNotBlank(create_teacher_name)) {
			detachedCriteria.add(Restrictions.eq("create_teacher_name", create_teacher_name));
		}
		if (StringUtils.isNotBlank(title)) {
			detachedCriteria.add(Restrictions.eq("title", title));
		}

		if (StringUtils.isNotBlank(start_time) && StringUtils.isNotBlank(end_time)) {
			Date start_date_format = TimeUtil.getDate(start_time);
			Date end_date_format = TimeUtil.getDate(end_time);
			Long time = end_date_format.getTime()+(long)86400000;
			end_date_format = new Date(time);
			
			detachedCriteria.add(Restrictions.between("check_time_name_format", start_date_format, end_date_format));
		} else {

			if (StringUtils.isNotBlank(start_time)) {
				Date start_date_format = TimeUtil.getDate(start_time);
				detachedCriteria.add(Restrictions.ge("check_time_name_format", start_date_format));
			}
			if (StringUtils.isNotBlank(end_time)) {
				Date end_date_format = TimeUtil.getDate(end_time);
				Long time = end_date_format.getTime()+(long)86400000;
				end_date_format = new Date(time);
				detachedCriteria.add(Restrictions.le("check_time_name_format", end_date_format));
			}
		}
		
	}

	@Override
	public void t_read(Notice model) {
		
		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginTeacher");
		/*String tid = teacher.getId();
		String nid = model.getId();
		
		NoticeTeacherCheck noticeTeacherCheck = noticeTeacherCheckDao.findByTeacherAndNotice(tid,nid);*/
		NoticeTeacherCheck noticeTeacherCheck = noticeTeacherCheckDao.findByNoticeAndTeacher(model, teacher);
		if(noticeTeacherCheck!=null){
			noticeTeacherCheck.setChecked("True");
		}
		
	}

	@Override
	public void p_read(Notice model) {
		
		Student student = (Student) ServletActionContext.getRequest().getSession().getAttribute("loginParent");
		
		NoticeStudentCheck noticeStudentCheck = noticeStudentCheckDao.findByNoticeAndStudent(model, student);
		if(noticeStudentCheck!=null){
			noticeStudentCheck.setChecked("True");
		}
	}

}
