package com.kosmo.insomnia.service;

public class BandMusicDTO {

	private String isExist; //밴드가 등록한 음악이 있는지 확인하는 변수
	
	private String bm_no;
	private String b_no;
	private String bm_name;
	private String bm_description;
	private String bm_liked;
	private String ct_no;
	private String bm_filename;
	
	///편의를 위해 추가한 변수들
	private String ct_name;
	private String ct_name_css;
	
	private String index; //리스트에 들어간 인덱스를 넣어서 저장
	
	
	
	
	public String getIndex() {
		return index;
	}
	public void setIndex(String index) {
		this.index = index;
	}
	public String getBm_filename() {
		return bm_filename;
	}
	public void setBm_filename(String bm_filename) {
		this.bm_filename = bm_filename;
	}
	public String getIsExist() {
		return isExist;
	}
	public void setIsExist(String isExist) {
		this.isExist = isExist;
	}
	public String getCt_name() {
		return ct_name;
	}
	public void setCt_name(String ct_name) {
		this.ct_name = ct_name;
	}
	public String getCt_name_css() {
		return ct_name_css;
	}
	public void setCt_name_css(String ct_name_css) {
		this.ct_name_css = ct_name_css;
	}
	public String getBm_no() {
		return bm_no;
	}
	public void setBm_no(String bm_no) {
		this.bm_no = bm_no;
	}
	public String getB_no() {
		return b_no;
	}
	public void setB_no(String b_no) {
		this.b_no = b_no;
	}
	public String getBm_name() {
		return bm_name;
	}
	public void setBm_name(String bm_name) {
		this.bm_name = bm_name;
	}
	public String getBm_description() {
		return bm_description;
	}
	public void setBm_description(String bm_description) {
		this.bm_description = bm_description;
	}
	public String getBm_liked() {
		return bm_liked;
	}
	public void setBm_liked(String bm_liked) {
		this.bm_liked = bm_liked;
	}
	public String getCt_no() {
		return ct_no;
	}
	public void setCt_no(String ct_no) {
		this.ct_no = ct_no;
	}
	
	
	
}//class
