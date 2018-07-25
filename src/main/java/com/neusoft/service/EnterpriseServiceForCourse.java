package com.neusoft.service;

import java.util.List;

import com.neusoft.po.Address;
import com.neusoft.po.Enterprise;
import com.neusoft.po.FirstPageOfTeachers;
import com.neusoft.po.Swiper;
import com.neusoft.po.Teacher;


public interface EnterpriseServiceForCourse {
		public Enterprise selectEnterpriseInfoById(int qid) throws Exception;
		public List<Teacher> selectAllTeachers(int qid) throws Exception;
		
		
		
		
		
		
		
		
		public List<Address> selectAllAddress(int qid) throws Exception;
		//public List<Address> selectAllAddressWithFreeLessons(int qid) throws Exception;
		
		
		
		
		
		
		
		
		
		
		
		
	
		

		
		public int getBranchIdByBranchName(String branchname) throws Exception;
		
		public int getqidByBranchName(String branchname) throws Exception;

		public int getBranchidBylid(int lid) throws Exception;
		
		public String getBranchNameBylid(int lid) throws Exception;
		
		public String getBranchNameByBranchID(int branchid) throws Exception;
		
		public Address getAddressBylid(int lid) throws Exception;
		
		public List<Swiper> getSwipers(Swiper s) throws Exception;
		
		
		
		
		
		


}
