package com.hrbhd.bady.test;

import java.lang.reflect.Field;

import com.hrbhd.bady.domain.Student;

public class RflexTest {

	public static void main(String[] args) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException {
		com.hrbhd.bady.domain.Student student = new Student();
		Field field = student.getClass().getDeclaredField("id");
		field.setAccessible(true);
		field.set(student, "24324");
		String id = student.getId();
		System.out.println(student.getId());
		Object object = field.get(student);
		System.out.println(object);
	}
}