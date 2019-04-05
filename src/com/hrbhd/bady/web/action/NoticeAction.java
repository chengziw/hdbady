package com.hrbhd.bady.web.action;

import java.io.IOException;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;

import org.apache.struts2.ServletActionContext;
import org.apache.xmlbeans.impl.xb.xsdschema.impl.PublicImpl;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.domain.Ask;
import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.CookBook;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.Notice;
import com.hrbhd.bady.domain.NoticeStudentCheck;
import com.hrbhd.bady.domain.NoticeTeacherCheck;
import com.hrbhd.bady.domain.Structure;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.service.IClassesService;
import com.hrbhd.bady.service.IGradeService;
import com.hrbhd.bady.service.INoticeService;
import com.hrbhd.bady.service.INoticeStudentCheckService;
import com.hrbhd.bady.service.INoticeTeacherCheckService;
import com.hrbhd.bady.service.IStructureService;
import com.hrbhd.bady.service.IStudentService;
import com.hrbhd.bady.service.ITeacherService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.TimeUtil;
import com.hrbhd.bady.util.TreeBuilder;
import com.hrbhd.bady.web.action.base.BaseAction;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

@Controller
@Scope("prototype")
public class NoticeAction extends BaseAction<Notice> {

	@Autowired
	private INoticeService noticeService;
	@Autowired
	private IStructureService structureService;
	@Autowired
	private IClassesService classesService;
	@Autowired
	private IGradeService gradeService;
	@Autowired
	private INoticeStudentCheckService noticeStudentCheckService;
	@Autowired
	private INoticeTeacherCheckService noticeTeacherCheckService;

	private String page;
	private String rows;
	private String[] push_ranges;

	private String start_time;
	private String end_time;

	private String flag;
	private String isWho;

	public void setPage(String page) {
		this.page = page;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	public void setPush_ranges(String[] push_ranges) {
		this.push_ranges = push_ranges;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public void setIsWho(String isWho) {
		this.isWho = isWho;
	}

	public String pageQuery() throws IOException {

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));

		if ("1".equals(flag)) {
			noticeService.termQuery(model, pageBean, detachedCriteria, start_time, end_time);
		}

		noticeService.pageQuery(pageBean);

		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[] { "students", "teachers", "noticeTeacherChecks", "noticeStudentChecks",
				"check_time_name_format" });
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
		Notice notice = noticeService.findById(id);
		ServletActionContext.getContext().getValueStack().set("notice", notice);

