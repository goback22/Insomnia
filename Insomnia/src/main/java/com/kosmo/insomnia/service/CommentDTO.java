package com.kosmo.insomnia.service;

//방구석 기타리스트 댓글
public class CommentDTO {
	//멤버 변수
	private String r_no;
	private String id;
	private String stars;
	private String bgsco_no;
	private String content;
	private String postdate;
	
	//답글
	private String refer;
	private String depth;
	private String step;

	//이름
	private String name;

	//Getter and Setter
	public String getR_no() {
		return r_no;
	}
	public void setR_no(String r_no) {
		this.r_no = r_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStars() {
		return stars;
	}
	public void setStars(String stars) {
		this.stars = stars;
	}
	public String getBgsco_no() {
		return bgsco_no;
	}
	public void setBgsco_no(String bgsco_no) {
		this.bgsco_no = bgsco_no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPostdate() {
		return postdate;
	}
	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRefer() {
		return refer;
	}
	public void setRefer(String refer) {
		this.refer = refer;
	}
	public String getDepth() {
		return depth;
	}
	public void setDepth(String depth) {
		this.depth = depth;
	}
	public String getStep() {
		return step;
	}

	public void setStep(String step) {
		this.step = step;
	}
	
}//class