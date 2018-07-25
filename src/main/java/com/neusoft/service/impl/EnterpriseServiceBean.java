package com.neusoft.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neusoft.mapper.EnterpriseMapper;
import com.neusoft.po.Enterprise;
import com.neusoft.po.FirstPageOfTeachers;
import com.neusoft.po.Swiper;
import com.neusoft.po.Teacher;
import com.neusoft.po.Address;
import com.neusoft.service.EnterpriseService;
import com.neusoft.vo.SingleAddress;
import com.neusoft.vo.SinglePage;
import com.neusoft.vo.SingleTeacher;

@Service
public class EnterpriseServiceBean implements EnterpriseService {
	 
	@Autowired
	private EnterpriseMapper enterpriseMapper;
	
	@Override
	public Enterprise findEnterpriseByQid(int qid) throws Exception {
		System.out.println(".....EnterpriseServiceBean....findEnterpriseByQid....");
		Enterprise list = null;
		list = enterpriseMapper.findEnterpriseByQid(qid);
		return list;
	}

	@Override
	public int updateEnterpriseInfo(Enterprise enterprise) throws Exception {
		System.out.println(".........EnterpriseServiceBean..........updateEnterpriseInfo......");
		int updateNumber = enterpriseMapper.updateEnterpriseInfo(enterprise);
		return updateNumber;
	}

	@Override
	public int deleteEnterpriseImgById(Swiper swiper) throws Exception {
		System.out.println("............EnterpriseServiceBean..........deleteEnterpriseImgById........");
		int deletenum = enterpriseMapper.deleteEnterpriseImgById(swiper);
		return deletenum;
	}

	@Override
	public int addImgToSwiperByQid(Swiper swiper) throws Exception{
		System.out.println(".........EnterpriseServiceBean...........addImgToSwiperByQid.........");
		int insertnum = enterpriseMapper.addImgToSwiperByQid(swiper);
		return insertnum;
	}

	@Override
	public int deleteEnterpriseVideoByQid(int qid) throws Exception {
		System.out.println("..........EnterpriseServiceBean..........deleteEnterpriseVideoByQid....");
		int deltevideonum = enterpriseMapper.deleteEnterpriseVideoByQid(qid);
		return deltevideonum;
	}

	@Override
	public int updateEnterpriseVideo(Enterprise enterprise) throws Exception {
		System.out.println("...........EnterpriseServiceBean........updateEnterpriseVideo.......");
		int updatevideonum = enterpriseMapper.updateEnterpriseVideo(enterprise);
		return updatevideonum;
	}

	@Override
	public String selectEnterpriseJCZS(int qid) throws Exception {
		System.out.println("..........EnterpriseServiceBean........selectEnterpriseJCZS........");
		String jczs = enterpriseMapper.selectEnterpriseJCZS(qid);		
		return jczs;
	}

	@Override
	public List<Address> selectAddressByQid(int qid) throws Exception {
		System.out.println("...........EnterpriseServiceBean..........selectAddressByQid......");
		List<Address> list = enterpriseMapper.selectAddressByQid(qid);
		return list;
	}

	@Override
	public Address viewSingleAddressByQidId(SingleAddress singleAddress) throws Exception {
		System.out.println("............EnterpriseServiceBean...........viewSingleAddressByQidId.....");
		Address address = enterpriseMapper.viewSingleAddressByQidId(singleAddress);
		return address;
	}

	@Override
	public int updateBranchInfoByQidId(Address address) throws Exception {
		System.out.println("...........EnterpriseServiceBean...........updateBranchInfoByQidId...........");
		int updateBranchNum = enterpriseMapper.updateBranchInfoByQidId(address);
		return updateBranchNum;
	}

	@Override
	public int insertBranchByQid(Address address) throws Exception {
		System.out.println(".............EnterpriseServiceBean..........insertBranchByQid.......");
		int insertBranchNum = enterpriseMapper.insertBranchByQid(address);
		return insertBranchNum;
	}

