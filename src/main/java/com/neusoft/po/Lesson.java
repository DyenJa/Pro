package com.neusoft.po;
//课程
public class Lesson {
	private int lid;				//课程id

	private String lname;			//课程名

	private String imgUrl;			//图片url
	private double lprice;			//课程价格
	private String ldesc;			//课程富文本
	private String category;		//课程类别
	private String pubTime;			//发布时间
	
	private int  qid;				//企业id
	private Enterprise enterprise;
	public int getLid() {
		return lid;
	}
	public void setLid(int lid) {
		this.lid = lid;
	}

	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public double getLprice() {
		return lprice;
	}
	public void setLprice(double lprice) {
		this.lprice = lprice;
	}
	public String getLdesc() {
		return ldesc;
	}
	public void setLdesc(String ldesc) {
		this.ldesc = ldesc;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}
	public String getPubTime() {
		return pubTime;
	}
	public void setPubTime(String pubTime) {
		this.pubTime = pubTime;
	}
	public Enterprise getEnterprise() {
		return enterprise;
	}
	public void setEnterprise(Enterprise enterprise) {
		this.enterprise = enterprise;
	}
	
	
}
