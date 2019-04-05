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
	 * ����JSON���νṹ
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
	 * �������νṹ
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
	 * �ݹ��ӽڵ�
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
	 * ��ȡ���ڵ������е��ӽڵ�
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
	 * �ж��Ƿ�Ϊ���ڵ�
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
	 * ��ȡ���������еĸ��ڵ�
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

		Structure s1 = new Structure("1", "�����׶�԰", "0", "");
		Structure s2 = new Structure("11", "������", "1", ",1,2,");
		Structure s3 = new Structure("111", "�����ӳ�", "11", ",1,2,");
		Structure s4 = new Structure("12", "����", "1", ",1,2,");
		Structure s5 = new Structure("112", "�̵�����", "12", ",1,2,");
		
		structures.add(s1);
		structures.add(s2);
		structures.add(s3);
		structures.add(s4);
		structures.add(s5);
		
		TreeBuilder treeBuilder = new TreeBuilder(structures);

		System.out.println(treeBuilder.buildJSONTree());

	}

}
