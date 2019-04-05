package com.hrbhd.bady.test;

import java.io.*;
import java.lang.*;

import com.hrbhd.bady.util.TimeUtil;

public class SqlTest {

	public static void main(String[] args) throws IOException {
		// ���ݿ⵼��
		String user = "root"; // ���ݿ��ʺ�
		String password = "root"; // ��½����
		String database = "hdbady"; // ��Ҫ���ݵ����ݿ���
		String currentDay = TimeUtil.getCurrentDay();
		String fileName = currentDay + ".sql";
		String filePath = "d:\\DataBaseCopy";
		String pathName = filePath + "\\" + fileName;
		File file = new File(filePath);
		if (!file.exists()) {
			file.mkdir();
		}
		String stmt = "mysqldump " + database + " -u " + user + " -p" + password + " --result-file=" + pathName;
		/*
		 * String mysql="mysqldump test -u root -proot
		 * --result-file=d:\\test.sql";
		 */
		try {
			Runtime.getRuntime().exec(stmt);
			System.out.println("�����ѵ������ļ�" + pathName + "��");
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}

	// �����ݴӴ����ϵ��ı��ļ���ԭ��MySql�е����ݿ�
	public static void test() {

		String filepath = "d:\\test.sql"; // ���ݵ�·����ַ
		// �½����ݿ�test
		String stmt1 = "mysqladmin -u root -proot create test";
		String stmt2 = "mysql -u root -proot test < " + filepath;
		String[] cmd = { "cmd", "/c", stmt2 };

		try {
			Runtime.getRuntime().exec(stmt1);
			Runtime.getRuntime().exec(cmd);
			System.out.println("�����Ѵ� " + filepath + " ���뵽���ݿ���");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
