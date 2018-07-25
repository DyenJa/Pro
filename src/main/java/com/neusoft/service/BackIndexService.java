package com.neusoft.service;

import java.util.Map;

public interface BackIndexService {
	
			//查询用户总数
			public Integer selectUserNum(int qid) throws Exception;
			//查询今日预约总数
			public Integer selectTodayBookNum(int qid) throws Exception;
			//查询今日订单总数
			public Integer selectTodayOrderNum(int qid) throws Exception;
			//查询今日点赞总数
			public Integer selectTodayGoodNum(int qid) throws Exception;
			//查询本月流水
			public Double selectMonthProfit(int qid) throws Exception;
			//查询本月朋友圈发布数量
			public Integer selectMonthMessageNum(int qid) throws Exception;
			//查找以上六个数据
			public Map<String,Object> selectSix(int qid) throws Exception;
			
			public int seleceMaxLessonId(int qid) throws Exception;
}
