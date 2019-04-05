package com.hrbhd.bady.util;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.criterion.DetachedCriteria;
import com.hrbhd.bady.domain.StructureAdapter;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

public class TreeBuilder2 {

	List<StructureAdapter> structureAdapter = new ArrayList<StructureAdapter>();

	public TreeBuilder2(List<StructureAdapter> structureAdapter) {

		super();
		
		this.structureAdapter = structureAdapter;
		
	}

	/**
	 * 
	 * ����JSON���νṹ
	 * 
	 * @return
	 * 
	 */

	public String buildJSONTree() {

		List<StructureAdapter> StructureTree = buildTree();

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

	public List<StructureAdapter> buildTree() {

		List<StructureAdapter> treeStructures = new ArrayList<StructureAdapter>();

		List<StructureAdapter> rootStructures = getRootStructures();

		for (StructureAdapter rootStructure : rootStructures) {

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

	public void buildChildStructures(StructureAdapter structure2) {

		List<StructureAdapter> children = getChildStructures(structure2);

		if (!children.isEmpty()) {

			for (StructureAdapter child : children) {

				buildChildStructures(child);

			}

			structure2.setChildren(children);

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

	public List<StructureAdapter> getChildStructures(StructureAdapter pStructure) {

		List<StructureAdapter> childStructures = new ArrayList<StructureAdapter>();

		for (StructureAdapter n : structureAdapter) {

			if (pStructure.getId().equals(n.getPid())) {

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

	public boolean rootStructure(StructureAdapter structure2) {

		boolean isRootStructure = true;

		for (StructureAdapter n : structureAdapter) {

			if (structure2.getPid().equals(n.getId())) {

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

	public List<StructureAdapter> getRootStructures() {

		List<StructureAdapter> rootStructures = new ArrayList<StructureAdapter>();

		for (StructureAdapter n : structureAdapter) {

			if (rootStructure(n)) {

				rootStructures.add(n);

			}

		}

		return rootStructures;

	}

	public static void main(String[] args) {

		List<StructureAdapter> structureAdapters = new ArrayList<StructureAdapter>();
		
		StructureAdapter s1 = new StructureAdapter("1", "huade", "0");
		StructureAdapter s2 = new StructureAdapter("2", "huade", "1");
		StructureAdapter s3 = new StructureAdapter("3", "huade", "1");
		StructureAdapter s4 = new StructureAdapter("4", "huade", "3");
		
		structureAdapters.add(s1);
		structureAdapters.add(s2);
		structureAdapters.add(s3);
		structureAdapters.add(s4);
		
		TreeBuilder2 treeBuilder = new TreeBuilder2(structureAdapters);

		System.out.println(treeBuilder.buildJSONTree());

	}

}
