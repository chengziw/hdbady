package com.hrbhd.bady.web.action;

import java.io.IOException;

import java.util.List;
import java.util.Set;


import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hrbhd.bady.domain.Grade;
import com.hrbhd.bady.domain.Structure;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.service.IGradeService;
import com.hrbhd.bady.service.IStructureService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.TreeBuilder;
import com.hrbhd.bady.web.action.base.BaseAction;

import net.sf.json.JSON;

@Controller
@Scope("prototype")
public class StructureAction extends BaseAction<Structure> {

	@Autowired
	private IStructureService structureService;

	private String add;

	public void setAdd(String add) {
		this.add = add;
	}

	public String findAll() throws IOException {

		List<Structure> list = structureService.findAll();
		String json = new TreeBuilder(list).buildJSONTree();
		JsonUtil.writeJson(json);

		return NONE;
	}

	public String addStructure() throws IOException {

		String json = "";
		String name = model.getName();
		if (StringUtils.isNotBlank(name)) {

			List<Structure> list = structureService.findByName(name);

			if (list.size() > 0) {
				json = "{\"status\": 2, \"info\": \"名称已存在。\"}";
			} else {
				structureService.addStructure(model);
				json = "{\"status\": true, \"info\": \"保存成功\"}";
			}
		} else {
			json = "{\"status\": 2,\"info\": \"请输入名称。\"}";
		}

		/*
		 * structureService.addStructure(model);
		 * 
		 * String json = "{\"status\": true, \"info\": \"保存成功\"}";
		 */
		JsonUtil.writeJson(json);

		return NONE;
	}

	public String editStructure() throws IOException {

		String json = "";
		String name = model.getName();
		if (StringUtils.isNotBlank(name)) {

			String id = model.getId();
			String parent_id = model.getParent_id();
			// Grade grade = gradeService.findById(id);
			// String DBname = grade.getName();
			Structure structure = structureService.findById(id);
			String DBname = structure.getName();

			// List<Grade> list = gradeService.findByName(name);
			List<Structure> list = structureService.findByName(name);
			// 不是原本的名字///////也不是数据库中其他名字//
			if (!name.equals(DBname) && list.size() > 0) {
				json = "{\"status\": 2, \"info\": \"名称已存在。\"}";
			} else {
				structureService.editStructure(model);
				json = "{\"status\": true, \"info\": \"保存成功\"}";
			}
		} else {
			json = "{\"status\": 2, \"info\": \"请输入名称。\"}";
		}

		/*
		 * structureService.editStructure(model);
		 * 
		 * String json = "{\"status\": true, \"info\": \"修改成功\"}";
		 */

		JsonUtil.writeJson(json);

		return NONE;
	}

	public String deleteStructure() throws IOException {
		
		structureService.deleteStructure(model);

		return NONE;
	}

}
