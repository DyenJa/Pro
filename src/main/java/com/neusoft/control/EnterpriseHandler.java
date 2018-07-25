package com.neusoft.control;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.neusoft.po.Address;
import com.neusoft.po.Enterprise;
import com.neusoft.po.FirstPageOfTeachers;
import com.neusoft.po.Swiper;
import com.neusoft.po.Teacher;
import com.neusoft.service.EnterpriseService;
import com.neusoft.tools.TeacherPage;
import com.neusoft.vo.SingleAddress;
import com.neusoft.vo.SinglePage;
import com.neusoft.vo.SingleTeacher;


@Controller
public class EnterpriseHandler {
	
	@Autowired
	private EnterpriseService enterpriseService;
	
	@RequestMapping(value="/BackEnd/Handler_findEnterpriseByQid")
	public String findEnterpriseByQid(HttpServletRequest request) throws Exception{
		System.out.println("......Handler.......findEnterpriseByQid....");
		HttpSession session = request.getSession();
		int qid = (Integer)session.getAttribute("qid");
		Enterprise list = enterpriseService.findEnterpriseByQid(qid);
		request.setAttribute("list", list);
		String jczs = enterpriseService.selectEnterpriseJCZS(qid);
		request.setAttribute("jczs", jczs);
		System.out.println(jczs);
		String method = request.getParameter("method");
		System.out.println(method);
		if(method=="enterprisemodify" || "enterprisemodify".equals(method)){
			return "forward:/BackEnd_final/BackEnd_final/enterpriseModify.jsp";
		}
		return "forward:/BackEnd_final/BackEnd_final/enterprise.jsp";
	}
	
	@RequestMapping(value="/test/Handler_frontEndFindEnterpriseByQid")
	@ResponseBody
	public Enterprise frontEndFindEnterpriseByQid(HttpServletRequest request) throws Exception{
		System.out.println(".........EnterpriseHandler..........frontEndFindEnterpriseByQid.......");
		HttpSession session = request.getSession();
		int qid = (Integer)session.getAttribute("qid");
		Enterprise list = enterpriseService.findEnterpriseByQid(qid);
		return list;
	}
	
	@RequestMapping(value="/BackEnd/Handler_updateEnterpriseInfo")
	@ResponseBody
	public String updateEnterpriseInfo(String enterprise_name,String enterprise_introduction, String jczs, HttpServletRequest request)throws Exception{
			System.out.println("..............Handler..........updateEnterpriseInfo.......");
			HttpSession session = request.getSession();
			int qid = (Integer)session.getAttribute("qid");
			Enterprise enterprise = new Enterprise();
			enterprise.setQid(qid);
			enterprise.setName(enterprise_name);
			enterprise.setIntroduction(enterprise_introduction);
			//enterprise.setVideopath(videopath);
			enterprise.setJczs(jczs);
			int update = enterpriseService.updateEnterpriseInfo(enterprise);
			if(update>=1){
				return "{\"result\":true}";
			}
		
		return "{\"result\":false}";
	}
	
	@RequestMapping(value="/BackEnd/Handler_deleteEnterpriseImgById")
	@ResponseBody
	public String deleteEnterpriseImgById(int id,HttpServletRequest request) throws Exception{
		System.out.println("...........Handler......deleteEnterpriseImgById.......");
		HttpSession session = request.getSession();
		int qid = (Integer)session.getAttribute("qid");
		Swiper swiper = new Swiper();
		swiper.setId(id);
		swiper.setQid(qid);
		int deltenum = enterpriseService.deleteEnterpriseImgById(swiper);
		if(deltenum>=1){
			return "{\"result\":true}";
		}
		return "{\"result\":false}";
	}
	
	@RequestMapping(value="/BackEnd/Handler_addImgToSwiperByQid")
	@ResponseBody
	public String addImgToSwiperByQid(HttpServletRequest request,@RequestParam("file") MultipartFile file) throws Exception{
		System.out.println("...........Handler.........addImgToSwiperByQid.........");
		HttpSession session = request.getSession();
		int qid = (Integer)session.getAttribute("qid");
//		FileUtils.copyFile(file, new File("/images/"+file.getName()));
		String name = file.getOriginalFilename();
		String path = request.getServletContext().getRealPath("/");
		
		File tempFile = new File(path);
		String ppath = tempFile.getParent(); 
		
		File destFile = new File(ppath+"/uploadImage",name);
		file.transferTo(destFile);
		//int qid = Integer.parseInt(request.getParameter("qid"));
		Swiper swiper = new Swiper();
		swiper.setQid(qid);
		swiper.setImgurl(name);
		swiper.setCategory("A");
		int insertnum = enterpriseService.addImgToSwiperByQid(swiper);		
		return "{\"result\":true}";		
	}
	
