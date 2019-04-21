package com.kosmo.insomnia.service;

//리워드 테이블
public class RewardDTO {

	///칼럼들
	private String R_no;
	private String S_no;
	private String R_Price;
	private String R_Name;
	private String R_Description;
	
	//편의를 위해 추가
	private String B_name;  //리워드를 준비한 밴드 이름
	private String BM_name; //리워드로 준비한 노래 이름
	private String S_Album_cover;
	
	//게터*세터
	public String getR_no() {
		return R_no;
	}
	public void setR_no(String r_no) {
		R_no = r_no;
	}
	public String getS_no() {
		return S_no;
	}
	public void setS_no(String s_no) {
		S_no = s_no;
	}
	public String getR_Price() {
		return R_Price;
	}
	public void setR_Price(String r_Price) {
		R_Price = r_Price;
	}
	public String getR_Name() {
		return R_Name;
	}
	public void setR_Name(String r_Name) {
		R_Name = r_Name;
	}
	public String getR_Description() {
		return R_Description;
	}
	public void setR_Description(String r_Description) {
		R_Description = r_Description;
	}
	public String getB_name() {
		return B_name;
	}
	public void setB_name(String b_name) {
		B_name = b_name;
	}
	public String getBM_name() {
		return BM_name;
	}
	public void setBM_name(String bM_name) {
		BM_name = bM_name;
	}
	public String getS_Album_cover() {
		return S_Album_cover;
	}
	public void setS_Album_cover(String s_Album_cover) {
		S_Album_cover = s_Album_cover;
	}
	
	
	
	
	
	
	
}
