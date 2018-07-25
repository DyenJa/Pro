package com.neusoft.tools;

public class TeacherPage extends Page{
	private  static int  messagePageNum = 3; 
	private  static  int messagePageListNum = 5;
	public TeacherPage(int currentPage,int num){		
	super(messagePageNum,messagePageListNum,currentPage,num);
	}
	public TeacherPage(int messagePageNum,int messagePageListNum,int currentPage,int num){		
		super(messagePageNum,messagePageListNum,currentPage,num);
	}	
}
