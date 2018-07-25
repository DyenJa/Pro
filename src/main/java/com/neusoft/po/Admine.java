package com.neusoft.po;
//后台管理员
public class Admine {
	private String adname;
	private String adpassword;
	private int id;					//用户id
	
	private int qid;				//对应企业的id

	public String getAdname() {
		return adname;
	}

	public void setAdname(String adname) {
		this.adname = adname;
	}
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQid() {
		return qid;
	}

	public void setQid(int qid) {
		this.qid = qid;
	}

	public String getAdpassword() {
		return adpassword;
	}

	public void setAdpassword(String adpassword) {
		this.adpassword = adpassword;
	}


	
}
