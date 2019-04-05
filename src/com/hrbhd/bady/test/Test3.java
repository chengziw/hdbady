package com.hrbhd.bady.test;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

public class Test3 {

	public static void main(String[] args) {

		Student1 student = new Student1();
		student.setName("Áõ×³");
		student.setAge("20");
		
		Classes classes = new Classes();
		classes.setNum("140131211");
		classes.setStudent(student);

		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[]{"classes"});
		
		List<Classes> list = new ArrayList<Classes>();
		list.add(classes);
		 
		JSONArray array = JSONArray.fromObject(list);
		// System.out.println(array.toString());

	}

}


class Student1 {

	private String name;
	private String age;

	public Student1() {
		// TODO Auto-generated constructor stub
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}


}

class Classes {

	private String num;
	private Student1 student;

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public void setStudent(Student1 student) {
		this.student = student;
	}
	
	public Student1 getStudent() {
		return student;
	}

}
