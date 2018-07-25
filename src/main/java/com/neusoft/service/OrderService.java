package com.neusoft.service;

import java.util.List;
import java.util.Map;

import com.neusoft.po.Refund;
import com.neusoft.po.Sorder;
import com.neusoft.tools.Page;
import com.neusoft.vo.RatingItem;

public interface OrderService {
	public List<Integer> getTotalPage(int qid, String tel) throws Exception;
	public List<Sorder> selectAllOrders(int qid, String tel, String status, int page) throws Exception;
	public List<Sorder> selectAllOrdersPage(Map<String, Object> map) throws Exception;
	public int selectOrdersCount(Map<String, Object> map) throws Exception;
	public List<Sorder> selectAllOrdersPage_back(Map<String, Object> map) throws Exception;
	public void changeRefundStatus(int oid) throws Exception;
	public void changePaidStatus(int oid) throws Exception;
	public void changePaidToRefunding(int oid) throws Exception;	
	public void changeUnpaidToCanceled(int oid) throws Exception;
	public void changeUnpaidToPaid(int oid) throws Exception;
	public void addRating(int oid, float rating) throws Exception;
	public String getRating(int oid) throws Exception;
	public RatingItem selectUidAndLidByOid(int oid) throws Exception;
	public float getTotal(int oid) throws Exception;
}
