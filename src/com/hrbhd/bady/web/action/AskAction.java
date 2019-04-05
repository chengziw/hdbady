package com.hrbhd.bady.web.action;

import java.awt.image.BufferedImageFilter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.apache.struts2.ServletActionContext;
import org.aspectj.apache.bcel.generic.ReturnaddressType;
import org.hibernate.cfg.annotations.IdBagBinder;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.domain.Ask;
import com.hrbhd.bady.domain.AskItems;
import com.hrbhd.bady.domain.AskStudentCheck;
import com.hrbhd.bady.domain.AskTeacherCheck;
import com.hrbhd.bady.domain.Classes;
import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.NoticeStudentCheck;
import com.hrbhd.bady.domain.NoticeTeacherCheck;
import com.hrbhd.bady.domain.Structure;
import com.hrbhd.bady.domain.Student;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.service.IAskItemsService;
import com.hrbhd.bady.service.IAskService;
import com.hrbhd.bady.service.IAskStudentCheckService;
import com.hrbhd.bady.service.IAskTeacherCheckService;
import com.hrbhd.bady.service.IClassesService;
import com.hrbhd.bady.service.IGradeService;
import com.hrbhd.bady.service.IStructureService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.TimeUtil;
import com.hrbhd.bady.util.TreeBuilder;
import com.hrbhd.bady.web.action.base.BaseAction;
import com.mysql.jdbc.StreamingNotifiable;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

@Controller
@Scope("prototype")
public class AskAction extends BaseAction<Ask> {

	@Autowired
	private IAskService askService;
	@Autowired
	private IGradeService gradeService;
	@Autowired
	private IClassesService classesService;
	@Autowired
	private IStructureService structureService;
	@Autowired
	private IAskItemsService askItemsService;
	@Autowired
	private IAskTeacherCheckService askTeacherCheckService;
	@Autowired
	private IAskStudentCheckService askStudentCheckService;

	private String page;
	private String rows;
	private String[] push_ranges;

	private String[] ask_answer_input;

	private String askItemsId;
	private String flag;

