package com.neusoft.mapper;

public interface BackIndexMapper {
		//查询用户总数
		public Integer findUserNum(int qid) throws Exception;
		//查询今日预约总数
		public Integer findTodayBookNum(int qid) throws Exception;
		//查询今日订单总数
		public Integer findTodayOrderNum(int qid) throws Exception;
		//查询今日点赞总数
		public Integer findTodayGoodNum(int qid) throws Exception;
		//查询本月流水
		public Double findMonthProfit(int qid) throws Exception;
		//查询本月朋友圈发布数量
		public Integer findMonthMessageNum(int qid) throws Exception;
		
		public int getMaxLessonId(int qid) throws Exception;
}
