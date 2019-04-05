package com.hrbhd.bady.service;

import java.io.IOException;
import java.util.List;
import java.util.Set;

import org.hibernate.criterion.DetachedCriteria;

import com.hrbhd.bady.domain.Ask;
import com.hrbhd.bady.domain.AskItems;
import com.hrbhd.bady.domain.AskTeacherCheck;
import com.hrbhd.bady.util.PageBean;

public interface IAskService {

	public void pageQuery(PageBean pageBean);

	public Ask findById(String id);

	public void addNotice(Ask model, String[] push_ranges, String[] ask_answer_input) throws IOException;

	public void delete(Ask ask);

	public void putOutAsk(Ask model) throws IOException;

	public void editAsk(Ask model, String[] ask_answer_input) throws IOException;

	public List<Ask> findAll();

	public Set<AskItems> getAskItems(Ask ask);

	public void findNoCheck(Ask model) throws IOException;

	public void findCheck(Ask model) throws IOException;

	public void edit(Ask model);

	public void about(Ask model);

	public void aboutAboutAsk(Ask model ,String askItemsId) throws IOException;

	public void checkRange(Ask model) throws IOException;

	public Set<AskTeacherCheck> getAskTeacherCheck(Ask ask);

	public void termQuery(Ask model, PageBean pageBean, DetachedCriteria detachedCriteria);

	public void t_checkAsk(String askItemsId);

	public void p_checkAsk(String askItemsId);

	
}
