package com.neusoft.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neusoft.mapper.OrderMapper;
import com.neusoft.po.Refund;
import com.neusoft.po.Sorder;
import com.neusoft.service.OrderService;
import com.neusoft.tools.MorePage;
import com.neusoft.tools.Page;
import com.neusoft.vo.RatingItem;

@Service
public class OrderServiceBean implements OrderService {
	
	@Autowired
	private OrderMapper orderMapper;
	
	@Override
	public List<Sorder> selectAllOrders(int qid, String tel, String status, int page) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		int count = 0;
		Page pageUtil;
		map.put("qid", qid);
		map.put("tel", tel);
		map.put("status", status);
		if(status == "取消和退款") {
			map.put("status", "已退款");
			count += selectOrdersCount(map);
			map.put("status", "退款中");
			count += selectOrdersCount(map);
			map.put("status", "已取消");
			count += selectOrdersCount(map);
			map.put("status", "取消和退款");
			System.out.println(count);
			pageUtil = new MorePage(3,5,page,count);
		}
		else {
			pageUtil = new MorePage(3,5,page,selectOrdersCount(map));
		}
		map.put("page", pageUtil);
		List<Sorder> orders = orderMapper.getOrders(map);
		return orders;
	}

	@Override
	public List<Sorder> selectAllOrdersPage(Map<String, Object> map) throws Exception {
		int count = orderMapper.getOrdersCount(map);
		Page page = new MorePage(3,5,(int) map.get("currentPage"),count);
		map.put("page", page);
		List<Sorder> orders = orderMapper.getOrdersPage(map);
		return orders;
	}
	

	@Override
	public List<Sorder> selectAllOrdersPage_back(Map<String, Object> map) throws Exception {
		int count = orderMapper.getOrdersCount(map);
		Page page = new MorePage(10,5,(int) map.get("currentPage"),count);
		map.put("page", page);
		List<Sorder> orders = orderMapper.getOrdersPage(map);
		return orders;
	}

	@Override
	public int selectOrdersCount(Map<String, Object> map) throws Exception {
		int count = orderMapper.getOrdersCount(map);
		return count;
	}

	@Override
	public void changeRefundStatus(int oid) throws Exception{
		orderMapper.changeRefundStatus(oid);
	}

	@Override
	public void changePaidStatus(int oid) throws Exception {
		orderMapper.changePaidStatus(oid);
	}

	@Override
	public void changePaidToRefunding(int oid) throws Exception {
		orderMapper.changePaidToRefunding(oid);
	}

	@Override
	public void changeUnpaidToCanceled(int oid) throws Exception {
		orderMapper.changeUnpaidToCanceled(oid);
	}

	@Override
	public void changeUnpaidToPaid(int oid) throws Exception {
		orderMapper.changeUnpaidToPaid(oid);
	}
	
	@Override
	public List<Integer> getTotalPage(int qid, String tel) throws Exception {
		System.out.println("getTotalPage()-----");
		List<Integer> pages = new ArrayList<Integer>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qid", qid);
		map.put("tel", tel);
		// 全部订单
		Page page_all = new MorePage(1,selectOrdersCount(map));
		System.out.println("all_count: "+selectOrdersCount(map));
		pages.add(page_all.getTotalPage());
		// 待付款订单
		map.put("status", "待付款");
		Page page_unpaid = new MorePage(1,selectOrdersCount(map));
		pages.add(page_unpaid.getTotalPage());
		// 已付款订单
		map.put("status", "已付款");
		Page page_paid = new MorePage(1,selectOrdersCount(map));
		pages.add(page_paid.getTotalPage());
		// 已使用订单
		map.put("status", "已使用");
		Page page_used = new MorePage(1,selectOrdersCount(map));
		pages.add(page_used.getTotalPage());
		// 退款和已取消订单
		int count = 0;
		map.put("status", "已退款");
		count += selectOrdersCount(map);
		map.put("status", "退款中");
		count += selectOrdersCount(map);
		map.put("status", "已取消");
		count += selectOrdersCount(map);
		Page page_refund = new MorePage(1,count);
		pages.add(page_refund.getTotalPage());

		return pages;
	}

	@Override
	public void addRating(int oid, float rating) throws Exception {
		System.out.println("----orderServiceBean----addRating()----");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("oid", oid);
		map.put("rating", rating);
		orderMapper.addRating(map);
	}

	@Override
	public String getRating(int oid) {
		String rating = null;
		try {
			rating = String.valueOf(orderMapper.getRating(oid));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rating;
	}

	@Override
	public RatingItem selectUidAndLidByOid(int oid) throws Exception {
		System.out.println("----orderServiceBean----selectUidAndLidByOid()----");
		return orderMapper.getUidAndLidByOid(oid);
	}

	@Override
	public float getTotal(int oid) throws Exception {
		return orderMapper.getTotal(oid);
	}
}
