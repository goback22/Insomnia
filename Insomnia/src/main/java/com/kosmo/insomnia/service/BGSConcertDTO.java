package com.kosmo.insomnia.service;

public class BGSConcertDTO {
	private String bgsco_no;
	private String b_title;
	private String b_place;
	private String b_content;
	
	//편의를 위해 추가 4월 23일 서기환 - 문제 소지시 말씀해 주세요.
	private String c_concertDate;  //concertTimes 테이블
	private String c_price;		//concertTimes 테이블
	private String qty;		//bgspay 테이블
	
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
	
	//추가
	public String getC_concertDate() {
		return c_concertDate;
	}
	public void setC_concertDate(String c_concertDate) {
		this.c_concertDate = c_concertDate;
	}
	public String getC_price() {
		return c_price;
	}
	public void setC_price(String c_price) {
		this.c_price = c_price;
	}
	public String getQty() {
		return qty;
	}
	public void setQty(String qty) {
		this.qty = qty;
	}
	
	

	
}/////class(BGSConcertDTO)