	public void setPage(String page) {
		this.page = page;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	public void setPush_ranges(String[] push_ranges) {
		this.push_ranges = push_ranges;
	}

	public void setAsk_answer_input(String[] ask_answer_input) {
		this.ask_answer_input = ask_answer_input;
	}

	public void setAskItemsId(String askItemsId) {
		this.askItemsId = askItemsId;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String pageQuery() throws IOException {

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));

		if ("1".equals(flag)) {
			askService.termQuery(model, pageBean, detachedCriteria);
		}

		askService.pageQuery(pageBean);

		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[] { "students", "teachers", "askItems", "askTeacherChecks", "askStudentChecks",
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

		askService.about(model);

		return "about";
	}

	public String aboutAbout() throws IOException {

		// askService.aboutAbout(model,askItemsId);
		String id = model.getId();
		ServletActionContext.getContext().getValueStack().set("id", id);
		ServletActionContext.getContext().getValueStack().set("askItemsId", askItemsId);

		return "aboutAbout";
	}

	public String aboutAboutAsk() throws IOException {

		askService.aboutAboutAsk(model, askItemsId);

		return NONE;
	}

	public String delete() {

		String id = model.getId();
		Ask ask = askService.findById(id);
		ServletActionContext.getContext().getValueStack().set("ask", ask);

		return "delete";
	}

	public String edit() {

		askService.edit(model);

		return "edit";
	}

	public String putOut() {

		String id = model.getId();
		Ask ask = askService.findById(id);
		ServletActionContext.getContext().getValueStack().set("ask", ask);

		return "putOut";
	}

	public String addAsk() throws IOException {

		askService.addNotice(model, push_ranges, ask_answer_input);

		return NONE;
	}

	public String deleteAsk() throws IOException {

		String id = model.getId();
		Ask ask = askService.findById(id);
		askService.delete(ask);
		String json = "{\"status\": 1, \"info\": \"删除成功！\"}";
		JsonUtil.writeJson(json);

		return NONE;
	}

	public String editAsk() throws IOException {

		askService.editAsk(model, ask_answer_input);

		return NONE;
	}

	public String putOutAsk() throws IOException {

		askService.putOutAsk(model);

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

	public String findNoCheck() throws IOException {

		askService.findNoCheck(model);

		return NONE;
	}

	public String findCheck() throws IOException {

		askService.findCheck(model);

		return NONE;
	}

	public String checkRange() throws IOException {

		askService.checkRange(model);

		return NONE;
	}

	/**
	 * 手机端操作
	 * 
	 * @param id,
	 *            askItemsId
	 * @return
	 */
	public String t_checkAsk() {

		// TODO
		// 二狗
		askService.t_checkAsk(askItemsId);

		return "t_ask";
	}

	public String p_checkAsk() {

		// TODO
		// 二狗
		askService.p_checkAsk(askItemsId);

		return "p_ask";
	}

	public String t_ask() {

		if ("1".equals(flag)) {
			ServletActionContext.getContext().getValueStack().set("flag", "1");
		}

		return "t_ask";
	}

	public String t_pageQuery() throws IOException {

		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("loginTeacher");
		String id = teacher.getId();

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));
		detachedCriteria = pageBean.getDetachedCriteria();
		detachedCriteria.createAlias("askTeacherChecks", "at");
		detachedCriteria.add(Restrictions.eq("at.teacher_id", id));
		if ("1".equals(flag)) {
			detachedCriteria.add(Restrictions.isNull("at.checked"));
		}

		detachedCriteria.add(Restrictions.isNotNull("is_check"));

		askService.pageQuery(pageBean);
		List<Ask> list = pageBean.getRows();

		// List<Ask> list = askService.findAll();

		Set<Ask> asks = teacher.getAsks();
		Ask ask = null;
		Set<AskItems> askItems = null;
		List<AskItems> askItems2 = null;
		AskItems askItem = null;
		AskStudentCheck askStudentCheck = null;
		AskTeacherCheck askTeacherCheck = null;
		StringBuffer buffer = new StringBuffer();
		buffer.append("{\"askList\":[");
		for (int i = 0; i < list.size(); i++) {
			ask = list.get(i);
			String aid = ask.getId();
			String ask_type = ask.getAsk_type();
			Set<AskTeacherCheck> tmonther = askService.getAskTeacherCheck(ask);

			askItems = askService.getAskItems(ask);
			// askItems = ask.getAskItems();
			if (askItems != null && askItems.size() > 0) {
				askItems2 = new ArrayList<>(askItems);
			}
			buffer.append("{");
			buffer.append("\"answerItems\": [");

			for (int j = 0; j < askItems2.size(); j++) {

				askItem = askItems2.get(j);
				String askItemId = askItem.getId();
				String title = askItem.getTitle();
				List<AskTeacherCheck> askTeacherChecks = askTeacherCheckService.findByChecked(askItemId);
				String voterNumber = askTeacherChecks.size() + "";
				String voterTurnout = (float) askTeacherChecks.size() / (float) tmonther.size() + "";

				buffer.append("{");

				buffer.append("\"answerId\": \"" + askItemId + "\",");
				buffer.append("\"title\": \"" + title + "\",");
				buffer.append("\"voterNumber\": \"" + voterNumber + "\",");
				buffer.append("\"voterTurnout\": \"" + voterTurnout + "\"");

				if (j == askItems2.size() - 1) {
					buffer.append("}");
				} else {
					buffer.append("},");
				}
			}

			buffer.append("],");

			buffer.append("\"askId\": \"" + ask.getId() + "\",");
			buffer.append("\"createTime\": \"" + ask.getCreate_time_name() + "\",");
			buffer.append("\"isAnonymous\": \"" + ask.getIs_anonymous() + "\",");
			buffer.append("\"isShowResults\": \"" + ask.getIs_showresult() + "\",");
			buffer.append("\"isSinglesubmit\": \"" + ask.getIs_singlesubmit() + "\",");
			buffer.append("\"isSubmited\": \"True\",");
			buffer.append("\"submitendDate\": \"" + TimeUtil.getTimeStamp(ask.getEnd_time()) + "\",");

			if ("1".equals(ask_type)) {
				List<AskTeacherCheck> tList = askTeacherCheckService.findChecked(aid);
				if (tList != null && tList.size() > 0) {
					buffer.append("\"submitNums\": \"" + tList.size() + "\",");
				} else {
					buffer.append("\"submitNums\": \"0\",");
				}
			} else {
				List<AskStudentCheck> sList = askStudentCheckService.findChecked(aid);
				if (sList != null && sList.size() > 0) {
					buffer.append("\"submitNums\": \"" + sList.size() + "\",");
				} else {
					buffer.append("\"submitNums\": \"0\",");
				}
			}

			buffer.append("\"submitStartDate\": \"" + ask.getCheck_time_name() + "\",");
			buffer.append("\"title\": \"" + ask.getTitle() + "\"");

			if (i == list.size() - 1) {
				buffer.append("}");
			} else {
				buffer.append("},");
			}
		}
		buffer.append("],");
		buffer.append("\"hasMore\": \"False\",");
		buffer.append("\"nextPageNum\": 0,");
		buffer.append("\"ok\": \"True\",");
		buffer.append("\"serverTime\": \"" + TimeUtil.getCurrentTime() + "\"");
		buffer.append("}");

		String json = buffer.toString();
		JsonUtil.writeJson(json);
		return NONE;
	}

