package com.neusoft.vo;

public class AddressVo {
	private String branchname;
	private String radioID;
	public String getBranchname() {
		return branchname;
	}
	public void setBranchname(String branchname) {
		this.branchname = branchname;
	}

	

	public String getRadioID() {
		return radioID;
	}
	public void setRadioID(String radioID) {
		this.radioID = radioID;
	}
	public AddressVo(String branchname,String radioID) {
		this.branchname=branchname;
		this.radioID=radioID;
	}
}
