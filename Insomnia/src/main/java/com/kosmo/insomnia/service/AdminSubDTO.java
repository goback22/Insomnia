package com.kosmo.insomnia.service;

public class AdminSubDTO {
	//members
	private String name;
	//bgsconcert 
	private String bgsco_no;
	private String b_title;
	private String b_place;
	private String b_content;
	
	//concerttimes
	private String ct_no;
	private String c_concertdate;
	private String c_price;
	
	//bgsapply
	private String ap_no;
	private String ap_title;
	private String ap_content;
	private String ap_postdate;
	private String ap_visit;
	private String ap_genre;
	private String id;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAp_no() {
		return ap_no;
	}
	public void setAp_no(String ap_no) {
		this.ap_no = ap_no;
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
	public String getAp_postdate() {
		return ap_postdate;
	}
	public void setAp_postdate(String ap_postdate) {
		this.ap_postdate = ap_postdate;
	}
	public String getAp_visit() {
		return ap_visit;
	}
	public void setAp_visit(String ap_visit) {
		this.ap_visit = ap_visit;
	}
	public String getAp_genre() {
		return ap_genre;
	}
	public void setAp_genre(String ap_genre) {
		this.ap_genre = ap_genre;
	}
	//getter setter
	public String getBgsco_no() {
		return bgsco_no;
	}
	public void setBgsco_no(String bgsco_no) {
		this.bgsco_no = bgsco_no;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_place() {
		return b_place;
	}
	public void setB_place(String b_place) {
		this.b_place = b_place;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getCt_no() {
		return ct_no;
	}
	public void setCt_no(String ct_no) {
		this.ct_no = ct_no;
	}
	public String getC_concertdate() {
		return c_concertdate;
	}
	public void setC_concertdate(String c_concertdate) {
		this.c_concertdate = c_concertdate;
	}
	public String getC_price() {
		return c_price;
	}
	public void setC_price(String c_price) {
		this.c_price = c_price;
	}
	
	
}
