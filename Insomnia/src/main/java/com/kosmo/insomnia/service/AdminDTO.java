package com.kosmo.insomnia.service;

import java.sql.Date;

public class AdminDTO {

	private String id;
	private String name;
	private String password;
	private String profile_img;
	private String birthDay;
	private String zip_code;
	private String shipping_address;
	private String description;
	private String login_chain;
	private String phone;
	private String bank_name;
	private String bank_serial;
	private String sms_recieve;
	private String email_recieve;
	
	public String getSms_recieve() {
		return sms_recieve;
	}
	public void setSms_recieve(String sms_recieve) {
		this.sms_recieve = sms_recieve;
	}
	
	private Date join_date;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public String getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}
	public String getZip_code() {
		return zip_code;
	}
	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}
	public String getShipping_address() {
		return shipping_address;
	}
	public void setShipping_address(String shipping_address) {
		this.shipping_address = shipping_address;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLogin_chain() {
		return login_chain;
	}
	public void setLogin_chain(String login_chain) {
		this.login_chain = login_chain;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public String getBank_serial() {
		return bank_serial;
	}
	public void setBank_serial(String bank_serial) {
		this.bank_serial = bank_serial;
	}
	public String getEmail_recieve() {
		return email_recieve;
	}
	public void setEmail_recieve(String email_recieve) {
		this.email_recieve = email_recieve;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	
	
}
