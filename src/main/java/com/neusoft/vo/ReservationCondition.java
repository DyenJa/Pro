package com.neusoft.vo;

public class ReservationCondition {
	Integer fid;		//试听课id
	String nickName;	//用户昵称
	String status;		//预约状态
	String startDate;	//起始日期
	String endDate;		//结束日期
	public Integer getFid() {
		return fid;
	}
	public void setFid(Integer fid) {
		this.fid = fid;
	}
	

	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public void display() {
		System.out.println("ReservationCondition [fid=" + fid + ", nickName=" + nickName + ", status=" + status + ", startDate="
				+ startDate + ", endDate=" + endDate + "]");
	}
	
}
