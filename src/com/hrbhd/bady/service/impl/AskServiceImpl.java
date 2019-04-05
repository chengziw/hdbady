package com.hrbhd.bady.service.impl;

import java.awt.image.BufferedImageFilter;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.metamodel.IdentifiableType;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.quartz.xml.JobSchedulingBundle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hrbhd.bady.dao.IAskDao;
import com.hrbhd.bady.dao.IAskItemsDao;
import com.hrbhd.bady.dao.IAskStudentCheckDao;
import com.hrbhd.bady.dao.IAskTeacherCheckDao;
import com.hrbhd.bady.dao.IClassesDao;
import com.hrbhd.bady.dao.IGradeDao;
import com.hrbhd.bady.dao.IStructureDao;
import com.hrbhd.bady.dao.IStudentDao;
import com.hrbhd.bady.dao.ITeacherDao;
import com.hrbhd.bady.domain.Ask;
import com.hrbhd.bady.domain.AskItems;
import com.hrbhd.bady.domain.AskStudentCheck;
import com.hrbhd.bady.domain.AskTeacherCheck;
import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.Notice;
import com.hrbhd.bady.domain.Structure;
import com.hrbhd.bady.domain.StructureAdapter;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.service.IAskService;
import com.hrbhd.bady.service.IAskStudentCheckService;
import com.hrbhd.bady.service.IAskTeacherCheckService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.PageBean;
import com.hrbhd.bady.util.TimeUtil;
import com.hrbhd.bady.util.TreeBuilder;
import com.hrbhd.bady.util.TreeBuilder2;

@Service
@Transactional
public class AskServiceImpl implements IAskService {

	@Autowired
	private IAskDao askDao;
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
	private IAskTeacherCheckDao askTeacherCheckDao;
	@Autowired
	private IAskStudentCheckDao askStudentCheckDao;
	@Autowired
	private IAskItemsDao askItemsDao;

	@Override
	public void pageQuery(PageBean pageBean) {
		askDao.pageQuery(pageBean);
	}

	@Override
	public Ask findById(String id) {
		return askDao.findById(id);
	}

	@Override
	public void addNotice(Ask model, String[] push_ranges, String[] ask_answer_input) throws IOException {

		String ask_type = model.getAsk_type();
		List<String> slist = Arrays.asList(push_ranges);
		List<String> removeList = new ArrayList<String>();
		Set<Teacher> teachers = new HashSet<Teacher>();
		Set<Student> students = new HashSet<Student>();

		StringBuffer buffer = new StringBuffer();
		if ("1".equals(ask_type)) {
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

		/*
		 * StringBuffer buffer = new StringBuffer(); (int i = 0; i <
		 * ask_answer_input.length; i++) {
		 * 
		 * if (i == ask_answer_input.length - 1) {
		 * buffer.append(ask_answer_input[i]); } else {
		 * buffer.append(ask_answer_input[i] + ","); } }
		 * model.setAsk_answer(buffer.toString());
		 */

		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginUser");
		String teacher_name = teacher.getTeacher_name();
		model.setCreate_teacher_name(teacher_name);

		String currentTime = TimeUtil.getCurrentTime();
		model.setCreate_time_name(currentTime);

		model.setPush_range(buffer.toString());

		askDao.save(model);

		///////////////////////////////////////////////////////////////////////////
		// model.setTeachers(teachers);
		// 建立关联
		if (teachers.size() > 0) {
			Set<AskTeacherCheck> askTeacherChecks = new HashSet<AskTeacherCheck>();
			for (Teacher teacher1 : teachers) {
				AskTeacherCheck askTeacherCheck = new AskTeacherCheck();
				askTeacherCheck.setTeacher(teacher1);
				// TODO
				// 可能需要改
				askTeacherCheck.setAsk(model);
				askTeacherCheckDao.save(askTeacherCheck);
				askTeacherChecks.add(askTeacherCheck);
			}
			model.setAskTeacherChecks(askTeacherChecks);
		}
		// 建立关联
		if (students.size() > 0) {
			Set<AskStudentCheck> askStudentChecks = new HashSet<AskStudentCheck>();
			for (Student student1 : students) {
				AskStudentCheck askStudentCheck = new AskStudentCheck();
				askStudentCheck.setStudent(student1);
				askStudentCheck.setAsk(model);
				askStudentCheckDao.save(askStudentCheck);
				askStudentChecks.add(askStudentCheck);
			}
			model.setAskStudentChecks(askStudentChecks);
		}
		///////////////////////////////////////////////////////////////////
		// 添加选项条目
		if (ask_answer_input != null) {
			for (int i = 0; i < ask_answer_input.length; i++) {
				AskItems askItems = new AskItems();
				askItems.setAsk(model);
				askItems.setTitle(ask_answer_input[i]);
				askItemsDao.save(askItems);
			}
		}
		String json = "{\"status\": 1, \"info\": \"保存成功\"}";
		JsonUtil.writeJson(json);
	}

	@Override
	public void delete(Ask ask) {
		askDao.delete(ask);

	}

	@Override
	public void putOutAsk(Ask model) throws IOException {

		String id = model.getId();
		String is_check = model.getIs_check();

		Ask ask = askDao.findById(id);
		ask.setIs_check(is_check);

		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginUser");
		String teacher_id = teacher.getId();
		String teacher_name = teacher.getTeacher_name();
		String currentTime = TimeUtil.getCurrentTime();
		ask.setCheck_teacher_id(teacher_id);
		ask.setCheck_teacher_name(teacher_name);
		ask.setCheck_time_name(currentTime);

		String json = "{\"status\": 1, \"info\": \"发布成功！\"}";
		JsonUtil.writeJson(json);

	}

	@Override
	public void editAsk(Ask model, String[] ask_answer_input) throws IOException {

		String id = model.getId();
		String title = model.getTitle();
		String end_time = model.getEnd_time();

		Ask ask = askDao.findById(id);
		ask.setTitle(title);
		ask.setEnd_time(end_time);
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i < ask_answer_input.length; i++) {
			if (i == ask_answer_input.length - 1) {
				buffer.append(ask_answer_input[i]);
			} else {
				buffer.append(ask_answer_input[i] + ",");
			}
		}
		ask.setAsk_answer(buffer.toString());

		String json = "{\"status\": 1,\"info\": \"操作成功！\"}";
		JsonUtil.writeJson(json);

	}

