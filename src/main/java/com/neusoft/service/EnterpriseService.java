package com.neusoft.service;

import java.util.List;

import com.neusoft.po.Address;
import com.neusoft.po.Enterprise;
import com.neusoft.po.FirstPageOfTeachers;
import com.neusoft.po.Swiper;
import com.neusoft.po.Teacher;
import com.neusoft.vo.SingleAddress;
import com.neusoft.vo.SinglePage;
import com.neusoft.vo.SingleTeacher;

public interface EnterpriseService {
	    public Enterprise findEnterpriseByQid(int qid) throws Exception;
		public int updateEnterpriseInfo(Enterprise enterprise) throws Exception;
		public int deleteEnterpriseImgById(Swiper swiper) throws Exception;
		public int addImgToSwiperByQid(Swiper swiper) throws Exception;
		public int deleteEnterpriseVideoByQid(int qid) throws Exception;
		public int updateEnterpriseVideo(Enterprise enterprise) throws Exception;
		public String selectEnterpriseJCZS(int qid) throws Exception;
		public List<Address> selectAddressByQid(int qid) throws Exception;
		public Address viewSingleAddressByQidId(SingleAddress singleAddress) throws Exception;
		public int updateBranchInfoByQidId(Address address) throws Exception;
		public int insertBranchByQid(Address address) throws Exception;
		public int deleteBranchByQidId(SingleAddress singleAddress) throws Exception;
		public List<Teacher> selectTeacherByQid(int qid) throws Exception;
		public Teacher selectSingleTeacherByQidId(SingleTeacher singleTeacher) throws Exception;
		public int deleteTeacherPhotoByQidTId(SingleTeacher singleTeacher) throws Exception;
		public int updateTeacherPhotoByQidTid(Teacher teacher) throws Exception;
		public int updateTeacherInfoByQidTid(Teacher teacher) throws Exception;
		public int insertTeacherByQid(Teacher teacher) throws Exception;
		public int deleteTeacherByQidTid(SingleTeacher singleTeacher) throws Exception;
		public int findAllTeacherByQid(int qid) throws Exception;
		public List<Teacher> selectSingleTeacherPageByQid(SinglePage singlePage) throws Exception;
		public int uploadFirstPageOfTeachers(FirstPageOfTeachers firstPageOfTeachers) throws Exception;
		public FirstPageOfTeachers selectFirstPageOfTeachers(int qid) throws Exception;
		public int deleteFirstPageOfTeachers(int qid) throws Exception;
//		public List<Teacher> selectAllTeachers(int qid) throws Exception;
//		public List<Address> selectAllAddress(int qid) throws Exception;
//		//public List<Address> selectAllAddressWithFreeLessons(int qid) throws Exception;
}
