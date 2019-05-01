package com.kosmo.insomnia.service;

public class BandSubmitWaitingDTO {

	private String isExist; //DB에 데이터가 존재하는지 판단하는 용도
	
	private String sw_no;
	private String b_no;
	private String sw_banner;
	private String sw_short_description;
	private String sw_long_description;
	private String sw_image_1;
	private String sw_image_2;
	private String sw_image_3;
	private String sw_youtube;
	private String sw_content;
	private String sw_postDate;
	
	
	
	
	
	public String getIsExist() {
		return isExist;
	}
	public void setIsExist(String isExist) {
		this.isExist = isExist;
	}
	public String getSw_no() {
		return sw_no;
	}
	public void setSw_no(String sw_no) {
		this.sw_no = sw_no;
	}
	public String getB_no() {
		return b_no;
	}
	public void setB_no(String b_no) {
		this.b_no = b_no;
	}
	public String getSw_banner() {
		return sw_banner;
	}
	public void setSw_banner(String sw_banner) {
		this.sw_banner = sw_banner;
	}
	public String getSw_short_description() {
		return sw_short_description;
	}
	public void setSw_short_description(String sw_short_description) {
		this.sw_short_description = sw_short_description;
	}
	public String getSw_long_description() {
		return sw_long_description;
	}
	public void setSw_long_description(String sw_long_description) {
		this.sw_long_description = sw_long_description;
	}
	public String getSw_image_1() {
		return sw_image_1;
	}
	public void setSw_image_1(String sw_image_1) {
		this.sw_image_1 = sw_image_1;
	}
	public String getSw_image_2() {
		return sw_image_2;
	}
	public void setSw_image_2(String sw_image_2) {
		this.sw_image_2 = sw_image_2;
	}
	public String getSw_image_3() {
		return sw_image_3;
	}
	public void setSw_image_3(String sw_image_3) {
		this.sw_image_3 = sw_image_3;
	}
	public String getSw_youtube() {
		return sw_youtube;
	}
	public void setSw_youtube(String sw_youtube) {
		this.sw_youtube = sw_youtube;
	}
	public String getSw_content() {
		return sw_content;
	}
	public void setSw_content(String sw_content) {
		this.sw_content = sw_content;
	}
	public String getSw_postDate() {
		return sw_postDate;
	}
	public void setSw_postDate(String sw_postDate) {
		this.sw_postDate = sw_postDate;
	}
	
}//class
