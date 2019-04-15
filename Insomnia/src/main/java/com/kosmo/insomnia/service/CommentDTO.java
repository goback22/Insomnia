package com.kosmo.insomnia.service;

public class CommentDTO {
	//멤버 변수
	private String s_no;
	private String c_step;
	private String c_depth;
	private String id;
	private String c_stars;
	private String c_content;
	private String c_post_date;
	private String c_liked;
	private String c_no;
	
	//이름	
	private String name;
	
	//Getter and Setter
	public String getS_no() {
		return s_no;
	}
	
	public void setS_no(String s_no) {
		this.s_no = s_no;
	}
	
	public String getC_no() {
		return c_no;
	}
	
	public void setC_no(String c_no) {
		this.c_no = c_no;
	}

	public String getC_step() {
		return c_step;
	}

	public void setC_step(String c_step) {
		this.c_step = c_step;
	}

	public String getC_depth() {
		return c_depth;
	}

	public void setC_depth(String c_depth) {
		this.c_depth = c_depth;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getC_stars() {
		return c_stars;
	}

	public void setC_stars(String c_stars) {
		this.c_stars = c_stars;
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

	public String getC_liked() {
		return c_liked;
	}

	public void setC_liked(String c_liked) {
		this.c_liked = c_liked;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}//class