	@RequestMapping(value="/BackEnd/Handler_deleteEnterpriseVideoByQid")
	@ResponseBody
	public String deleteEnterpriseVideoByQid(HttpServletRequest request) throws Exception{
		System.out.println("..........EnterpriseHandler...........deleteEnterpriseVideoByQid......");
		HttpSession session = request.getSession();
		int qid = (Integer)session.getAttribute("qid");
		int deletevideonum = enterpriseService.deleteEnterpriseVideoByQid(qid);
		if(deletevideonum>0){
			return "{\"result\":true}";
		}
		return "{\"result\":false}";
	}
	
	@RequestMapping(value="/BackEnd/Handler_updateEnterpriseVideo")
	@ResponseBody
	public String updateEnterpriseVideo(@RequestParam("file") MultipartFile file,HttpServletRequest request) throws Exception{
		System.out.println(".........EnterpriseHandler.........updateEnterpriseVideo.......");
		HttpSession session = request.getSession();
		int qid = (Integer)session.getAttribute("qid");
		String name = file.getOriginalFilename();
//		System.out.println(name);
		String path = request.getServletContext().getRealPath("/");
		
		File tempFile = new File(path);
		String ppath = tempFile.getParent(); 
		
		File destFile = new File(ppath+"/uploadVideo",name);
		file.transferTo(destFile);
		
		Enterprise enterprise = new Enterprise();
		enterprise.setQid(qid);
		System.out.println("qid"+qid);
		enterprise.setVideopath(name);
		
		int updateVideonum = enterpriseService.updateEnterpriseVideo(enterprise);
		if(updateVideonum>0){
			return "{\"result\":true}";
		}
		return "{\"result\":false}";
	}
	
	@RequestMapping(value="/BackEnd/Handler_selectAddressByQid")
	public String selectAddressByQid(HttpServletRequest request) throws Exception{
		System.out.println("........EnterpriseHandler..........selectAddressByQid.........");
		HttpSession session = request.getSession();
		int qid = (Integer)session.getAttribute("qid");
		List<Address> addresslist = enterpriseService.selectAddressByQid(qid);
		request.setAttribute("addresslist", addresslist);
		request.setAttribute("qid", qid);
		return "forward:/BackEnd_final/BackEnd_final/branch.jsp";
	}
	
	@RequestMapping(value="/test/Handler_frontSelectAddressByQid")
	@ResponseBody
	public List<Address> frontSelectAddressByQid(HttpServletRequest request) throws Exception{
		System.out.println("..........EnterpriseHandler.........frontSelectAddressByQid.........");
		HttpSession session = request.getSession();
		int qid = (Integer)session.getAttribute("qid");
		List<Address> addresses = enterpriseService.selectAddressByQid(qid);
		return addresses;
	}
	
	@RequestMapping(value="/BackEnd/Handler_viewSingleAddressByQidId")
	public String viewSingleAddressByQidId(String method,int aid,HttpServletRequest request) throws Exception{
		System.out.println("...........EnterpriseHandler..............viewSingleAddressByQidId.........");
		HttpSession session = request.getSession();
		int qid = (Integer)session.getAttribute("qid");
		SingleAddress singleAddress = new SingleAddress();
		singleAddress.setAid(aid);
		singleAddress.setQid(qid);
		Address address = enterpriseService.viewSingleAddressByQidId(singleAddress);
		request.setAttribute("address", address);
		request.setAttribute("id", aid);
		request.setAttribute("qid", qid);
		request.setAttribute("longitude", address.getLongitude());
		request.setAttribute("latitude", address.getLatitude());
		if("branchModify".equals(method)){
			return "forward:/BackEnd_final/BackEnd_final/branchModify.jsp";
		}
		return "forward:/BackEnd_final/BackEnd_final/branchView.jsp";
	} 
	
	@RequestMapping(value="/test/Handler_frontEndSelectAddressByQidId")
	@ResponseBody
	public Address frontEndSelectAddressByQidId(int aid,HttpServletRequest request) throws Exception{
		System.out.println("........EnterpriseHandler.......frontEndSelectAddressByQidId.....");
		HttpSession session = request.getSession();
		int qid = (Integer)session.getAttribute("qid");
		SingleAddress singleAddress = new SingleAddress();
		singleAddress.setAid(aid);
		singleAddress.setQid(qid);
		Address address = enterpriseService.viewSingleAddressByQidId(singleAddress);
		return address;
	}
	
