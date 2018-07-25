package com.neusoft.tools;

public class FreeListenBackPage extends Page{
	private  static int  freePageNum = 9; //每一页显示的数量
	private  static  int freePageListNum = 9;//底部分页导航显示从1开始
	//默认
	public FreeListenBackPage(int currentPage,int num){		
	super(freePageNum,freePageListNum,currentPage,num);
	}
	//可自定义每页显示的数量和底部导航显示数
	public FreeListenBackPage(int freePageNum,int freePageListNum,int currentPage,int num){		
		super(freePageNum,freePageListNum,currentPage,num);
		display();
	}	
	public void display(){
		System.out.println("...display...");
		System.out.println("...pageNow..."+ this.getCurrentPage());
		System.out.println("...Count..."+ this.getEnd());
		System.out.println("...MaxPage..."+ this.getTotalPage());
		System.out.println("...StartPage..."+ this.getStartPage());
		System.out.println("...EndPage..."+ this.getEndPage());


	}
}
