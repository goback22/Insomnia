package com.kosmo.insomnia.service;

import java.sql.Date;

public class AdminDTO {

	//members
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
	private Date join_date;
	private String gender;
	private String is_activation;
	private String activationkey;
	private String email;
	private String is_blockmember;
	//band
	private String b_no;
	private String b_name;
	private String bm_title;
	private String b_description;
	private String b_album_cover;
	private String b_liked;
	//bandmusic
	private String bm_name;
	private String bm_description;
	private String bm_liked;
	//bandimage
	private String image;
	//bandsubmit
	private String s_submit_date;
	private String s_goal_accumulation;
	private String s_account_bank;
	private String s_account_serial;
	private String s_goal_price;
	private String s_goal_deadline;
	//reward
	private String r_no;
	private String s_no;
	private String r_price;
	private String r_name;
	private String r_description;
	
	//bandsubmitwaiting
	private String sw_postdate;
	private String sw_content;
	private String sw_isaccept;
	private String sw_iscomplete;
	private String sw_short_deccription;
	
	//band chart
	private String sp_reward_qty;
	
	
	//sum reward qty
	private String sum_reward_qty_1;
	private String sum_reward_qty_2;
	private String sum_reward_qty_3;
	
	
	
	//2019 05 15 임한결추가 편의상 추가함
	private String sumPrice;
	private String sp_date;
	private String sp_no;
	
	//bgs pay
	private String p_no;
	private String qty;
	private String paydate;
	private String non_bankbook;
	private String non_bankbook_complete;
	private String non_bankbook_bank_name;
	private String non_bankbook_account_serial;
	private String ct_no;
	private String c_concertdate;
	private String c_price;
	private String bgsco_no;
	private String b_title;
	private String b_place;
	private String b_content;
	