	public String p_ask() {

		if ("1".equals(flag)) {
			ServletActionContext.getContext().getValueStack().set("flag", "1");
		}

		return "p_ask";
	}

	public String p_pageQuery() throws IOException {

		// List<Ask> list = askService.findAll();
		Student student = (Student) ServletActionContext.getRequest().getSession().getAttribute("loginParent");
		String id = student.getId();

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));
		detachedCriteria = pageBean.getDetachedCriteria();
		detachedCriteria.createAlias("askStudentChecks", "as");
		detachedCriteria.add(Restrictions.eq("as.student_id", id));
		if ("1".equals(flag)) {
			detachedCriteria.add(Restrictions.isNull("as.checked"));
		}

		detachedCriteria.add(Restrictions.isNotNull("is_check"));

		askService.pageQuery(pageBean);
		List<Ask> list = pageBean.getRows();

		Ask ask = null;
		Set<AskItems> askItems = null;
		List<AskItems> askItems2 = null;
		AskItems askItem = null;
		AskStudentCheck studentCheck = null;
		AskTeacherCheck askTeacherCheck = null;
		StringBuffer buffer = new StringBuffer();
		buffer.append("{\"askList\":[");
		for (int i = 0; i < list.size(); i++) {
			ask = list.get(i);
			String aid = ask.getId();
			String ask_type = ask.getAsk_type();
			Set<AskTeacherCheck> tmonther = askService.getAskTeacherCheck(ask);

			askItems = askService.getAskItems(ask);

			// askItems = ask.getAskItems();
			if (askItems != null && askItems.size() > 0) {
				askItems2 = new ArrayList<>(askItems);
			}
			buffer.append("{");
			buffer.append("\"answerItems\": [");

			for (int j = 0; j < askItems2.size(); j++) {
				askItem = askItems2.get(j);

				String askItemId = askItem.getId();
				String title = askItem.getTitle();
				List<AskTeacherCheck> askTeacherChecks = askTeacherCheckService.findByChecked(askItemId);
				String voterNumber = askTeacherChecks.size() + "";
				String voterTurnout = (float) askTeacherChecks.size() / (float) tmonther.size() + "";

				buffer.append("{");

				buffer.append("\"answerId\": \"" + askItemId + "\",");
				buffer.append("\"title\": \"" + title + "\",");
				buffer.append("\"voterNumber\": \"" + voterNumber + "\",");
				buffer.append("\"voterTurnout\": \"" + voterTurnout + "\"");

				if (j == askItems2.size() - 1) {
					buffer.append("}");
				} else {
					buffer.append("},");
				}
			}

			buffer.append("],");

			buffer.append("\"askId\": \"" + ask.getId() + "\",");
			buffer.append("\"createTime\": \"" + ask.getCreate_time_name() + "\",");
			buffer.append("\"isAnonymous\": " + ask.getIs_anonymous() + ",");
			buffer.append("\"isShowResults\": " + ask.getIs_showresult() + ",");
			buffer.append("\"isSinglesubmit\": \"" + ask.getIs_singlesubmit() + "\",");
			buffer.append("\"isSubmited\": \"True\",");
			buffer.append("\"submitendDate\": \"" + TimeUtil.getTimeStamp(ask.getEnd_time()) + "\",");

			if ("1".equals(ask_type)) {
				List<AskTeacherCheck> tList = askTeacherCheckService.findChecked(aid);
				if (tList != null && tList.size() > 0) {
					buffer.append("\"submitNums\": \"" + tList.size() + "\",");
				} else {
					buffer.append("\"submitNums\": \"0\",");
				}
			} else {
				List<AskStudentCheck> sList = askStudentCheckService.findChecked(aid);
				if (sList != null && sList.size() > 0) {
					buffer.append("\"submitNums\": \"" + sList.size() + "\",");
				} else {
					buffer.append("\"submitNums\": \"0\",");
				}
			}

			buffer.append("\"submitStartDate\": \"" + ask.getCheck_time_name() + "\",");
			buffer.append("\"title\": \"" + ask.getTitle() + "\"");

			if (i == list.size() - 1) {
				buffer.append("}");
			} else {
				buffer.append("},");
			}
		}
		buffer.append("],");
		buffer.append("\"hasMore\": \"False\",");
		buffer.append("\"nextPageNum\": 0,");
		buffer.append("\"ok\": \"True\",");
		buffer.append("\"serverTime\": \"" + TimeUtil.getCurrentTime() + "\"");
		buffer.append("}");

		String json = buffer.toString();
		JsonUtil.writeJson(json);
		return NONE;
	}

}
