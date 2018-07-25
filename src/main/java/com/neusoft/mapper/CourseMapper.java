package com.neusoft.mapper;

import java.util.List;
import java.util.Map;

import com.neusoft.po.FreeListen;
import com.neusoft.po.Lesson;
import com.neusoft.tools.Page;
import com.neusoft.vo.CourseCategoryVo;
import com.neusoft.vo.CoursePageVo;
import com.neusoft.vo.FreeListenPageVo;
import com.neusoft.vo.TotalCoursePageVo;
import com.neusoft.vo.TotalFreeListenPageVo;
import com.neusoft.po.LessonBranch;
import com.neusoft.po.Swiper;

public interface CourseMapper {
		public List<Lesson> getLessons(TotalCoursePageVo t) throws Exception;
		public List<Lesson> getLessonsByBranchid(CoursePageVo cpv) throws Exception;	//完成	【注意】我删除了所有参数 用一个vo替代
		//完成 获得所有的免费预约课    【注意】我删除了所有参数 用一个vo替代
		public List<FreeListen> getFreeListens(TotalFreeListenPageVo fpv)throws Exception;//aid:分布id
		public List<FreeListen> getFreeListensByBranch(FreeListenPageVo fpv)throws Exception;//aid:分布id
		public List<Lesson> getLessonsByCategory(CourseCategoryVo ccv) throws Exception;
		public int getTotalNumOfLessons(int qid) throws Exception;
		public int getTotalNumOfFreeListens(int qid) throws Exception;
		public int getTotalNumOdBranchLessons(int aid) throws Exception;			//得到某个部门所有课程
		
		public int addCourseImg(Map<String,Object> map) throws Exception;
		//上传课程
		public void addLesson(Lesson l) throws Exception; 
		
		//上传课程与分部关系
		public void addLessonBranch(LessonBranch lb) throws Exception;
		
		public void updateLesson(Lesson l) throws Exception; 
		
		//上传课程与分部关系
		public void updateLessonBranch(LessonBranch lb) throws Exception;
		
		//查询课程
		public Lesson getLesson(int lid) throws Exception;
		
		public int getTotalNumOdBranchFreeListen(int aid) throws Exception;
		//查询免费课程
		public void addFreeListen(FreeListen l) throws Exception; 
		
		//修改免费课程
		public void updateFreeListen(FreeListen l) throws Exception; 
		
		//查询免费课程
		public FreeListen getFreeListen(int id) throws Exception;
		
		public void deleteCourse(int lid) throws Exception;
		
		public void deleteFreeListen(int id) throws Exception;
		
	
}