	//main Pay
	private String p_complete_date;
	private String p_total_people;
	private String p_total_accumulation;
	private String p_uid_no;
	private String isPaying;
	//category
	private String ct_name;
	
	
	public String getCt_name() {
		return ct_name;
	}
	public void setCt_name(String ct_name) {
		this.ct_name = ct_name;
	}
	public String getIsPaying() {
		return isPaying;
	}
	public void setIsPaying(String isPaying) {
		this.isPaying = isPaying;
	}
	public String getP_complete_date() {
		return p_complete_date;
	}
	public void setP_complete_date(String p_complete_date) {
		this.p_complete_date = p_complete_date;
	}
	public String getP_total_people() {
		return p_total_people;
	}
	public void setP_total_people(String p_total_people) {
		this.p_total_people = p_total_people;
	}
	public String getP_total_accumulation() {
		return p_total_accumulation;
	}
	public void setP_total_accumulation(String p_total_accumulation) {
		this.p_total_accumulation = p_total_accumulation;
	}
	public String getP_uid_no() {
		return p_uid_no;
	}
	public void setP_uid_no(String p_uid_no) {
		this.p_uid_no = p_uid_no;
	}
	public String getIs_blockmember() {
		return is_blockmember;
	}
	public void setIs_blockmember(String is_blockmember) {
		this.is_blockmember = is_blockmember;
	}
	public String getP_no() {
		return p_no;
	}
	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	public String getQty() {
		return qty;
	}
	public void setQty(String qty) {
		this.qty = qty;
	}
	public String getPaydate() {
		return paydate;
	}
	public void setPaydate(String paydate) {
		this.paydate = paydate;
	}
	public String getNon_bankbook() {
		return non_bankbook;
	}
	public void setNon_bankbook(String non_bankbook) {
		this.non_bankbook = non_bankbook;
	}
	public String getNon_bankbook_complete() {
		return non_bankbook_complete;
	}
	public void setNon_bankbook_complete(String non_bankbook_complete) {
		this.non_bankbook_complete = non_bankbook_complete;
	}
	public String getNon_bankbook_bank_name() {
		return non_bankbook_bank_name;
	}
	public void setNon_bankbook_bank_name(String non_bankbook_bank_name) {
		this.non_bankbook_bank_name = non_bankbook_bank_name;
	}
	public String getNon_bankbook_account_serial() {
		return non_bankbook_account_serial;
	}
	public void setNon_bankbook_account_serial(String non_bankbook_account_serial) {
		this.non_bankbook_account_serial = non_bankbook_account_serial;
	}
	public String getCt_no() {
		return ct_no;
	}
	public void setCt_no(String ct_no) {
		this.ct_no = ct_no;
	}
	public String getC_concertdate() {
		return c_concertdate;
	}
	public void setC_concertdate(String c_concertdate) {
		this.c_concertdate = c_concertdate;
	}
	public String getC_price() {
		return c_price;
	}
	public void setC_price(String c_price) {
		this.c_price = c_price;
	}
	public String getBgsco_no() {
		return bgsco_no;
	}
	public void setBgsco_no(String bgsco_no) {
		this.bgsco_no = bgsco_no;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_place() {
		return b_place;
	}
	public void setB_place(String b_place) {
		this.b_place = b_place;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
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
	public String getSumPrice() {
		return sumPrice;
	}
	public void setSumPrice(String sumPrice) {
		this.sumPrice = sumPrice;
	}
	public String getSum_reward_qty_1() {
		return sum_reward_qty_1;
	}
	public void setSum_reward_qty_1(String sum_reward_qty_1) {
		this.sum_reward_qty_1 = sum_reward_qty_1;
	}
	public String getSum_reward_qty_2() {
		return sum_reward_qty_2;
	}
	public void setSum_reward_qty_2(String sum_reward_qty_2) {
		this.sum_reward_qty_2 = sum_reward_qty_2;
	}
	public String getSum_reward_qty_3() {
		return sum_reward_qty_3;
	}
	public void setSum_reward_qty_3(String sum_reward_qty_3) {
		this.sum_reward_qty_3 = sum_reward_qty_3;
	}
	public String getR_no() {
		return r_no;
	}
	public void setR_no(String r_no) {
		this.r_no = r_no;
	}
	public String getSp_reward_qty() {
		return sp_reward_qty;
	}
	public void setSp_reward_qty(String sp_reward_qty) {
		this.sp_reward_qty = sp_reward_qty;
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
	public String getS_account_bank() {
		return s_account_bank;
	}
	public void setS_account_bank(String s_account_bank) {
		this.s_account_bank = s_account_bank;
	}
	public String getS_account_serial() {
		return s_account_serial;
	}
	public void setS_account_serial(String s_account_serial) {
		this.s_account_serial = s_account_serial;
	}
	public String getSw_short_deccription() {
		return sw_short_deccription;
	}
	public void setSw_short_deccription(String sw_short_deccription) {
		this.sw_short_deccription = sw_short_deccription;
	}
	public String getS_goal_accumulation() {
		return s_goal_accumulation;
	}
	public void setS_goal_accumulation(String s_goal_accumulation) {
		this.s_goal_accumulation = s_goal_accumulation;
	}
	public String getS_goal_price() {
		return s_goal_price;
	}
	public void setS_goal_price(String s_goal_price) {
		this.s_goal_price = s_goal_price;
	}
	public String getS_goal_deadline() {
		return s_goal_deadline;
	}
	public void setS_goal_deadline(String s_goal_deadline) {
		this.s_goal_deadline = s_goal_deadline;
	}
	public String getS_submit_date() {
		return s_submit_date;
	}
	public void setS_submit_date(String s_submit_date) {
		this.s_submit_date = s_submit_date;
	}
	public String getSw_postdate() {
		return sw_postdate;
	}
	public void setSw_postdate(String sw_postdate) {
		this.sw_postdate = sw_postdate;
	}
	public String getSw_content() {
		return sw_content;
	}
	public void setSw_content(String sw_content) {
		this.sw_content = sw_content;
	}
	public String getSw_isaccept() {
		return sw_isaccept;
	}
	public void setSw_isaccept(String sw_isaccept) {
		this.sw_isaccept = sw_isaccept;
	}
	public String getSw_iscomplete() {
		return sw_iscomplete;
	}
	public void setSw_iscomplete(String sw_iscomplete) {
		this.sw_iscomplete = sw_iscomplete;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getIs_activation() {
		return is_activation;
	}
	public void setIs_activation(String is_activation) {
		this.is_activation = is_activation;
	}
	public String getActivationkey() {
		return activationkey;
	}
	public void setActivationkey(String activationkey) {
		this.activationkey = activationkey;
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
	public String getBm_title() {
		return bm_title;
	}
	public void setBm_title(String bm_title) {
		this.bm_title = bm_title;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getSms_recieve() {
		return sms_recieve;
	}
	public void setSms_recieve(String sms_recieve) {
		this.sms_recieve = sms_recieve;
	}
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
