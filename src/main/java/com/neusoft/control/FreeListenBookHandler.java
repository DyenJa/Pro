package com.neusoft.control;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.neusoft.po.FreeListenBook;
import com.neusoft.service.FreeListenBookService;
import com.neusoft.tools.FreeListenBackPage;
import com.neusoft.tools.FreeListenPage;
import com.neusoft.tools.Page;
import com.neusoft.vo.ReservationCondition;

@Controller
public class FreeListenBookHandler {
	@Autowired
	private FreeListenBookService free_serv;
	//int qid=1;

	/*
	 * 
	 * 前端
	 */
	//找到所有的企业预约
	@RequestMapping(value="/freeListenBook/findAll")
	@ResponseBody
	public List<FreeListenBook> findAllFreeListenBook(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		int qid = (int) session.getAttribute("qid");
		return free_serv.findAllFreeListenBooks(qid);
	}
	//找到个人的全部预约
	@RequestMapping(value="/freeListenBook/findPersonAll")
	@ResponseBody
	public List<FreeListenBook> findPersonFreeListenBook(Integer currentPage,HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		int qid = (int) session.getAttribute("qid");
		String tel = (String) session.getAttribute("tel");
		currentPage= currentPage== null?1:currentPage;
		int count = free_serv.selectTotalNumOfFreeListenBook(tel, qid);
		Page page = new FreeListenPage(currentPage, count);
		return free_serv.selectFreeListenBooks(page, tel, qid);
	}
	//通过状态找到个人的预约
	@RequestMapping(value="/freeListenBook/findPersonByStatus")
	@ResponseBody
	public List<FreeListenBook> findPersonByStatus(Integer currentPage,String status,HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		int qid = (int) session.getAttribute("qid");
		String tel = (String) session.getAttribute("tel");
		currentPage= currentPage== null?1:currentPage;
		int count = free_serv.selectTotalNumOfFreeListenBookByStatus(tel, status, qid);
		Page page = new FreeListenPage(currentPage, count);
		return free_serv.selectFreeListenBooksByStatus(page, tel, status, qid);
	}
	//找到 个人预约的页数数量{全部、待处理、已处理}
	@RequestMapping(value="/freeListenBook/findCountPageThree")
	@ResponseBody
	public List<Integer> findCountPageThree(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		int qid = (int) session.getAttribute("qid");
		String tel = (String) session.getAttribute("tel");
		int count1 = free_serv.selectTotalNumOfFreeListenBook(tel, qid);
		int count2= free_serv.selectTotalNumOfFreeListenBookByStatus(tel, "待处理", qid);
		int count3= free_serv.selectTotalNumOfFreeListenBookByStatus(tel, "已处理", qid);
		int page1 = new FreeListenPage(1, count1).getTotalPage();
		int page2 = new FreeListenPage(1, count2).getTotalPage();
		int page3 = new FreeListenPage(1, count3).getTotalPage();
		List<Integer> pageNums = new ArrayList<Integer>();
		pageNums.add(page1);
		pageNums.add(page2);
		pageNums.add(page3);
		return pageNums;
	}
	
	//根据时间找到某一状态下的预约
	@RequestMapping(value="/freeListenBook/pullUpRefresh")
	@ResponseBody
	public List<FreeListenBook> findFreeListenBookBeyondTime(String status,String bookTime,HttpServletRequest request) throws Exception{
		//System.out.println(bookTime);
		HttpSession session = request.getSession();
		int qid = (int) session.getAttribute("qid");
		String tel = (String) session.getAttribute("tel");
		return free_serv.selectFreeListenBookBeyondTime(tel, status, bookTime, qid);
	}
	
	
	
	
	
	
	/*
	 * 
	 * 后台
	 */
	
