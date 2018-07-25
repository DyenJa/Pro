package com.neusoft.po;
//免费试听课
public class FreeListen {
	private int id;				//免费预约课程
	private String title;		//试听课title
	private String imgUrl;		//图片路径
	private String fdesc;		//富文本
	private String status;		//预约课状态	进行中
	private String pubTime;		//预约课发布时间
	private int branchid;		//分部id
	private Address address;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getFdesc() {
		return fdesc;
	}
	public void setFdesc(String fdesc) {
		this.fdesc = fdesc;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	public String getPubTime() {
		return pubTime;
	}
	public void setPubTime(String pubTime) {
		this.pubTime = pubTime;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public int getBranchid() {
		return branchid;
	}
	public void setBranchid(int branchid) {
		this.branchid = branchid;
	}
	@Override
	public String toString() {
		return "FreeListen [id=" + id + ", title=" + title + ", imgUrl=" + imgUrl + ", fdesc=" + fdesc + ", status="
				+ status + ", pubTime=" + pubTime + ", branchid=" + branchid + ", address=" + address + "]";
	}
	
	
}
