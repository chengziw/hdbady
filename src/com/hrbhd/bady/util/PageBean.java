package com.hrbhd.bady.util;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

/**
 * ��װ��ҳ��Ϣ
 * @author zhaoqx
 *
 */
public class PageBean {
	private int currentPage;//��ǰҳ��
	private int pageSize;//ÿҳ��ʾ��¼��
	private DetachedCriteria detachedCriteria;//����������ѯ���󣬰�װ��ѯ����
	private int total;//�ܼ�¼��
	private List rows;//��ǰҳ��Ҫչʾ�����ݼ���
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public DetachedCriteria getDetachedCriteria() {
		return detachedCriteria;
	}
	public void setDetachedCriteria(DetachedCriteria detachedCriteria) {
		this.detachedCriteria = detachedCriteria;
	}
	public List getRows() {
		return rows;
	}
	public void setRows(List rows) {
		this.rows = rows;
	}
	
}
