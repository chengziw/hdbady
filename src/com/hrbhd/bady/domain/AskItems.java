package com.hrbhd.bady.domain;

import java.io.Serializable;

public class AskItems implements Serializable{
	
	private String id;
	
	private Ask ask;
	private String title;
	private String ask_id;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Ask getAsk() {
		return ask;
	}
	public void setAsk(Ask ask) {
		this.ask = ask;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAsk_id() {
		return ask_id;
	}
	public void setAsk_id(String ask_id) {
		this.ask_id = ask_id;
	}
	
	
}