	public List<Ask> findAll() {

		return askDao.findAll();
	}

	@Override
	public Set<AskItems> getAskItems(Ask ask) {
		String id = ask.getId();
		ask = askDao.findById(id);
		Set<AskItems> askItems = ask.getAskItems();
		return askItems;
	}

	@Override
	public void findNoCheck(Ask model) throws IOException {

		String id = model.getId();
		Ask ask = askDao.findById(id);
		String ask_type = ask.getAsk_type();

		String json = "";
		StringBuffer buffer = new StringBuffer();

		if ("1".equals(ask_type)) {
			buffer.append("{");
			AskTeacherCheck askTeacherCheck = null;
			List<AskTeacherCheck> askTeacherChecks = askTeacherCheckDao.findByAskIdAndNoCheck(id);
			if (askTeacherChecks != null && askTeacherChecks.size() > 0) {
				buffer.append("\"total\": " + askTeacherChecks.size() + ",");
				buffer.append("\"rows\": [");
				for (int i = 0; i < askTeacherChecks.size(); i++) {
					askTeacherCheck = askTeacherChecks.get(i);
					Teacher teacher = askTeacherCheck.getTeacher();
					buffer.append("{");

					buffer.append("\"id\": \"" + askTeacherCheck.getId() + "\",");
					buffer.append("\"ask_id\": \"" + ask.getId() + "\",");
					buffer.append("\"user_id\": \"" + teacher.getId() + "\",");
					buffer.append("\"submit_time\": \"1492064991\",");
					buffer.append("\"ask_answer_ids\": \",17,\",");
					buffer.append("\"show_name\": \"" + teacher.getTeacher_name() + "\",");
					buffer.append("\"is_push_ok\": \"1\",");
					buffer.append("\"student_id\": \"\",");
					buffer.append("\"submit_time_name\": \"未提交\"");

					if (i == askTeacherChecks.size() - 1) {
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
			AskStudentCheck askStudentCheck = null;
			List<AskStudentCheck> askStudentChecks = askStudentCheckDao.findByAskIdAndNoCheck(id);
			if (askStudentChecks != null && askStudentChecks.size() > 0) {
				buffer.append("\"total\": " + askStudentChecks.size() + ",");
				buffer.append("\"rows\": [");
				for (int i = 0; i < askStudentChecks.size(); i++) {
					askStudentCheck = askStudentChecks.get(i);
					Student student = askStudentCheck.getStudent();

					buffer.append("{");

					buffer.append("\"id\": \"" + askStudentCheck.getId() + "\",");
					buffer.append("\"ask_id\": \"" + ask.getId() + "\",");
					buffer.append("\"user_id\": \"" + student.getId() + "\",");
					buffer.append("\"submit_time\": \"1492064991\",");
					buffer.append("\"ask_answer_ids\": \",17,\",");
					buffer.append("\"show_name\": \"" + student.getParent_name() + "\",");
					buffer.append("\"is_push_ok\": \"1\",");
					buffer.append("\"student_id\": \"\",");
					buffer.append("\"submit_time_name\": \"未提交\"");

					if (i == askStudentChecks.size() - 1) {
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
	public void findCheck(Ask model) throws IOException {

		String id = model.getId();
		Ask ask = askDao.findById(id);
		String ask_type = ask.getAsk_type();

		String json = "";
		StringBuffer buffer = new StringBuffer();

		if ("1".equals(ask_type)) {
			buffer.append("{");
			AskTeacherCheck askTeacherCheck = null;
			List<AskTeacherCheck> askTeacherChecks = askTeacherCheckDao.findByAskIdAndCheck(id);
			if (askTeacherChecks != null && askTeacherChecks.size() > 0) {
				buffer.append("\"total\": " + askTeacherChecks.size() + ",");
				buffer.append("\"rows\": [");
				for (int i = 0; i < askTeacherChecks.size(); i++) {
					askTeacherCheck = askTeacherChecks.get(i);
					Teacher teacher = askTeacherCheck.getTeacher();
					buffer.append("{");

					buffer.append("\"id\": \"" + askTeacherCheck.getId() + "\",");
					buffer.append("\"ask_id\": \"" + ask.getId() + "\",");
					buffer.append("\"user_id\": \"" + teacher.getId() + "\",");
					buffer.append("\"submit_time\": \"1492064991\",");
					buffer.append("\"ask_answer_ids\": \",17,\",");
					buffer.append("\"show_name\": \"" + teacher.getTeacher_name() + "\",");
					buffer.append("\"is_push_ok\": \"1\",");
					buffer.append("\"student_id\": \"\",");
					buffer.append("\"submit_time_name\": \"已提交\"");

					if (i == askTeacherChecks.size() - 1) {
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
			AskStudentCheck askStudentCheck = null;
			List<AskStudentCheck> askStudentChecks = askStudentCheckDao.findByAskIdAndCheck(id);
			if (askStudentChecks != null && askStudentChecks.size() > 0) {
				buffer.append("\"total\": " + askStudentChecks.size() + ",");
				buffer.append("\"rows\": [");
				for (int i = 0; i < askStudentChecks.size(); i++) {
					askStudentCheck = askStudentChecks.get(i);
					Student student = askStudentCheck.getStudent();

					buffer.append("{");

					buffer.append("\"id\": \"" + askStudentCheck.getId() + "\",");
					buffer.append("\"ask_id\": \"" + ask.getId() + "\",");
					buffer.append("\"user_id\": \"" + student.getId() + "\",");
					buffer.append("\"submit_time\": \"1492064991\",");
					buffer.append("\"ask_answer_ids\": \",17,\",");
					buffer.append("\"show_name\": \"" + student.getParent_name() + "\",");
					buffer.append("\"is_push_ok\": \"1\",");
					buffer.append("\"student_id\": \"\",");
					buffer.append("\"submit_time_name\": \"已提交\"");

					if (i == askStudentChecks.size() - 1) {
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
	public void edit(Ask model) {
		String id = model.getId();
		Ask ask = askDao.findById(id);
		ServletActionContext.getContext().getValueStack().set("ask", ask);
		/*
		 * String ask_answer = ask.getAsk_answer(); if(!"".equals(ask_answer)){
		 * String[] ask_answers = ask_answer.split(",");
		 * ServletActionContext.getContext().put("ask_answers", ask_answers); }
		 */
		Set<AskItems> askItems = ask.getAskItems();
		String[] ask_answers = null;
		if (askItems != null && askItems.size() > 0) {
			ask_answers = new String[askItems.size()];
			int i = 0;
			for (AskItems askItem : askItems) {
				String title = askItem.getTitle();
				ask_answers[i] = title;
				i++;
			}
			// ask_answers = (String[]) askItems.toArray();
			ServletActionContext.getContext().put("ask_answers", ask_answers);
		}

	}

	@Override
	public void about(Ask model) {

		String id = model.getId();
		Ask ask = askDao.findById(id);
		String ask_type = ask.getAsk_type();
		Set<AskItems> askItems = ask.getAskItems();

		int i = 0;
		String[] list = new String[askItems.size()];
		String[] items = new String[askItems.size()];
		String[] chance = new String[askItems.size()];
		String[] itemsId = new String[askItems.size()];
		for (AskItems askItem : askItems) {
			Set<AskTeacherCheck> tmonther = ask.getAskTeacherChecks();
			Set<AskStudentCheck> smother = ask.getAskStudentChecks();
			String askItemsId = askItem.getId();
			if ("1".equals(ask_type)) {
				List<AskTeacherCheck> askTeacherChecks = askTeacherCheckDao.findByChecked(askItemsId);
				list[i] = askTeacherChecks.size() + "";
				items[i] = askItem.getTitle();
				if (tmonther.size() != 0) {
					chance[i] = 100 * askTeacherChecks.size() / tmonther.size() + "";
				}
				itemsId[i] = askItem.getId();
			} else {
				List<AskStudentCheck> askStudentChecks = askStudentCheckDao.findByChecked(askItemsId);
				list[i] = askStudentChecks.size() + "";
				items[i] = askItem.getTitle();
				if (tmonther.size() != 0) {
					chance[i] = 100 * askStudentChecks.size() / smother.size() + "";
				}
				itemsId[i] = askItem.getId();
			}
			i++;
		}
		for (String string : chance) {
			System.out.println(string);
		}
		ServletActionContext.getContext().getValueStack().set("ask", ask);
		ServletActionContext.getContext().getValueStack().set("list", list);
		ServletActionContext.getContext().getValueStack().set("items", items);
		ServletActionContext.getContext().getValueStack().set("chance", chance);
		ServletActionContext.getContext().getValueStack().set("itemsId", itemsId);

	}

	@Override
	public void aboutAboutAsk(Ask model, String askItemsId) throws IOException {

		String id = model.getId();
		Ask ask = askDao.findById(id);
		String ask_type = ask.getAsk_type();
		StringBuffer buffer = new StringBuffer();
		String json = "";

		if ("1".equals(ask_type)) {
			buffer.append("{");
			AskTeacherCheck askTeacherCheck = null;
			List<AskTeacherCheck> askTeacherChecks = askTeacherCheckDao.findByChecked(askItemsId);
			if (askTeacherChecks != null && askTeacherChecks.size() > 0) {
				buffer.append("\"total\": " + askTeacherChecks.size() + ",");
				buffer.append("\"rows\": [");
				for (int i = 0; i < askTeacherChecks.size(); i++) {
					askTeacherCheck = askTeacherChecks.get(i);
					Teacher teacher = askTeacherCheck.getTeacher();
					buffer.append("{");

					buffer.append("\"show_name\": \"" + teacher.getTeacher_name() + "\",");
					buffer.append("\"submit_time_name\": \"" + askTeacherCheck.getCheck_time() + "\"");

					if (i == askTeacherChecks.size() - 1) {
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
			AskStudentCheck askStudentCheck = null;
			List<AskStudentCheck> askStudentChecks = askStudentCheckDao.findByChecked(askItemsId);
			if (askStudentChecks != null && askStudentChecks.size() > 0) {
				buffer.append("\"total\": " + askStudentChecks.size() + ",");
				buffer.append("\"rows\": [");
				for (int i = 0; i < askStudentChecks.size(); i++) {
					askStudentCheck = askStudentChecks.get(i);
					Student student = askStudentCheck.getStudent();
					buffer.append("{");

					buffer.append("\"show_name\": \"" + student.getParent_name() + "\",");
					buffer.append("\"submit_time_name\": \"" + askStudentCheck.getCheck_time() + "\"");

					if (i == askStudentChecks.size() - 1) {
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

		/*
		 * String[] list = null; String[] clist = null;
		 * if("1".equals(ask_type)){ List<AskTeacherCheck> askTeacherChecks =
		 * askTeacherCheckDao.findByChecked(askItemsId); list = new
		 * String[askTeacherChecks.size()]; clist = new
		 * String[askTeacherChecks.size()]; for(int i
		 * =0;i<askTeacherChecks.size();i++){ AskTeacherCheck askTeacherCheck =
		 * askTeacherChecks.get(i); String check_time =
		 * askTeacherCheck.getCheck_time(); clist[i] = check_time; Teacher
		 * teacher = askTeacherCheck.getTeacher(); String teacher_name =
		 * teacher.getTeacher_name(); list[i] = teacher_name; }
		 * 
		 * }else{ List<AskStudentCheck> askStudentChecks =
		 * askStudentCheckDao.findByChecked(askItemsId); list = new
		 * String[askStudentChecks.size()]; clist = new
		 * String[askStudentChecks.size()]; for(int i
		 * =0;i<askStudentChecks.size();i++){ AskStudentCheck askStudentCheck =
		 * askStudentChecks.get(i); String check_time =
		 * askStudentCheck.getCheck_time(); clist[i] = check_time; Student
		 * student = askStudentCheck.getStudent(); String parent_name =
		 * student.getParent_name(); list[i] = parent_name; }
		 * 
		 * } ServletActionContext.getContext().getValueStack().set("size",
		 * list.length);
		 * ServletActionContext.getContext().getValueStack().set("list", list);
		 * ServletActionContext.getContext().getValueStack().set("clist",
		 * clist);
		 */

	}

	@Override
	public void checkRange(Ask model) throws IOException {

		String id = model.getId();
		Ask ask = askDao.findById(id);
		String ask_type = ask.getAsk_type();
		String push_range = ask.getPush_range();

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
					if (list.contains(id2)) {

						buffer.append("{");
						buffer.append("\"id\": \"" + j + "\",");
						buffer.append("\"name\": \"" + classe.getClass_name() + "\",");
						buffer.append("\"pid\": 0");
						buffer.append("},");

						/*
						 * if (j == classess.size()-1) { buffer.append("}"); }
						 * else { buffer.append("},"); }
						 */

					}
					j++;
				}
				buffer.deleteCharAt(buffer.length() - 1);

				buffer.append("]");
				if (i == grades.size() - 1) {
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
	public Set<AskTeacherCheck> getAskTeacherCheck(Ask ask) {

		String id = ask.getId();
		ask = askDao.findById(id);
		Set<AskTeacherCheck> askTeacherChecks = ask.getAskTeacherChecks();

		return askTeacherChecks;
	}

	@Override
	public void termQuery(Ask model, PageBean pageBean, DetachedCriteria detachedCriteria) {

		detachedCriteria = pageBean.getDetachedCriteria();

		detachedCriteria.setProjection(null);

		String ask_type = model.getAsk_type();
		String create_teacher_name = model.getCreate_teacher_name();
		String title = model.getTitle();
		String start_time = model.getStart_time();
		String end_time = model.getEnd_time();
		// status_name = new String(status_name.getBytes("iso8859-1"), "utf-8");
		// name = new String(name.getBytes("iso8859-1"), "utf-8");

		if (StringUtils.isNotBlank(ask_type)) {
			if (!"0".equals(ask_type)) {
				detachedCriteria.add(Restrictions.eq("ask_type", ask_type));
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
			Long time = end_date_format.getTime() + (long) 86400000;
			end_date_format = new Date(time);
			detachedCriteria.add(Restrictions.between("check_time_name_format", start_date_format, end_date_format));
		} else {

			if (StringUtils.isNotBlank(start_time)) {
				Date start_date_format = TimeUtil.getDate(start_time);
				detachedCriteria.add(Restrictions.ge("check_time_name_format", start_date_format));
			}
			if (StringUtils.isNotBlank(end_time)) {
				Date end_date_format = TimeUtil.getDate(end_time);
				Long time = end_date_format.getTime() + (long) 86400000;
				end_date_format = new Date(time);
				detachedCriteria.add(Restrictions.le("check_time_name_format", end_date_format));
			}
		}

	}

	@Override
	public void t_checkAsk(String askItemsId) {

		AskItems askItems = askItemsDao.findById(askItemsId);
		String ask_id = askItems.getAsk_id();
		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginTeacher");
		String teacher_id = teacher.getId();
		AskTeacherCheck askTeacherCheck = askTeacherCheckDao.findByAskAndTeacher(ask_id, teacher_id);
		if (askTeacherCheck != null) {
			askTeacherCheck.setChecked(askItemsId);
			askTeacherCheck.setCheck_time(TimeUtil.getCurrentTime());
		}
	}

	@Override
	public void p_checkAsk(String askItemsId) {

		AskItems askItems = askItemsDao.findById(askItemsId);
		String ask_id = askItems.getAsk_id();
		Student student = (Student) ServletActionContext.getRequest().getSession().getAttribute("loginParent");
		String student_id = student.getId();
		AskStudentCheck askStudentCheck = askStudentCheckDao.findByAskAndStudent(ask_id, student_id);
		if (askStudentCheck != null) {
			askStudentCheck.setChecked(askItemsId);
			askStudentCheck.setCheck_time(TimeUtil.getCurrentTime());
		}
	}
}