	@RequestMapping(value="/BackEnd/Handler_updateBranchInfoByQidId")
	@ResponseBody
	public String updateBranchInfoByQidId(int aid,String branch, String address, long tel, Double longitude, Double latitude,HttpServletRequest request) throws Exception{
		System.out.println("..........EnterpriseHandler..........updateBranchInfoByQidId..........");
		HttpSession session = request.getSession();
		int qid = (Integer)session.getAttribute("qid");
		Address address2 = new  Address();
		address2.setAid(aid);
		address2.setQid(qid);
		address2.setBranch(branch);
		address2.setAddress(address);
		address2.setTel(tel);
		address2.setLongitude(longitude);
		address2.setLatitude(latitude);
		int updatenum = enterpriseService.updateBranchInfoByQidId(address2);
		if(updatenum>0){
			return "{\"result\":true}";
		}
		return "{\"result\":false}";
	}
	
	@RequestMapping(value="/BackEnd/Handler_insertBranchByQid")
	@ResponseBody
	public String insertBranchByQid(String branch, String address, Long tel, double longitude, double latitude,HttpServletRequest request) throws Exception{
		System.out.println("............EnterpriseHandler............insertBranchByQid......");
		HttpSession session = request.getSession();
		int qid = (Integer)session.getAttribute("qid");
		Address address2 = new Address();
		address2.setQid(qid);
		address2.setBranch(branch);
		address2.setAddress(address);
		address2.setTel(tel);
		address2.setLongitude(longitude);
		address2.setLatitude(latitude);
		address2.setIsDeleted(0);
		int insertnum = enterpriseService.insertBranchByQid(address2);
		if(insertnum>0){
			return "{\"result\":true}";
		}
		return "{\"result\":false}";
	}
	
	@RequestMapping(value="/BackEnd/Handler_deleteBranchByQidId")
	@ResponseBody
	public String deleteBranchByQidId(int aid,HttpServletRequest request) throws Exception{
		System.out.println(".........EnterpriseHandler...........deleteBranchByQidId..........");
		HttpSession session = request.getSession();
		int qid = (Integer)session.getAttribute("qid");
		SingleAddress singleAddress = new SingleAddress();
		singleAddress.setAid(aid);
		singleAddress.setQid(qid);
		int deletenum = enterpriseService.deleteBranchByQidId(singleAddress);
		if(deletenum>0){
			return "{\"result\":true}";
		}
		return "{\"result\":false}";
	}
	
	@RequestMapping(value="/BackEnd/Handler_selectTeacherByQid")
	public String selectTeacherByQid(int curr, int limit,HttpServletRequest request) throws Exception{
		System.out.println("............EnterpriseHandler.......selectTeacherByQid.........");
		HttpSession session = request.getSession();
		int qid = (Integer)session.getAttribute("qid");
		SinglePage singlePage = new SinglePage();
		singlePage.setQid(qid);
		singlePage.setStartNum((curr-1)*limit+1);
		singlePage.setEndNum(curr*limit);
		List<Teacher> teachers = enterpriseService.selectSingleTeacherPageByQid(singlePage);
		request.setAttribute("teachers", teachers);
		int count = enterpriseService.findAllTeacherByQid(qid);
		request.setAttribute("count", count);
		return "forward:/BackEnd_final/BackEnd_final/teacherView.jsp";		
	}
	
	
	@RequestMapping(value="/BackEnd/Handler_selectTeachersByPage")
	@ResponseBody
	public List<Teacher> selectTeachersByPage(int curr, int limit, HttpServletRequest request) throws Exception{
		System.out.println(".........EnterpriseHandler..........selectTeachersByPage.........");
		HttpSession session = request.getSession();
		int qid = (Integer)session.getAttribute("qid");
		SinglePage singlePage = new SinglePage();
		singlePage.setQid(qid);
		singlePage.setStartNum((curr-1)*limit+1);
		singlePage.setEndNum(curr*limit);
		List<Teacher> teachers = enterpriseService.selectSingleTeacherPageByQid(singlePage);
		request.setAttribute("teachers", teachers);
		int count = enterpriseService.findAllTeacherByQid(qid);
		request.setAttribute("count", count);
		return teachers;
	}
	@RequestMapping(value="/FrontEnd/Handler_selectTeachersByPage")
	@ResponseBody
	public List<Teacher> selectFrontTeachersByPage(int curr, int limit, HttpServletRequest request) throws Exception{
		System.out.println(".........EnterpriseHandler..........selectTeachersByPage.........");
		HttpSession session = request.getSession();
		int qid = (Integer)session.getAttribute("qid");
		SinglePage singlePage = new SinglePage();
		singlePage.setQid(qid);
		singlePage.setStartNum((curr-1)*limit+1);
		singlePage.setEndNum(curr*limit);
		List<Teacher> teachers = enterpriseService.selectSingleTeacherPageByQid(singlePage);
		request.setAttribute("teachers", teachers);
		int count = enterpriseService.findAllTeacherByQid(qid);
		request.setAttribute("count", count);
		return teachers;
	}
	
