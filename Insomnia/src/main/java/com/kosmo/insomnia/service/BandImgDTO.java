package com.kosmo.insomnia.service;

public class BandImgDTO {

	private String isExist; // 밴드가 등록한 이미지가 있는지 여부를 위한 변수
	private String bi_no;
	private String b_no;
	private String image;
	
	
	public String getIsExist() {
		return isExist;
	}
	public void setIsExist(String isExist) {
		this.isExist = isExist;
	}
	public String getBi_no() {
		return bi_no;
	}
	public void setBi_no(String bi_no) {
		this.bi_no = bi_no;
	}
	public String getB_no() {
		return b_no;
	}
	public void setB_no(String b_no) {
		this.b_no = b_no;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
	
}//class
