package com.neusoft.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neusoft.mapper.BackIndexMapper;
import com.neusoft.service.BackIndexService;
@Service
public class BackIndexServiceBean implements BackIndexService {
	@Autowired
	private BackIndexMapper backmapper;
	@Override
	public Integer selectUserNum(int qid) throws Exception {
		return backmapper.findUserNum(qid);
	}
	@Override
	public Integer selectTodayBookNum(int qid) throws Exception {
		return backmapper.findTodayBookNum(qid);
	}
	@Override
	public Integer selectTodayOrderNum(int qid) throws Exception {
		return backmapper.findTodayOrderNum(qid);
	}
	@Override
	public Integer selectTodayGoodNum(int qid) throws Exception {
		return backmapper.findTodayGoodNum(qid);
	}
	@Override
	public Double selectMonthProfit(int qid) throws Exception {
		return backmapper.findMonthProfit(qid);
	}
	@Override
	public Integer selectMonthMessageNum(int qid) throws Exception {
		return backmapper.findMonthMessageNum(qid);
	}
	@Override
	public Map<String, Object> selectSix(int qid) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		
		Integer userNumbers=backmapper.findUserNum(qid);
		Integer todayReserv = backmapper.findTodayBookNum(qid);
		Integer todayOrder=backmapper.findTodayOrderNum(qid);
		Integer todayGood=backmapper.findTodayGoodNum(qid);
		Double monthProfit=backmapper.findMonthProfit(qid);
		monthProfit = (monthProfit==null?0:monthProfit);
		Integer monthMessage=backmapper.findMonthMessageNum(qid);
		map.put("userNumbers", userNumbers);
		map.put("todayReserv", todayReserv);
		map.put("todayOrder", todayOrder);
		map.put("todayGood", todayGood);
		map.put("monthProfit", monthProfit);
		map.put("monthMessage", monthMessage);
		return map;
	}
	@Override
	public int seleceMaxLessonId(int qid) throws Exception {
		return backmapper.getMaxLessonId(qid);
	}
}
