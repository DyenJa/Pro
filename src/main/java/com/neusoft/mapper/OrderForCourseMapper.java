package com.neusoft.mapper;

import java.util.List;

import com.neusoft.po.Refund;
import com.neusoft.po.Sorder;
import com.neusoft.tools.Page;

public interface OrderForCourseMapper {
		public List<Sorder> getUserOrders(Page page,Long tel ) throws Exception;
		public List<Sorder> getUserOrdersByStatus(Page page,Long tel,String status) throws Exception;
		public List<Refund> getUserRefunds(Page page,Long tel) throws Exception;
		public int getTotalNumOfUserOrders(Long tel) throws Exception;
		public int getTotalNumOfUserOrdersByStatus(Long tel,String status) throws Exception;
		public int getTotalNumOfUserRefunds(Long tel) throws Exception;	

/*
 * 我加的
 */
		
		public void addBuyOrder(Sorder s) throws Exception;
}
