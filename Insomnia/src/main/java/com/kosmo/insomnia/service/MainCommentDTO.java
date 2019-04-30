package com.kosmo.insomnia.service;

public class MainCommentDTO {
	private String id;
	private String c_content;
	private String c_post_date;
	
	//편의를 위한 변수 추가
	private String email;

	//Getter and Setter
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	public String getC_post_date() {
		return c_post_date;
	}

	public void setC_post_date(String c_post_date) {
		this.c_post_date = c_post_date;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}//class