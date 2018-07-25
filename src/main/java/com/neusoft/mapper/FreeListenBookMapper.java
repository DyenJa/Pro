package com.neusoft.mapper;

import java.util.List;
import java.util.Map;

import com.neusoft.po.FreeListenBook;
	
public interface FreeListenBookMapper {
	
		/*
		 * 前台
		 */
		//获得预约的订单map:starRow,messagePageNum,tel,qid
		//Page,tel,qid
		public List<FreeListenBook> getFreeListenBook(Map<String,Object> map) throws Exception;
		//Page page,Long String,String status,int qid
		public List<FreeListenBook> getFreeListenBookByStatus(Map<String, Object> map) throws Exception;
		//int id,String status,
		public int updateFreeListenBook(Map<String, Object> map) throws Exception;
		//String tel,int qid
		public int getTotalNumOfFreeListenBooks(Map<String, Object> map) throws Exception;
		//String tel,int qid,String status
		public int getTotalNumOfFreeListenBooksByStatus(Map<String, Object> map) throws Exception;
		//tel ,qid ,status ,bookTime
		public List<FreeListenBook> getFreeListenBookBeyondTime(Map<String,Object> map) throws Exception;
		public int insertFreeListenBook(Map<String,Object> map) throws Exception;
		/*
		 * 后台
		 */
		//找到某企业所有预约
		public List<FreeListenBook> findAllReservation(int qid) throws Exception;
		//处理订单
		public int dealReservation(int id) throws Exception;
		//通过条件查找某企业订单总数map中包括condition和qid
		public int findReservationCountByCondition(Map<String, Object> map) throws Exception;
		//根据条件查找某企业第几页的订单map中包括condition,page,qid
		public List<FreeListenBook> findPageByCondition(Map<String,Object> map) throws Exception;
		
		
}
