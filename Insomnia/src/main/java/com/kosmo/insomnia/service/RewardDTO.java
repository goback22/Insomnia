package com.kosmo.insomnia.service;

//리워드 테이블
public class RewardDTO {

	///칼럼들
	private String r_no;
	private String s_no;
	private String r_price;
	private String r_name;
	private String r_description;
	
	//편의를 위해 추가
	private String b_name;  //리워드를 준비한 밴드 이름
	private String bm_name; //리워드로 준비한 노래 이름
	private String sw_banner;  //리워드 앨범 커버
	
	
	//게터*세터
	public String getR_no() {
		return r_no;
	}
	public void setR_no(String r_no) {
		this.r_no = r_no;
	}
	public String getS_no() {
		return s_no;
	}
	public void setS_no(String s_no) {
		this.s_no = s_no;
	}
	public String getR_price() {
		return r_price;
	}
	public void setR_price(String r_price) {
		this.r_price = r_price;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_description() {
		return r_description;
	}
	public void setR_description(String r_description) {
		this.r_description = r_description;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getBm_name() {
		return bm_name;
	}
	public void setBm_name(String bm_name) {
		this.bm_name = bm_name;
	}
	public String getSw_banner() {
		return sw_banner;
	}
	public void setSw_banner(String sw_banner) {
		this.sw_banner = sw_banner;
	}
	
	
}
