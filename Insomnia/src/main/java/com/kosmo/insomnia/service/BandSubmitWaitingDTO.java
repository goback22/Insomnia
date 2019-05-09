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
	private String sw_youtube_title;
	private String sw_content;
	private String sw_postDate;
	private String sw_isAccept;
	private String sw_isComplete;
	
	//편의상 추가
	private String ct_name;
	private String ct_no;
	private String ct_name_css;
	private String b_name;
	private String sw_youtube_thumbnail;
	
	//밴드 펀딩이 완료된 경우 한방에 보내버리자
	private String s_no;
	private String s_goal_price;
	private String s_goal_accumulation;
	private String s_goal_deadline;
	private String s_liked;
	
	//계산해서 직접 넣어주는 변수
	private String comma_Accumulation;
	
	
	
	
	
	public String getComma_Accumulation() {
		return comma_Accumulation;
	}
	public void setComma_Accumulation(String comma_Accumulation) {
		this.comma_Accumulation = comma_Accumulation;
	}
	public String getS_no() {
		return s_no;
	}
	public void setS_no(String s_no) {
		this.s_no = s_no;
	}
	public String getS_goal_deadline() {
		return s_goal_deadline;
	}
	public void setS_goal_deadline(String s_goal_deadline) {
		this.s_goal_deadline = s_goal_deadline;
	}
	public String getS_liked() {
		return s_liked;
	}
	public void setS_liked(String s_liked) {
		this.s_liked = s_liked;
	}
	public String getB_name() {
		return b_name;
	}
	public String getSw_isComplete() {
		return sw_isComplete;
	}
	public void setSw_isComplete(String sw_isComplete) {
		this.sw_isComplete = sw_isComplete;
	}
	public String getS_goal_price() {
		return s_goal_price;
	}
	public void setS_goal_price(String s_goal_price) {
		this.s_goal_price = s_goal_price;
	}
	public String getS_goal_accumulation() {
		return s_goal_accumulation;
	}
	public void setS_goal_accumulation(String s_goal_accumulation) {
		this.s_goal_accumulation = s_goal_accumulation;
	}
	public String getSw_youtube_thumbnail() {
		return sw_youtube_thumbnail;
	}
	public void setSw_youtube_thumbnail(String sw_youtube_thumbnail) {
		this.sw_youtube_thumbnail = sw_youtube_thumbnail;
	}
	public String getSw_isAccept() {
		return sw_isAccept;
	}
	public void setSw_isAccept(String sw_isAccept) {
		this.sw_isAccept = sw_isAccept;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getSw_youtube_title() {
		return sw_youtube_title;
	}
	public void setSw_youtube_title(String sw_youtube_title) {
		this.sw_youtube_title = sw_youtube_title;
	}
	public String getIsExist() {
		return isExist;
	}
	public String getCt_name() {
		return ct_name;
	}
	public void setCt_name(String ct_name) {
		this.ct_name = ct_name;
	}
	public String getCt_no() {
		return ct_no;
	}
	public void setCt_no(String ct_no) {
		this.ct_no = ct_no;
	}
	public String getCt_name_css() {
		return ct_name_css;
	}
	public void setCt_name_css(String ct_name_css) {
		this.ct_name_css = ct_name_css;
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
