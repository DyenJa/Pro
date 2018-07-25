package com.neusoft.mapper;

import java.util.List;
import java.util.Map;

import com.neusoft.po.Refund;
import com.neusoft.po.Sorder;
import com.neusoft.tools.Page;
import com.neusoft.vo.RatingItem;

public interface OrderMapper {
		public List<Sorder> getOrders(Map<String, Object> map) throws Exception;
		public List<Sorder> getOrdersPage(Map<String, Object> map) throws Exception;
		public int getOrdersCount(Map<String, Object> map) throws Exception;
		public void changeRefundStatus(int oid) throws Exception;
		public void changePaidStatus(int oid) throws Exception;	
		public void changePaidToRefunding(int oid) throws Exception;
		public void changeUnpaidToCanceled(int oid) throws Exception;
		public void changeUnpaidToPaid(int oid) throws Exception;
		public void addRating(Map<String, Object> map) throws Exception;
		public float getRating(int oid) throws Exception;
		public float getTotal(int oid) throws Exception;
		public RatingItem getUidAndLidByOid(int oid) throws Exception;
}
