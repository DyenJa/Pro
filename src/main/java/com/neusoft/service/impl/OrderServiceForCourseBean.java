package com.neusoft.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neusoft.mapper.OrderForCourseMapper;
import com.neusoft.po.Refund;
import com.neusoft.po.Sorder;
import com.neusoft.service.OrderServiceForCourse;
import com.neusoft.tools.Page;


@Service
public class OrderServiceForCourseBean implements OrderServiceForCourse {

	
	@Autowired
	private OrderForCourseMapper om;
	
	@Override
	public List<Sorder> selectUserOrders(Page page, Long tel) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Sorder> selectUserOrdersByStatus(Page page, Long tel, String status) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Refund> selectUserRefunds(Page page, Long tel) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectTotalNumOfUserOrders(Long tel) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectTotalNumOfUserOrdersByStatus(Long tel, String status) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectTotalNumOfUserRefunds(Long tel) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
	
	
	
	
	


	@Override
	public void saveOrder(Sorder s) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(s.getOrderTime()+"*******");
		om.addBuyOrder(s);
	}

}
