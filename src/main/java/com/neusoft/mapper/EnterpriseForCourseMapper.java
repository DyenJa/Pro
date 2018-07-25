package com.neusoft.mapper;

import java.util.List;

import com.neusoft.po.Address;
import com.neusoft.po.Enterprise;
import com.neusoft.po.FirstPageOfTeachers;
import com.neusoft.po.Swiper;
import com.neusoft.po.Teacher;


public interface EnterpriseForCourseMapper {
		public Enterprise getEnterpriseById(int qid) throws Exception;
		public List<Teacher> getAllTeachers(int qid) throws Exception;
		
		
		
		//公有  查询某个公司下所有的分部
		public List<Address> getAllAddresses(int qid) throws Exception;
		//public List<Address> getAllAddressWithFreeLessons() throws Exception;
		
		
		
		
		//通过分部名称查询企业ID
		public int getBranchIdByBranchName(String branchname) throws Exception;
		
		//通过分部名称查询分部自己的表id
		public int getqidByBranchName(String branchname) throws Exception;
		
		//通过课程id查询分部id  涉及到两个表
		public int getBranchidBylid(int lid) throws Exception;
		
		//哦通过课程id查询分部名称  设计三个表
		public String getBranchNameBylid(int lid) throws Exception;
		
		//通过分部ID得到分部名字
		public String getBranchNameByBranchID(int branchid) throws Exception;
		
		
		public Address getAddressBylid(int lid) throws Exception;
		
		
		
		public List<Swiper> getSwiperByCategory(Swiper s) throws Exception;
		


		
}
