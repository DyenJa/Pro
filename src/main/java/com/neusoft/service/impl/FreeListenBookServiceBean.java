package com.neusoft.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neusoft.mapper.FreeListenBookMapper;
import com.neusoft.po.FreeListenBook;
import com.neusoft.service.FreeListenBookService;
import com.neusoft.tools.Page;
import com.neusoft.vo.ReservationCondition;
@Service
public class FreeListenBookServiceBean implements FreeListenBookService {
	@Autowired
	FreeListenBookMapper freeMapper;
	@Override
	public List<FreeListenBook> selectFreeListenBooks(Page page, String tel, int qid) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("page", page);
		map.put("tel", tel);
		map.put("qid", qid);
		return freeMapper.getFreeListenBook(map);
	}
	@Override
	public List<FreeListenBook> selectFreeListenBooksByStatus(Page page, String tel, String status, int qid)
			throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("page", page);
		map.put("tel", tel);
		map.put("qid", qid);
		map.put("status", status);
		return freeMapper.getFreeListenBookByStatus(map);
	}
	@Override
	public int selectTotalNumOfFreeListenBook(String tel, int qid) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("qid", qid);
		map.put("tel", tel);
		//System.out.println(tel+"\t"+qid);
		return freeMapper.getTotalNumOfFreeListenBooks(map);
	}
	@Override
	public int selectTotalNumOfFreeListenBookByStatus(String tel, String status, int qid) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("tel", tel);
		map.put("qid", qid);
		map.put("status", status);
		return freeMapper.getTotalNumOfFreeListenBooksByStatus(map);
	}
	@Override
	public int updateFreeListenBook(int id, String status) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("status", status);
		return freeMapper.updateFreeListenBook(map);
	}
	@Override
	public List<FreeListenBook> selectFreeListenBookBeyondTime(String tel, String status, String bookTime, int qid)
			throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("tel",tel);
		
		map.put("status", status);
		System.out.println("...FreeListenBookServiceBean...selectFreeListenBookBeyondTime...status:"+status);		
		
		map.put("bookTime", bookTime);
		map.put("qid", qid);
		return freeMapper.getFreeListenBookBeyondTime(map);
	}
	@Override
	public int insertFreeListenBook(int fid, String tel, String username,  String comment)
			throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fid",fid);
		map.put("username", username);
		map.put("tel", tel);
		map.put("comment", comment);
		
		return freeMapper.insertFreeListenBook(map);
	}
	
	
	/*
	 * 后台
	 */
	/*
	 * (non-Javadoc)
	 * @see com.neusoft.service.ReservationService#findPageByCondition(com.neusoft.vo.ReservationCondition, int)
	 * 通过条件查找一页预约
	 */
	@Override
	public List<FreeListenBook> findPageByCondition(ReservationCondition condition, Page page,int qid)
			throws Exception {
		Map<String, Object> m = new HashMap<String,Object>();
		m.put("condition",condition);
		m.put("page", page);
		m.put("qid", qid);
		return freeMapper.findPageByCondition(m);
	}
	/*
	 * (non-Javadoc)
	 * @see com.neusoft.service.ReservationService#dealReservation(int)
	 * 处理预约
	 */
	@Override
	public void dealReservation(int id) throws Exception {
		freeMapper.dealReservation(id);
	}	
	/*
	 * (non-Javadoc)
	 * 在条件下查找到预约个数
	 * @see com.neusoft.service.ReservationService#findReservationCountByCondition(com.neusoft.vo.ReservationCondition)
	 */
	@Override
	public int findReservationCountByCondition(ReservationCondition condition, int qid) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("qid", qid);
		return freeMapper.findReservationCountByCondition(map);
	}
	/*
	 * (non-Javadoc)
	 * 查找所有预约
	 * @see com.neusoft.service.FreeListenBookService#findAllFreeListenBooks()
	 */
	@Override
	public List<FreeListenBook> findAllFreeListenBooks(int qid) throws Exception {
		List<FreeListenBook> frees = freeMapper.findAllReservation(qid);
		//System.out.println(frees);
		return frees;
	}
}
