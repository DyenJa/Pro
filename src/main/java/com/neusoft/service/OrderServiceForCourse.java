package com.neusoft.service;

import java.util.List;

import com.neusoft.po.Refund;
import com.neusoft.po.Sorder;
import com.neusoft.tools.Page;

public interface OrderServiceForCourse {
	public List<Sorder> selectUserOrders(Page page,Long tel ) throws Exception;
	public List<Sorder> selectUserOrdersByStatus(Page page,Long tel,String status) throws Exception;
	public List<Refund> selectUserRefunds(Page page,Long tel) throws Exception;
	public int selectTotalNumOfUserOrders(Long tel) throws Exception;
	public int selectTotalNumOfUserOrdersByStatus(Long tel,String status) throws Exception;
	public int selectTotalNumOfUserRefunds(Long tel) throws Exception;	
	
	
	
	/*
	 * 我加的
	 */
	public void saveOrder(Sorder s) throws Exception;
}
