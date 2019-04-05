package com.hrbhd.bady.test;

import java.io.File;


import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.struts2.ServletActionContext;
import org.hibernate.stat.SecondLevelCacheStatistics;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class Test1 {
	
	public static void main(String[] args) {
		
		Student student = new Student();
		student.setSid("1140131211");
		student.setSname("Áõ×³");
		student.setStelepont("18641677035");
		List<Student> lStudents = new ArrayList<Student>();
		
		Grade grade = new Grade();
		grade.setGid("454557");
		grade.setGname("14»ú");
		grade.setGtelepont("1345788956");
		grade.setStudent(lStudents);
		List<Grade> lGrades = new ArrayList<Grade>();
		
		School school = new School();
		school.setSid("324324");
		school.setSname("¹þ¶û±õXXXXXX");
		school.setStelepont("1343434354232");
		school.setGrade(lGrades);
		
		System.out.println(school);
		//JSONObject object = JSONObject.fromObject(school);
		JSONArray object = JSONArray.fromObject(school);
		System.out.println(object);
	
	}
	
	
		
}

class School{

	private String Sid="45454";
	private String Sname="huerbinhuade";
	private String Stelepont ="bin454444";
	private List<Grade> grade = new ArrayList<Grade>();
	

	public String getSid() {
		return Sid;
	}


	public void setSid(String sid) {
		Sid = sid;
	}


	public String getSname() {
		return Sname;
	}


	public void setSname(String sname) {
		Sname = sname;
	}


	public String getStelepont() {
		return Stelepont;
	}


	@Override
	public String toString() {
		return "School [Sid=" + Sid + ", Sname=" + Sname + ", Stelepont=" + Stelepont + ", grade=" + grade + "]";
	}


	public void setStelepont(String stelepont) {
		Stelepont = stelepont;
	}


	public List<Grade> getGrade() {
		return grade;
	}


	public void setGrade(List<Grade> grade) {
		this.grade = grade;
	}

}
class Grade{
	
	private String Gid="45454";
	private String Gname="huerbinhuade";
	private String Gtelepont ="bin454444";
	private List<Student> student = new ArrayList<Student>();

	public String getGid() {
		return Gid;
	}

	public void setGid(String gid) {
		Gid = gid;
	}

	public String getGname() {
		return Gname;
	}

	public void setGname(String gname) {
		Gname = gname;
	}

	public String getGtelepont() {
		return Gtelepont;
	}

	public void setGtelepont(String gtelepont) {
		Gtelepont = gtelepont;
	}

	public List<Student> getStudent() {
		return student;
	}

	public void setStudent(List<Student> student) {
		this.student = student;
	}

	@Override
	public String toString() {
		return "Grade [Gid=" + Gid + ", Gname=" + Gname + ", Gtelepont=" + Gtelepont + ", student=" + student + "]";
	}

	
}


class Student{
	private String Sid="45454";
	private String Sname="huerbinhuade";
	private String Stelepont ="bin454444";
	public String getSid() {
		return Sid;
	}
	public void setSid(String sid) {
		Sid = sid;
	}
	public String getSname() {
		return Sname;
	}
	public void setSname(String sname) {
		Sname = sname;
	}
	public String getStelepont() {
		return Stelepont;
	}
	public void setStelepont(String stelepont) {
		Stelepont = stelepont;
	}
	@Override
	public String toString() {
		return "Student [Sid=" + Sid + ", Sname=" + Sname + ", Stelepont=" + Stelepont + "]";
	}
	
}

