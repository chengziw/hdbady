package com.hrbhd.bady.web.action;

import com.hrbhd.bady.domain.School;
import com.hrbhd.bady.exception.DeletePictureException;
import com.hrbhd.bady.service.ISchoolService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.web.action.base.BaseAction;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@Scope("prototype")
public class SchoolAction extends BaseAction<School> {

	@Autowired
	private ISchoolService schoolService;

	private String page;
	private String rows;
	private File[] img_file;
	private String index;
	private String type;

	public void setPage(String page) {
		this.page = page;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	public void setImg_file(File[] img_file) {
		this.img_file = img_file;
	}

	public void setIndex(String index) {
		this.index = index;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String pageQuery() throws IOException {

		pageBean.setCurrentPage(Integer.parseInt(page));
		pageBean.setPageSize(Integer.parseInt(rows));

		schoolService.pageQuery(pageBean);

		JsonConfig config = new JsonConfig();

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
		School school = schoolService.findById(id);
		ServletActionContext.getContext().getValueStack().set("school", school);

		return "edit";
	}

	public String addSchool() {

		schoolService.save(model);
		return NONE;
	}

	public String editSchool() throws IOException {

	    System.out.println(model.toString());
		schoolService.editSchool(model);

		return NONE;
	}

	public String deletePicture() throws DeletePictureException, IOException {

		List<School> list = schoolService.findAll();
		if (list != null && list.size() > 0) {
			School school = list.get(0);
			schoolService.deletePicture(school, index);
		}

		return NONE;
	}

	public String importPicture() throws IOException {

		schoolService.importPicture(img_file, type);

		return NONE;
	}

	public String p_about() {
		
		List<School> list = schoolService.findAll();
		School school = null;
		if(list!=null&&list.size()>0){
			school = list.get(0);
		}
		ServletActionContext.getContext().getValueStack().set("school", school);

		return "p_about";
	}

	public String p_aboutSchool() throws IOException {

		List<School> list = schoolService.findAll();
		if (list != null && list.size() > 0) {
			StringBuffer buffer = new StringBuffer();
			School school = list.get(0);
			ServletActionContext.getContext().getValueStack().set("school", school);

			buffer.append("{");
			
			//π∑∏Á√ª–¥
			/*buffer.append("\"xiaoyuanhuanjing\":[");
			int flag1 = 0;
			for (int i = 7; i <= 12; i++) {
				String imagerUrl = school.getImagerUrl(i + "");
				if (StringUtils.isNotBlank(imagerUrl)) {
					buffer.append("{");
					buffer.append("\"img\":\"" + imagerUrl + "\",");
					buffer.append("\"imgmiaoshu\":\"\"");
					buffer.append("},");
					flag1 = 1;
				}
			}
			if(flag1==1){
				buffer.deleteCharAt(buffer.length()-1);
			}
			buffer.append("],");*/
			
			buffer.append("\"xiaoyuanhuanjing\":[");
			int flag2 = 0;
			for (int i = 7; i <= 12; i++) {
				String imagerUrl = school.getImagerUrl(i + "");
				if (StringUtils.isNotBlank(imagerUrl)) {
					buffer.append("{");
					buffer.append("\"img\":\"" + imagerUrl + "\",");
					buffer.append("\"imgmiaoshu\":\"\"");
					buffer.append("},");
					flag2 = 1;
				}
			}
			if(flag2==1){
				buffer.deleteCharAt(buffer.length()-1);
			}
			buffer.append("],");

			buffer.append("\"baobeizuopin\":[");
			int flag3 = 0;
			for (int i = 13; i <= 18; i++) {
				String imagerUrl = school.getImagerUrl(i + "");
				if (StringUtils.isNotBlank(imagerUrl)) {
					buffer.append("{");
					buffer.append("\"img\":\"" + imagerUrl + "\",");
					buffer.append("\"imgmiaoshu\":\"\"");
					buffer.append("},");
					flag3 = 1;
				}
			}
			if(flag3==1){
				buffer.deleteCharAt(buffer.length()-1);
			}
			buffer.append("]");
			buffer.append("}");

			String json = buffer.toString();
			JsonUtil.writeJson(json);
		}
		
		return NONE;
	}
}
