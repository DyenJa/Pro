package com.neusoft.service;

import java.util.List;

import com.neusoft.po.FreeListenBook;
import com.neusoft.tools.Page;
import com.neusoft.vo.ReservationCondition;

public interface FreeListenBookService {
		/*
		 * 前台，默认在一个企业中进行的操作
		 */
		//查找免费试听课的所有预约
		public List<FreeListenBook> selectFreeListenBooks(Page page,String tel,int qid) throws Exception;
		//通过状态查找预约
		public List<FreeListenBook> selectFreeListenBooksByStatus(Page page,String tel,String status,int qid) throws Exception;
		//更新预约
		public int updateFreeListenBook(int id,String status) throws Exception;
		//找到所有预约的个数
		public int selectTotalNumOfFreeListenBook(String tel,int qid) throws Exception;
		//找到某个状态的预约个数
		public int selectTotalNumOfFreeListenBookByStatus(String tel,String status,int qid) throws Exception; 
		//根据时间找到某一状态下的预约
		public List<FreeListenBook> selectFreeListenBookBeyondTime(String tel,String status,String bookTime,int qid) throws Exception;
		public int insertFreeListenBook(int fid,String tel,String username,String comment) throws Exception;
		/*
		 * 后台
		 */
		
		//找到所有预约
		public List<FreeListenBook> findAllFreeListenBooks(int qid) throws Exception;
		//处理预约
		public void dealReservation(int id) throws Exception;
		//通过条件查找一页预约
		public List<FreeListenBook> findPageByCondition(ReservationCondition condition
				,Page page,int qid) throws Exception;
		//通过条件查找预约数量
		public int findReservationCountByCondition(ReservationCondition condition,int qid) throws Exception;
}