	/*
	 * 通过条件和分页查找预约
	 */
	@RequestMapping(value="/BackEnd/reserve/findPageByCondition")
	@ResponseBody
	public Map<String,Object> findPageByCondition(ReservationCondition condition,
			Integer page,Integer limit,HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		int qid = (int) session.getAttribute("qid");
		System.out.println(".....FreeListenBookHandler.....findPageByCondition.");
		
		//HttpSession session = request.getSession();
		//int qid = (Integer)session.getAttribute("qid");
		condition.display();
		page = page==null?1:page;
		limit= limit==null?10:limit;
		List<FreeListenBook> pageFrees;
		//通过条件获得预约总数量
		int count = free_serv.findReservationCountByCondition(condition,qid);
		System.out.println("count "+count);
		//创建工具类，将其放在request中
		Page pa= new FreeListenBackPage(limit,10,page,count);
		//request.setAttribute("page", pa);
		
		pageFrees = free_serv.findPageByCondition(condition, pa,qid);
		//request.setAttribute("pageFrees", pageFrees);
		JSONArray array = JSONArray.parseArray(JSON.toJSONString(pageFrees));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", array);
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", count);
		return map;
	}
	/*
	 * 处理预约
	 */
	@RequestMapping(value="BackEnd/reserve/dealReservation")
	@ResponseBody
	public Map<String,Object> dealReservation(int id) throws Exception{
		
		//System.out.println("condition"+condition);
		//System.out.println(condition.getNickName());
		int state=0;
		Map<String, Object> map = new HashMap<String, Object>();
		try{
			free_serv.dealReservation(id);
			state=1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		map.put("state", state);
		return map;
	}
	@RequestMapping(value="/freeListenBook/addFreeListenBook")
	@ResponseBody
	public Map<String, Object> addReserve(String comment,String tel,String name,int fid) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		boolean msg=false;
		int result = free_serv.insertFreeListenBook(fid, tel, name, comment);
		if(result>0){
			msg=true;
		}
		map.put("msg", msg);			
		
		return map;
	}
	
	/*
	 * session中已有条件，查找某一页预约
	 */
	/*@RequestMapping(value="/reserve/findPageHavingCondition")
	public String findPageHavingCondition(Integer currentPage,HttpServletRequest request) throws Exception{
		HttpSession session=request.getSession();
		ReservationCondition condition = (ReservationCondition)session.getAttribute("condition");
		System.out.println(".....FreeListenBookHandler.....findPageHavingCondition.");
		
		//HttpSession session = request.getSession();
		//int qid = (Integer)session.getAttribute("qid");
		condition.display();
		currentPage = currentPage<=0?1:currentPage;
		List<FreeListenBook> pageFrees;
		//通过条件获得预约总数量
		int count = free_serv.findReservationCountByCondition(condition,qid);
		System.out.println("count "+count);
		//创建工具类，将其放在request中
		Page page= new FreeListenBackPage(currentPage,count);
		request.setAttribute("page", page);
		
		pageFrees = free_serv.findPageByCondition(condition, page,qid);
		for(FreeListenBook frr:pageFrees){
			System.out.println(frr.getFid());
			System.out.println(frr.getFreelisten().toString());
		}
		//System.out.println("查看freeListen结束");
		request.setAttribute("pageFrees", pageFrees);
		return "forward:/BackEnd_final/BackEnd_final/reservationDeal.jsp";
	}*/
	
/*	
	//找到所有预约
	@RequestMapping(value="/reserve/findAll")
	@ResponseBody
	public List<FreeListenBook> getAllReservation(HttpServletRequest request) throws Exception{
		//HttpSession session = request.getSession();
		//int qid = (Integer)session.getAttribute("qid");
		List<FreeListenBook> frees = free_serv.findAllFreeListenBooks(qid);
		request.setAttribute("frees", frees);
		for(FreeListenBook free:frees){
			System.out.println(free.getId()+"\t"+free.getFid()+"\t"+free.getUserName()+"\t"+free.getStatus());
		}
		return frees;
	}
	*/

}
