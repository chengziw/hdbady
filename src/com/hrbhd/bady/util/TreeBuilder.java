package com.hrbhd.bady.util;

import java.util.ArrayList;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.hrbhd.bady.domain.Structure;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.*;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

public class TreeBuilder {

	List<Structure> Structures = new ArrayList<Structure>();

	public TreeBuilder(List<Structure> Structures) {

		super();
		
		this.Structures = Structures;
		
	}

	/**
	 * 
	 * 构建JSON树形结构
	 * 
	 * @return
	 * 
	 */

	public String buildJSONTree() {

		List<Structure> StructureTree = buildTree();

		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[]{"teachers"});
		JSONArray jsonArray = JSONArray.fromObject(StructureTree,config);

		return jsonArray.toString();

	}

	/**
	 * 
	 * 构建树形结构
	 * 
	 * @return
	 * 
	 */

	public List<Structure> buildTree() {

		List<Structure> treeStructures = new ArrayList<Structure>();

		List<Structure> rootStructures = getRootStructures();

		for (Structure rootStructure : rootStructures) {

			buildChildStructures(rootStructure);

			treeStructures.add(rootStructure);

		}

		return treeStructures;

	}

	/**
	 * 
	 * 递归子节点
	 * 
	 * @param Structure
	 * 
	 */

	public void buildChildStructures(Structure Structure) {

		List<Structure> children = getChildStructures(Structure);

		if (!children.isEmpty()) {

			for (Structure child : children) {

				buildChildStructures(child);

			}

			Structure.setChildren(children);

		}

	}

	/**
	 * 
	 * 获取父节点下所有的子节点
	 * 
	 * @param Structures
	 * 
	 * @param pStructure
	 * 
	 * @return
	 * 
	 */

	public List<Structure> getChildStructures(Structure pStructure) {

		List<Structure> childStructures = new ArrayList<Structure>();

		for (Structure n : Structures) {

			if (pStructure.getId().equals(n.getParent_id())) {

				childStructures.add(n);

			}

		}

		return childStructures;

	}

	/**
	 * 
	 * 判断是否为根节点
	 * 
	 * @param Structures
	 * 
	 * @param inStructure
	 * 
	 * @return
	 * 
	 */

	public boolean rootStructure(Structure Structure) {

		boolean isRootStructure = true;

		for (Structure n : Structures) {

			if (Structure.getParent_id().equals(n.getId())) {

				isRootStructure = false;

				break;

			}

		}

		return isRootStructure;

	}

	/**
	 * 
	 * 获取集合中所有的根节点
	 * 
	 * @param Structures
	 * 
	 * @return
	 * 
	 */

	public List<Structure> getRootStructures() {

		List<Structure> rootStructures = new ArrayList<Structure>();

		for (Structure n : Structures) {

			if (rootStructure(n)) {

				rootStructures.add(n);

			}

		}

		return rootStructures;

	}

	public static void main(String[] args) {

		List<Structure> structures = new ArrayList<Structure>();

		Structure s1 = new Structure("1", "华德幼儿园", "0", "");
		Structure s2 = new Structure("11", "保安队", "1", ",1,2,");
		Structure s3 = new Structure("111", "保安队长", "11", ",1,2,");
		Structure s4 = new Structure("12", "教务处", "1", ",1,2,");
		Structure s5 = new Structure("112", "教导主任", "12", ",1,2,");
		
		structures.add(s1);
		structures.add(s2);
		structures.add(s3);
		structures.add(s4);
		structures.add(s5);
		
		TreeBuilder treeBuilder = new TreeBuilder(structures);

		System.out.println(treeBuilder.buildJSONTree());

	}

}
