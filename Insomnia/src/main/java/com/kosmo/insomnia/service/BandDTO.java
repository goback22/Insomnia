package com.kosmo.insomnia.service;

import java.util.Random;

public class BandDTO {

	private String id;
	private String b_no;
	private String b_name;
	private String b_description;
	private String b_album_cover;
	private String b_liked;
	private String ct_no;
	
	
	//편의를 위한 변수들
	private String ct_name;
	private String ct_name_css;
	private String bm_name;
	
	//임의의 크기지정을 위한 변수
	private String wh; //가로세로
	private String mt; //마진top
	private String mr; //right
	private String mb; //bottom
	private String ml; //left
	
	public BandDTO() {
		wh = (Math.ceil(Math.random()*200) + 50) + "px";
		mt = Math.ceil(Math.random() * 100) + "px";
		mr = Math.ceil(Math.random() * 100) + "px";
		mb = Math.ceil(Math.random() * 100) + "px";
		ml = Math.ceil(Math.random() * 100) + "px";
	}////constructor

	
	
	
	
	public String getBm_name() {
		return bm_name;
	}
	public void setBm_name(String bm_name) {
		this.bm_name = bm_name;
	}
	public String getWh() {
		return wh;
	}
	
	public void setWh(String wh) {
		this.wh = wh;
	}
	
	public String getMt() {
		return mt;
	}
	
	public void setMt(String mt) {
		this.mt = mt;
	}
	
	public String getMr() {
		return mr;
	}
	
	public void setMr(String mr) {
		this.mr = mr;
	}
	
	public String getMb() {
		return mb;
	}
	
	public void setMb(String mb) {
		this.mb = mb;
	}
	
	public String getMl() {
		return ml;
	}
	
	public void setMl(String ml) {
		this.ml = ml;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getB_no() {
		return b_no;
	}
	public void setB_no(String b_no) {
		this.b_no = b_no;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getB_description() {
		return b_description;
	}
	public void setB_description(String b_description) {
		this.b_description = b_description;
	}
	public String getB_album_cover() {
		return b_album_cover;
	}
	public void setB_album_cover(String b_album_cover) {
		this.b_album_cover = b_album_cover;
	}
	public String getB_liked() {
		return b_liked;
	}
	public void setB_liked(String b_liked) {
		this.b_liked = b_liked;
	}
	public String getCt_no() {
		return ct_no;
	}
	public void setCt_no(String ct_no) {
		this.ct_no = ct_no;
	}
	
}//class
