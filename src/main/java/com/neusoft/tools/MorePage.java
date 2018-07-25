package com.neusoft.tools;

public class MorePage extends Page {
	private  static int  messagePageNum = 3; //每一页显示的数量
	private  static  int messagePageListNum = 5;//底部分页导航显示从1开始
	//默认
	public MorePage(int currentPage,int num){		
	super(messagePageNum,messagePageListNum,currentPage,num);
	}
	//可自定义每页显示的数量和底部导航显示数
	public MorePage(int messagePageNum,int messagePageListNum,int currentPage,int num){		
		super(messagePageNum,messagePageListNum,currentPage,num);
		}	
}
