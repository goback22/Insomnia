package com.kosmo.insomnia.service;

public class ListDTO {
	//멤버 변수
	private String ap_no;
	private String g_no;
	private String ap_title;
	private String ap_content;
	private java.sql.Date ap_postdate;
	private String ap_visit;
	private String ap_remarks;
	private String id;
	private String ap_genre;
	private String ap_attachedfile;

	//★
	private String name;
	
	//getter and setter
	public String getAp_no() {
		return ap_no;
	}
	public void setAp_no(String ap_no) {
		this.ap_no = ap_no;
	}
	public String getG_no() {
		return g_no;
	}
	public void setG_no(String g_no) {
		this.g_no = g_no;
	}
	public String getAp_title() {
		return ap_title;
	}
	public void setAp_title(String ap_title) {
		this.ap_title = ap_title;
	}
	public String getAp_content() {
		return ap_content;
	}
	public void setAp_content(String ap_content) {
		this.ap_content = ap_content;
	}
	public java.sql.Date getAp_postdate() {
		return ap_postdate;
	}
	public void setAp_postdate(java.sql.Date ap_postdate) {
		this.ap_postdate = ap_postdate;
	}
	public String getAp_visit() {
		return ap_visit;
	}
	public void setAp_visit(String ap_visit) {
		this.ap_visit = ap_visit;
	}
	public String getAp_remarks() {
		return ap_remarks;
	}
	public void setAp_remarks(String ap_remarks) {
		this.ap_remarks = ap_remarks;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAp_genre() {
		return ap_genre;
	}
	public void setAp_genre(String ap_genre) {
		this.ap_genre = ap_genre;
	}
	public String getAp_attachedfile() {
		return ap_attachedfile;
	}
	public void setAp_attachedfile(String ap_attachedfile) {
		this.ap_attachedfile = ap_attachedfile;
	}
}
