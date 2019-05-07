package com.kosmo.insomnia.service;

public class AdminMemberPayDTO {
	//safepay
	private String sp_no;
	private String sp_date;
	private String sp_recipient;
	private String sp_depositor;
	private String shipping_address;
	private String sp_phone;
	private String sp_reward_qty;
	private String sp_bank_name;
	private String sp_account_serial;
	
	//reward
	private String r_name;
	private String r_price;
		
	//safepay
	public String getSp_no() {
		return sp_no;
	}
	public void setSp_no(String sp_no) {
		this.sp_no = sp_no;
	}
	public String getSp_date() {
		return sp_date;
	}
	public void setSp_date(String sp_date) {
		this.sp_date = sp_date;
	}
	public String getSp_recipient() {
		return sp_recipient;
	}
	public void setSp_recipient(String sp_recipient) {
		this.sp_recipient = sp_recipient;
	}
	public String getSp_depositor() {
		return sp_depositor;
	}
	public void setSp_depositor(String sp_depositor) {
		this.sp_depositor = sp_depositor;
	}
	public String getShipping_address() {
		return shipping_address;
	}
	public void setShipping_address(String shipping_address) {
		this.shipping_address = shipping_address;
	}
	public String getSp_phone() {
		return sp_phone;
	}
	public void setSp_phone(String sp_phone) {
		this.sp_phone = sp_phone;
	}
	public String getSp_reward_qty() {
		return sp_reward_qty;
	}
	public void setSp_reward_qty(String sp_reward_qty) {
		this.sp_reward_qty = sp_reward_qty;
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
	//safepay
	
	//reward
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_price() {
		return r_price;
	}
	public void setR_price(String r_price) {
		this.r_price = r_price;
	}
	//reward
}