	@RequestMapping(value="/BackEnd/Handler_findAllTeacherByQid")
	@ResponseBody
	public int findAllTeacherByQid(HttpServletRequest request) throws Exception{
		System.out.println(".........EnterpriseHandler.............findAllTeacherByQid........");
		HttpSession session = request.getSession();
		int qid = (Integer)session.getAttribute("qid");
		int count = enterpriseService.findAllTeacherByQid(qid);
		return count;
	}
	
	@RequestMapping(value="/BackEnd/Handler_selectSingleTeacherByQidId")
	public String selectSingleTeacherByQidId(int tid, HttpServletRequest request) throws Exception{
		System.out.println(".........EnterpriseHandler........selectSingleTeacherByQidId.........");
		HttpSession session = request.getSession();
		int qid = (Integer)session.getAttribute("qid");
		SingleTeacher singleTeacher = new SingleTeacher();
		singleTeacher.setQid(qid);
		singleTeacher.setTid(tid);
		Teacher teacher = enterpriseService.selectSingleTeacherByQidId(singleTeacher);
		request.setAttribute("teacher", teacher);
		return "forward:/BackEnd_final/BackEnd_final/teacherModify.jsp";
	}
	
	@RequestMapping(value="/BackEnd/Handler_deleteTeacherPhotoByQidTId")
	@ResponseBody
	public String deleteTeacherPhotoByQidTId(int tid,HttpServletRequest request) throws Exception{
		System.out.println("..........EnterpriseHandler...........deleteTeacherPhotoByQidTId......");
		HttpSession session = request.getSession();
		int qid = (Integer)session.getAttribute("qid");
		SingleTeacher singleTeacher = new SingleTeacher();
		singleTeacher.setQid(qid);
		singleTeacher.setTid(tid);
		int deletenum = enterpriseService.deleteTeacherPhotoByQidTId(singleTeacher);
		if(deletenum>0){
			return "{\"result\":true}";
		}
		return "{\"result\":false}";
	}
	
	@RequestMapping(value="/BackEnd/Handler_updateTeacherPhotoByQidTid")
	@ResponseBody
	public String updateTeacherPhotoByQidTid(int tid, @RequestParam("file")MultipartFile file, HttpServletRequest request) throws Exception{
		System.out.println(".........EnterpriseHandler.............updateTeacherPhotoByQidTid.........");
		HttpSession session = request.getSession();
		int qid = (Integer)session.getAttribute("qid");
		String name = file.getOriginalFilename();
		String path = request.getServletContext().getRealPath("/");
		
		File tempFile = new File(path);
		String ppath = tempFile.getParent(); 
		
		File destFile = new File(ppath+"/uploadImage",name);
		file.transferTo(destFile);
		
		Teacher teacher = new Teacher();
		teacher.setTphoto(name);
		teacher.setQid(qid);
		teacher.setTid(tid);
		
		int updatenum = enterpriseService.updateTeacherPhotoByQidTid(teacher);
		
		if(updatenum>0){
			return "{\"result\":true}";
		}
		return "{\"result\":false}";
	}
	
	@RequestMapping(value="/BackEnd/Handler_updateTeacherInfoByQidTid")
	@ResponseBody
	public String updateTeacherInfoByQidTid(int tid, String tname, String introduction,HttpServletRequest request) throws Exception{
		System.out.println("............EnterpriseHandler........updateTeacherInfoByQidTid........");
		HttpSession session = request.getSession();
		int qid = (Integer)session.getAttribute("qid");
		Teacher teacher = new Teacher();
		teacher.setQid(qid);
		teacher.setTid(tid);
		teacher.setTname(tname);
		teacher.setIntroduction(introduction);
		int update = enterpriseService.updateTeacherInfoByQidTid(teacher);
		if(update>0){
			return "{\"result\":true}";
		}
		return "{\"result\":false}";
	}
	
