package com.neusoft.tools;

import com.neusoft.tools.PageReservationTool;

public class PageReservationTool {
	//每一页的记录数量
	public static int itemsOfPage=9;
	//显示出来的页数
	public static int numsOfPage=7;
	//最大页数/总页数
	private int maxPage=1;
	//页面显示的终止页数
	private int endPage=1;
	//页面显示的起始页数
	private int startPage=1;
	//表中的记录总数
	private int count=0;
	//当前的页数
	private int pageNow=1;
	
	
	public static int getItemsOfPage() {
		return itemsOfPage;
	}
	public static void setItemsOfPage(int itemsOfPage) {
		PageReservationTool.itemsOfPage = itemsOfPage;
	}
	public static int getNumsOfPage() {
		return numsOfPage;
	}
	public static void setNumsOfPage(int numsOfPage) {
		PageReservationTool.numsOfPage = numsOfPage;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage() {
		this.maxPage = (count-1)/itemsOfPage+1;
	}
	public int getEndPage() {
		return endPage;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public void setStartEndPage(){
		//pageNow、numsOfPage
		
		startPage = pageNow - numsOfPage/2;
		if(startPage<=1){
			//开始页为1，当前页小于等于4
			startPage=1;
			endPage=maxPage>startPage+numsOfPage-1?startPage+numsOfPage-1:maxPage;
		}else {
			//开始页大于1，当前页大于4
			endPage=pageNow+numsOfPage/2;
			if(endPage>maxPage){
				endPage=maxPage;
				startPage = maxPage-numsOfPage+1>1?maxPage-numsOfPage+1:1;
			}
		}
		/*endPage = pageNow + numsOfPage/2;
		if(endPage>maxPage){
			endPage = maxPage;
		}*/
		
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageNow() {
		return pageNow;
	}
	public void setPageNow(int pageNow) {
		this.pageNow = pageNow>1?pageNow:1;
	}
	
	public PageReservationTool(int pageNow,int count) {
		setCount(count);
		setPageNow(pageNow);
		setMaxPage();
		setStartEndPage();
		
		this.display();
	}
	
	public void display(){
		System.out.println("...display...");
		System.out.println("...pageNow..."+ this.getPageNow());
		System.out.println("...Count..."+ this.getCount());
		System.out.println("...MaxPage..."+ this.getMaxPage());
		System.out.println("...StartPage..."+ this.getStartPage());
		System.out.println("...EndPage..."+ this.getEndPage());


	}
	
	
}