	@Override
	public int deleteBranchByQidId(SingleAddress singleAddress) throws Exception {
		System.out.println(".............EnterpriseServiceBean..........deleteBranchByQidId........");
		int deletenum = enterpriseMapper.deleteBranchByQidId(singleAddress);
		return deletenum;
	}

	@Override
	public List<Teacher> selectTeacherByQid(int qid) throws Exception {
		System.out.println("..............EnterpriseServiceBean............selectTeacherByQid..........");
		List<Teacher> teachers = enterpriseMapper.selectTeacherByQid(qid);
		return teachers;
	}

	@Override
	public Teacher selectSingleTeacherByQidId(SingleTeacher singleTeacher) throws Exception {
		System.out.println("..........EnterpriseServiceBean...........selectSingleTeacherByQidId..........");		
		Teacher teacher = enterpriseMapper.selectSingleTeacherByQidId(singleTeacher);
		return teacher;
	}

	@Override
	public int deleteTeacherPhotoByQidTId(SingleTeacher singleTeacher) throws Exception {
		System.out.println("...............EnterpriseServiceBean............deleteTeacherPhotoByQidTId..........");
		int deletenum = enterpriseMapper.deleteTeacherPhotoByQidTId(singleTeacher);
		return deletenum;
	}

	@Override
	public int updateTeacherPhotoByQidTid(Teacher teacher) throws Exception {
		System.out.println("...........EnterpriseServiceBean.............updateTeacherPhotoByQidTid......");
		int updatenum = enterpriseMapper.updateTeacherPhotoByQidTid(teacher);
		return updatenum;
	}

	@Override
	public int updateTeacherInfoByQidTid(Teacher teacher) throws Exception {
		System.out.println("...........EnterpriseServiceBean...........updateTeacherInfoByQidTid.......");
		int update = enterpriseMapper.updateTeacherInfoByQidTid(teacher);
		return update;
	}

	@Override
	public int insertTeacherByQid(Teacher teacher) throws Exception {
		System.out.println("........EnterpriseServiceBean..........insertTeacherByQid..........");
		int insertnum = enterpriseMapper.insertTeacherByQid(teacher);
		return insertnum;
	}

	@Override
	public int deleteTeacherByQidTid(SingleTeacher singleTeacher) throws Exception {
		System.out.println(".........EnterpriseServiceBean..........deleteTeacherByQidTid........");
		int deletenum = enterpriseMapper.deleteTeacherByQidTid(singleTeacher);
		return deletenum;
	}

	@Override
	public int findAllTeacherByQid(int qid) throws Exception {
		System.out.println(".....EnterpriseServiceBean........findAllTeacherByQid........");
		int count = enterpriseMapper.findAllTeacherByQid(qid);
		return count;
	}

	@Override
	public List<Teacher> selectSingleTeacherPageByQid(SinglePage singlePage) throws Exception {
		System.out.println(".........EnterpriseServiceBean.............selectSingleTeacherPageByQid.....");
		List<Teacher> list = enterpriseMapper.selectSingleTeacherPageByQid(singlePage);
		return list;
	}

	@Override
	public int uploadFirstPageOfTeachers(FirstPageOfTeachers firstPageOfTeachers) throws Exception {
		System.out.println("............EnterpriseServiceBean..........uploadFirstPageOfTeachers..........");
		int insertNum = enterpriseMapper.uploadFirstPageOfTeachers(firstPageOfTeachers);
		return insertNum;
	}

	@Override
	public FirstPageOfTeachers selectFirstPageOfTeachers(int qid) throws Exception {
		System.out.println("...........EnterpriseServiceBean..........selectFirstPageOfTeachers........");
		FirstPageOfTeachers firstPageOfTeachers = enterpriseMapper.selectFirstPageOfTeachers(qid);
		return firstPageOfTeachers;
	}

	@Override
	public int deleteFirstPageOfTeachers(int qid) throws Exception {
		System.out.println("........EnterpriseServiceBean.......deleteFirstPageOfTeachers.........");
		int deleteNum = enterpriseMapper.deleteFirstPageOfTeachers(qid);
		return deleteNum;
	}
}