		return "about";
	}

	public String delete() {

		String id = model.getId();
		Notice notice = noticeService.findById(id);
		ServletActionContext.getContext().getValueStack().set("notice", notice);

		return "delete";
	}

	public String edit() {

		String id = model.getId();
		Notice notice = noticeService.findById(id);
		ServletActionContext.getContext().getValueStack().set("notice", notice);

		return "edit";
	}

	public String putOut() {

		String id = model.getId();
		Notice notice = noticeService.findById(id);
		ServletActionContext.getContext().getValueStack().set("notice", notice);

		return "putOut";
	}

	// 部门:查找提交过来的id不是pid的所有行,这些都是父节点,不用发送消息,去掉这些之后再找到部门名称,找到该部门下的所有教职工,建立多对多关联.
	// 班级:班级比较简单,只需要查找对应的班级就行,如果没找到,那就没找到,建立多对多关联.
	public String addNotice() throws IOException {

		noticeService.addNotice(model, push_ranges);

		return NONE;
	}

	public String deleteNotice() throws IOException {

		String id = model.getId();
		Notice notice = noticeService.findById(id);
		noticeService.delete(notice);
		String json = "{\"status\": 1, \"info\": \"删除成功！\"}";
		JsonUtil.writeJson(json);

		return NONE;
	}

	public String putOutNotice() throws IOException {

		noticeService.putOutNotice(model);

		return NONE;
	}

	public String findGradeAndClass() throws IOException {

		String id = model.getId();
		if ("1".equals(id)) {

			String json = "{\"status\": 1,\"info\":";

			List<Structure> list = structureService.findAll();
			json += new TreeBuilder(list).buildJSONTree();

			json += "}";

			JsonUtil.writeJson(json);
			return NONE;

		}

		StringBuffer buffer = new StringBuffer();
		buffer.append("{\"status\": 1,\"info\": [{\"id\": 0,\"name\": \"全校学生家长\",\"pid\": 0,\"children\": [");
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
				buffer.append("\"pid\": \"" + gpid + "\",");
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
						buffer.append("\"pid\": \"" + cpid + "\" ");

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

			buffer.append("]}]}");
		}
		JsonUtil.writeJson(buffer.toString());
		return NONE;
	}

	public String findStructure() throws IOException {

		String json = "{\"status\": 1,\"info\":";

		List<Structure> list = structureService.findAll();
		json += new TreeBuilder(list).buildJSONTree();

		json += "}";

		JsonUtil.writeJson(json);

		return NONE;
	}

	public String editNotice() throws IOException {

		noticeService.editNotice(model);

		return NONE;
	}

	public String findNoCheck() throws IOException {

		noticeService.findNoCheck(model);

		return NONE;
	}

	public String findCheck() throws IOException {

		noticeService.findCheck(model);

		return NONE;
	}

	public String checkRange() throws IOException {

		noticeService.checkRange(model);

		return NONE;
	}

	/**
	 * 手机端操作
	 */
	public String t_notice() {

		if ("1".equals(flag)) {
			ServletActionContext.getContext().getValueStack().set("flag", "1");
		}

		return "t_notice";
	}

	public String t_pageQuery() throws IOException {

		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginTeacher");
		String id = teacher.getId();

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));
		detachedCriteria = pageBean.getDetachedCriteria();
		detachedCriteria.createAlias("noticeTeacherChecks", "nt");
		detachedCriteria.add(Restrictions.eq("nt.teacher_id", id));
		if ("1".equals(flag)) {
			detachedCriteria.add(Restrictions.isNull("nt.checked"));
		}
		detachedCriteria.add(Restrictions.isNotNull("is_check"));

		noticeService.pageQuery(pageBean);
		List<Notice> list = pageBean.getRows();

		Notice notice = null;
		StringBuffer buffer = new StringBuffer();
		buffer.append("{\"hasMore\": \"True\",\"nextPageNum\": \"0\",\"noticeList\": [");
		for (int i = 0; i < list.size(); i++) {
			notice = list.get(i);
			buffer.append("{");

			buffer.append("\"content\": \"" + notice.getDescs() + "\",");
			buffer.append("\"createTime\": \"" + notice.getCreate_time_name() + "\",");
			// 待修改
			buffer.append("\"isReaded\": \"True\",");
			buffer.append("\"noticeId\": \"" + notice.getId() + "\",");
			buffer.append("\"title\": \"" + notice.getTitle() + "\"");

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
		System.out.println(json);
		JsonUtil.writeJson(json);

		return NONE;
	}


	public String p_notice() {

		if ("1".equals(flag)) {
			ServletActionContext.getContext().getValueStack().set("flag", "1");
		}

		return "p_notice";
	}

	public String p_pageQuery() throws IOException {

		Student student = (Student) ServletActionContext.getRequest().getSession().getAttribute("loginParent");
		String id = student.getId();

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));
		detachedCriteria = pageBean.getDetachedCriteria();
		detachedCriteria.createAlias("noticeStudentChecks", "ns");
		detachedCriteria.add(Restrictions.eq("ns.student_id", id));
		if ("1".equals(flag)) {
			detachedCriteria.add(Restrictions.isNull("ns.checked"));
		}

		detachedCriteria.add(Restrictions.isNotNull("is_check"));

		noticeService.pageQuery(pageBean);
		List<Notice> list = pageBean.getRows();

		// List<Notice> list = noticeService.findAll();

		Notice notice = null;

		StringBuffer buffer = new StringBuffer();
		buffer.append("{\"hasMore\": \"False\",\"nextPageNum\": \"0\",\"noticeList\": [");
		for (int i = 0; i < list.size(); i++) {
			notice = list.get(i);
			buffer.append("{");

			buffer.append("\"content\": \"" + notice.getDescs() + "\",");
			buffer.append("\"createTime\": \"" + notice.getCreate_time_name() + "\",");
			// 待修改
			buffer.append("\"isReaded\": \"True\",");
			buffer.append("\"noticeId\": \"" + notice.getId() + "\",");
			buffer.append("\"title\": \"" + notice.getTitle() + "\"");

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
		System.out.println(json);
		JsonUtil.writeJson(json);

		return NONE;
	}

	/**
	 * 教师查看通知公告
	 * 
	 * @return
	 */
	public String t_read() {

		noticeService.t_read(model);

		return NONE;
	}
	
	/**
	 * 家长查看通知公告
	 * 
	 * @return
	 */
	public String p_read() {

		noticeService.p_read(model);

		return NONE;
	}

}
