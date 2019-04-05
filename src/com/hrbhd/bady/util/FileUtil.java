package com.hrbhd.bady.util;

import java.io.IOException;
import java.net.URLEncoder;

import Decoder.BASE64Encoder;


public class FileUtil {
	/**
	 * �����ļ�ʱ����Բ�ͬ����������и������ı���
	 * 
	 * @param filename
	 *            �����ļ���
	 * @param agent
	 *            �ͻ��������
	 * @return ���������ظ�����
	 * @throws IOException
	 */
	public static String encodeDownloadFilename(String filename, String agent)
			throws IOException {
		if (agent.contains("Firefox")) { // ��������
			filename = "=?UTF-8?B?"
					+ new BASE64Encoder().encode(filename.getBytes("utf-8"))
					+ "?=";
			filename = filename.replaceAll("\r\n", "");
		} else { // IE�����������
			filename = URLEncoder.encode(filename, "utf-8");
			filename = filename.replace("+"," ");
		}
		return filename;
	}
}
