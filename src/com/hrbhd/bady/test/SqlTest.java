package com.hrbhd.bady.test;

import java.io.*;
import java.lang.*;

import com.hrbhd.bady.util.TimeUtil;

public class SqlTest {

	public static void main(String[] args) throws IOException {
		// 数据库导出
		String user = "root"; // 数据库帐号
		String password = "root"; // 登陆密码
		String database = "hdbady"; // 需要备份的数据库名
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
			System.out.println("数据已导出到文件" + pathName + "中");
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}

	// 将数据从磁盘上的文本文件还原到MySql中的数据库
	public static void test() {

		String filepath = "d:\\test.sql"; // 备份的路径地址
		// 新建数据库test
		String stmt1 = "mysqladmin -u root -proot create test";
		String stmt2 = "mysql -u root -proot test < " + filepath;
		String[] cmd = { "cmd", "/c", stmt2 };

		try {
			Runtime.getRuntime().exec(stmt1);
			Runtime.getRuntime().exec(cmd);
			System.out.println("数据已从 " + filepath + " 导入到数据库中");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