	@RequestMapping(value="/BackEnd/Handler_insertTeacherByQid")
	@ResponseBody
	public String insertTeacherByQid(String tname, @RequestParam("file") MultipartFile file,String introduction, HttpServletRequest request) throws Exception{
		System.out.println("........EnterpriseHandler...........insertTeacherByQid..........");
		HttpSession session = request.getSession();
		int qid = (Integer)session.getAttribute("qid");
		String name = file.getOriginalFilename();
		String path = request.getServletContext().getRealPath("/");
		
		File tempFile = new File(path);
		String ppath = tempFile.getParent(); 
		
		File destFile = new File(ppath+"/uploadImage",name);
		file.transferTo(destFile);
		
		Teacher teacher = new Teacher();
		teacher.setQid(qid);
		teacher.setTname(tname);
		teacher.setIntroduction(introduction);
		teacher.setTphoto(name);
		
		int insertnum = enterpriseService.insertTeacherByQid(teacher);
		if(insertnum>0){
			return "{\"result\":true}";
		}
		return "{\"result\":false}";
	}
	
	@RequestMapping(value="/BackEnd/Handler_deleteTeacherByQidTid")
	@ResponseBody
	public String deleteTeacherByQidTid(int tid,HttpServletRequest request)throws Exception{
		System.out.println("..........EnterpriseHandler........deleteTeacherByQidTid......");
		HttpSession session = request.getSession();
		int qid = (Integer)session.getAttribute("qid");
		SingleTeacher singleTeacher = new SingleTeacher();
		singleTeacher.setQid(qid);
		singleTeacher.setTid(tid);
		int deletenum = enterpriseService.deleteTeacherByQidTid(singleTeacher);
		if(deletenum>0){
			return "{\"result\":true}";
		}
		return "{\"result\":false}";
	}
	
	@RequestMapping(value="/BackEnd/Handler_uploadFirstPageOfTeachers")
	@ResponseBody
	public String uploadFirstPageOfTeachers(@RequestParam("file") MultipartFile file, HttpServletRequest request) throws Exception{
		System.out.println(".........EnterpriseHandler.......uploadFirstPageOfTeachers........");
		HttpSession session = request.getSession();
		int qid = (Integer)session.getAttribute("qid");
		String name = file.getOriginalFilename();
		String path = request.getServletContext().getRealPath("/");
		
		File tempFile = new File(path);
		String ppath = tempFile.getParent(); 
		
		File destFile = new File(ppath+"/uploadImage",name);
		file.transferTo(destFile);
		
		FirstPageOfTeachers firstPageOfTeachers = new FirstPageOfTeachers();
		firstPageOfTeachers.setQid(qid);
		firstPageOfTeachers.setImg(name);
		
		int insertNum = enterpriseService.uploadFirstPageOfTeachers(firstPageOfTeachers);
		if(insertNum>0){
			return "{\"result\":true}";
		}
		 return "{\"result\":false}";
	} 
	
	@RequestMapping(value="/BackEnd/Handler_selectFirstPageOfTeachers")
	public String selectFirstPageOfTeachers(HttpServletRequest request) throws Exception{
		System.out.println(".......EnterpriseHandler........selectFirstPageOfTeachers......");
		HttpSession session = request.getSession();
		int qid = (Integer)session.getAttribute("qid");
		FirstPageOfTeachers firstPageOfTeachers = enterpriseService.selectFirstPageOfTeachers(qid);
		request.setAttribute("img", firstPageOfTeachers);
		return "forward:/BackEnd_final/BackEnd_final/firstPageOfTeachers.jsp";	
	}
	
	@RequestMapping(value="/test/Handler_frontPageSelectFirstPageOfTeachers")
	@ResponseBody
	public FirstPageOfTeachers frontPageSelectFirstPageOfTeachers(HttpServletRequest request) throws Exception{
		System.out.println(".......EnterpriseHandler..........frontPageSelectFirstPageOfTeachers...");
		HttpSession session = request.getSession();
		int qid = (Integer)session.getAttribute("qid");
		FirstPageOfTeachers firstPageOfTeachers = enterpriseService.selectFirstPageOfTeachers(qid);
		return firstPageOfTeachers;
	}
	
	@RequestMapping(value="/BackEnd/Handler_deleteFirstPageOfTeachers")
	@ResponseBody
	public String deleteFirstPageOfTeachers(HttpServletRequest request) throws Exception{
		System.out.println("..........EnterpriseHandler..........deleteFirstPageOfTeachers......");
		HttpSession session = request.getSession();
		int qid = (Integer)session.getAttribute("qid");
		int deleteNum = enterpriseService.deleteFirstPageOfTeachers(qid);
		if(deleteNum>0){
			return "{\"result\":true}";
		}
		return "{\"result\":false}";
	}
	
}
