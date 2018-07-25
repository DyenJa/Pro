package com.neusoft.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neusoft.mapper.EnterpriseForCourseMapper;
import com.neusoft.po.Address;
import com.neusoft.po.Enterprise;
import com.neusoft.po.FirstPageOfTeachers;
import com.neusoft.po.Swiper;
import com.neusoft.po.Teacher;
import com.neusoft.service.EnterpriseServiceForCourse;


@Service
public class EnterpriseServiceForCourseBean implements EnterpriseServiceForCourse {
	
	@Autowired
	private EnterpriseForCourseMapper enterpriseMapper;

	@Override
	public Enterprise selectEnterpriseInfoById(int qid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Teacher> selectAllTeachers(int qid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	

	
	@Override
	public List<Address> selectAllAddress(int qid) throws Exception {
		List<Address> branchlist;
		try {
			branchlist=enterpriseMapper.getAllAddresses(qid);
		}
		catch(Exception e) {
			e.printStackTrace();
			branchlist=null;
		}
		for(Address a:branchlist) {
			System.out.println(a.getBranch()+"**");
		}
		return branchlist;
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public int getBranchIdByBranchName(String branchname) throws Exception {
		int bid=0;
		try {
			bid = enterpriseMapper.getBranchIdByBranchName(branchname);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			bid = 0;
			e.printStackTrace();
		}
		return bid;
	}

	@Override
	public int getqidByBranchName(String branchname) throws Exception {
		int qid=0;
		try {
			qid = enterpriseMapper.getqidByBranchName(branchname);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			qid = 0;
			e.printStackTrace();
		}

		
		return qid;
	}

	@Override
	public int getBranchidBylid(int lid) throws Exception {
		int id=0;
		try {
			id = enterpriseMapper.getBranchidBylid(lid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}

	@Override
	public String getBranchNameBylid(int lid) throws Exception {
		String name=null;
		try {
			name = enterpriseMapper.getBranchNameBylid(lid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return name;
	}

	@Override
	public String getBranchNameByBranchID(int branchid) throws Exception {
		// TODO Auto-generated method stub
		String name=null;
		try {
			name = enterpriseMapper.getBranchNameByBranchID(branchid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return name;
	}
	
	
	@Override
	public Address getAddressBylid(int lid) throws Exception{
		Address addr=enterpriseMapper.getAddressBylid(lid);
		return addr;
	}

	@Override
	public List<Swiper> getSwipers(Swiper s) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(s.getCategory()+"+++++++++++++++++++++++");
		return enterpriseMapper.getSwiperByCategory(s);
	}
	

}
