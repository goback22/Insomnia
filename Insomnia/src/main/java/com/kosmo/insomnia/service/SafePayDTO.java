package com.kosmo.insomnia.service;

public class SafePayDTO {
	
	//멤버변수
	private String sp_no;
	private String id;
	private String s_no;
	private String r_no;
	private String p_no;
	private String sp_reward_qty;
	private String sp_support;
	private java.sql.Date Date;
	private String sp_recipient;
	private String sp_zip_code;
	private String sp_shipping_address;
	private String sp_depositor;
	private String sp_bank_name;
	private String sp_account_serial;
	private String sp_phone;
	private String sp_uid_no;
	
	
	//편의상 추가한 변수
	private String message;


	
	
	
	
	
	public String getSp_uid_no() {
		return sp_uid_no;
	}
	public void setSp_uid_no(String sp_uid_no) {
		this.sp_uid_no = sp_uid_no;
	}
	
	
	public String getS_no() {
		return s_no;
	}


	public void setS_no(String s_no) {
		this.s_no = s_no;
	}


	public String getSp_no() {
		return sp_no;
	}


	public void setSp_no(String sp_no) {
		this.sp_no = sp_no;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getR_no() {
		return r_no;
	}


	public void setR_no(String r_no) {
		this.r_no = r_no;
	}


	public String getP_no() {
		return p_no;
	}


	public void setP_no(String p_no) {
		this.p_no = p_no;
	}


	public String getSp_reward_qty() {
		return sp_reward_qty;
	}


	public void setSp_reward_qty(String sp_reward_qty) {
		this.sp_reward_qty = sp_reward_qty;
	}



	public String getSp_support() {
		return sp_support;
	}


	public void setSp_support(String sp_support) {
		this.sp_support = sp_support;
	}


	public java.sql.Date getDate() {
		return Date;
	}


	public void setDate(java.sql.Date date) {
		Date = date;
	}


	public String getSp_recipient() {
		return sp_recipient;
	}


	public void setSp_recipient(String sp_recipient) {
		this.sp_recipient = sp_recipient;
	}


	public String getSp_zip_code() {
		return sp_zip_code;
	}


	public void setSp_zip_code(String sp_zip_code) {
		this.sp_zip_code = sp_zip_code;
	}


	public String getSp_shipping_address() {
		return sp_shipping_address;
	}


	public void setSp_shipping_address(String sp_shipping_address) {
		this.sp_shipping_address = sp_shipping_address;
	}


	public String getSp_depositor() {
		return sp_depositor;
	}


	public void setSp_depositor(String sp_depositor) {
		this.sp_depositor = sp_depositor;
	}


	public String getSp_bank_name() {
		return sp_bank_name;
	}


	public void setSp_bank_name(String sp_bank_name) {
		this.sp_bank_name = sp_bank_name;
	}


	public String getSp_account_serial() {
		return sp_account_serial;
	}


	public void setSp_account_serial(String sp_account_serial) {
		this.sp_account_serial = sp_account_serial;
	}


	public String getSp_phone() {
		return sp_phone;
	}


	public void setSp_phone(String sp_phone) {
		this.sp_phone = sp_phone;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}
	
	
	
	
	
}//class
