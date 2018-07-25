package com.neusoft.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.neusoft.po.FreeListen;
import com.neusoft.po.Lesson;
import com.neusoft.vo.CourseCategoryVo;
import com.neusoft.vo.CoursePageVo;
import com.neusoft.vo.FreeListenPageVo;
import com.neusoft.vo.TotalCoursePageVo;
import com.neusoft.vo.TotalFreeListenPageVo;
import com.neusoft.po.LessonBranch;

public interface CourseService {
		public List<Lesson> selectAllLessons(TotalCoursePageVo t) throws Exception;
		public List<Lesson> selectBranchLessons(CoursePageVo cpv) throws Exception;//aid分部id
		public List<FreeListen> selectBranchFreeListens(FreeListenPageVo fpv) throws Exception;
		public List<FreeListen> selectAllFreeListens(TotalFreeListenPageVo fpv) throws Exception;
		public List<Lesson> selectLessonsByCategory(CourseCategoryVo ccv) throws Exception;
		public int selectTotalNumOfLessons(int qid) throws Exception;
		public int selectToalNumOfFreeListens(int qid) throws Exception;
		public int selectTotalNumOfBranchLessons(int aid) throws Exception;
		
		
		public List<Lesson> selectReccommendLesson(List<Object[]>lids) throws Exception;
		
		public int selectTotalNumOfBranchFreeListen(int aid) throws Exception;
		
		
		public void saveLesson(Lesson l) throws Exception;
		
		public void saveLessonBranch(LessonBranch lb) throws Exception;
	
		public void updateLesson(Lesson l) throws Exception;
		
		public void updateLessonBranch(LessonBranch lb) throws Exception;
	
		public Lesson getLession(int lid) throws Exception;
	
		
		public void saveFreeListen(FreeListen l) throws Exception;
			
		public void updateFreeListen(FreeListen l) throws Exception;
	
		public FreeListen getFreeListen(int lid) throws Exception;
		
		public void deleteCourse(int lid) throws Exception;
		
		public void deleteFreeListen(int id) throws Exception;
		
		public boolean saveCoursePagesImgs(String path,MultipartFile[] upload,int qid) throws Exception;
}
