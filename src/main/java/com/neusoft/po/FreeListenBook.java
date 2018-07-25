package com.neusoft.po;
//免费试听课预约
public class FreeListenBook {
	private int id;				//预约id
	
	private String userName;	//预约人姓名
	private String tel;			//预约人电话
	private String bookTime;	//预约时间
	private String status;		//预约状态{待处理、已处理、已取消}
	private String comment;		//预约留言
	
	private int fid;			//试听课id
	private FreeListen freelisten;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getBookTime() {
		return bookTime;
	}
	public void setBookTime(String bookTime) {
		this.bookTime = bookTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public FreeListen getFreelisten() {
		return freelisten;
	}
	public void setFreelisten(FreeListen freelisten) {
		this.freelisten = freelisten;
	}

	
}
