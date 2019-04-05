package com.hrbhd.bady.service;

import java.io.IOException;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.hrbhd.bady.domain.Notice;
import com.hrbhd.bady.util.PageBean;

public interface INoticeService {

	public void pageQuery(PageBean pageBean);

	public void save(Notice model);

	public void addNotice(Notice model, String[] push_ranges) throws IOException;

	public Notice findById(String id);

	public void delete(Notice notice);

	public void putOutNotice(Notice model) throws IOException;

	public void editNotice(Notice model) throws IOException;

	public List<Notice> findAll();

	public void findNoCheck(Notice model) throws IOException;

	public void findCheck(Notice model) throws IOException;

	public void checkRange(Notice model) throws IOException;

	public void termQuery(Notice model, PageBean pageBean, DetachedCriteria detachedCriteria, String start_time,
			String end_time);

	public void t_read(Notice model);

	public void p_read(Notice model);


}
