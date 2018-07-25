package com.neusoft.control;

import java.io.File;
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

import com.alibaba.fastjson.*;

import com.neusoft.po.Sorder;
import com.neusoft.service.OrderService;
import com.neusoft.tools.FileInputUtil;
import com.neusoft.vo.RatingItem;

/**
 * 订单处理控制器
 * @author 周慕贤	
 *
 */
@Controller
public class OrderHandler {
		@Autowired
		private OrderService orderService;
		
		@RequestMapping(value="/FrontEnd/order/getOrders")
		@ResponseBody
		public List<Sorder> getOrders(HttpServletRequest request) throws Exception{
			System.out.println(".......OrderHandler............getOrders().....");
			List<Sorder> orders = new ArrayList<Sorder>();
			HttpSession session = request.getSession();
			int qid = (int) session.getAttribute("qid");
			//int qid = Integer.parseInt(request.getParameter("qid"));
			String tel =	(String) session.getAttribute("tel");
			//String tel = request.getParameter("tel");
			String status = null;
			
			if (request.getParameter("status") != null && request.getParameter("status") != "")
				// 解析英文状态，因为问号传值会中文乱码，故状态值为英文
				switch (request.getParameter("status")) {
				case "unpaid":
					status = "待付款";
					break;
				case "paid":
					status = "已付款";
					break;
				case "used":
					status = "已使用";
					break;
				case "refund":
					status = "取消和退款";
					break;
				}
			
			//定义当前页和每页记录数量
			int currentPage = 1;
			if(request.getParameter("page")!=null)
				currentPage = Integer.parseInt(request.getParameter("page"));

			orders = orderService.selectAllOrders(qid, tel, status, currentPage);
			return orders;
		}
		
		/**
		 * 获得订单信息
		 * @param request
		 * @return
		 * @throws Exception
		 */
		@RequestMapping(value="/BackEnd/order/getOrdersPageAjax")
		@ResponseBody
		public Map<String, Object> getOrdersPageAjax(HttpServletRequest request) throws Exception{
			System.out.println("........OrderHandler.........getOrdersCount().....");
			HttpSession session = request.getSession();
			int qid = (int) session.getAttribute("qid");
			// 存储查询条件的map集合
			Map<String,Object> map = new HashMap<String,Object>();
			/*if (request.getParameter("qid") != null && request.getParameter("qid") != "")
				map.put("qid", request.getParameter("qid"));
			else
				map.put("qid", null);*/
			map.put("qid", qid);
			// 向map中存入从页面传来的条件值
			if (request.getParameter("oid") != null && request.getParameter("oid") != "")
				map.put("oid", request.getParameter("oid"));
			else
				map.put("oid", null);
	
			if (request.getParameter("status") != null && request.getParameter("status") != "")
				// 解析英文状态，因为问号传值会中文乱码，故状态值为英文
				switch (request.getParameter("status")) {
				case "unpaid":
					map.put("status", "待付款");
					break;
				case "paid":
					map.put("status", "已付款");
					break;
				case "refunding":
					map.put("status", "退款中");
					break;
				case "refunded":
					map.put("status", "已退款");
					break;
				case "used":
					map.put("status", "已使用");
					break;
				case "canceled":
					map.put("status", "已取消");
					break;
				}
			else
				map.put("status", null);
	
			if (request.getParameter("startDate") != null && request.getParameter("startDate") != "")
				map.put("startDate", request.getParameter("startDate"));
			else
				map.put("startDate", null);
	
			if (request.getParameter("endDate") != null && request.getParameter("endDate") != "")
				map.put("endDate", request.getParameter("endDate"));
			else
				map.put("endDate", null);
			// 若起始时间为空，则查询条件为从有记录的第一笔订单时间开始，故设置截止日期为一个很早的日期
			if (map.get("startDate") == null || map.get("startDate") == "")
				map.put("startDate", "1977-01-01");
			// 若截止时间为空，则查询条件为截止目前，故设置截止日期为一个很远的日期
			if (map.get("endDate") == null || map.get("endDate") == "")
				map.put("endDate", "2222-01-01");
			
			//定义当前页和每页记录数量
			int currentPage = 1;
			int limit = 10;
			
			if(request.getParameter("page")!=null)
				currentPage = Integer.parseInt(request.getParameter("page"));
			map.put("currentPage", currentPage);
			if(request.getParameter("limit")!=null)
				limit = Integer.parseInt(request.getParameter("limit"));
			map.put("limit", limit);
			int count = orderService.selectOrdersCount(map);
			map.put("count", count);
			
			List<Sorder> orders = orderService.selectAllOrdersPage_back(map);
			
			// 页面layui table所需的数据集合
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("code", 0);
			result.put("msg", "");
			result.put("count", 1000);
			JSONArray array = JSONArray.parseArray(JSON.toJSONString(orders));
			result.put("data", array);
			result.put("count", count);
			
			return result;
		}
		
		/**
		 * 退款处理
		 * @param request
		 * @return
		 * @throws Exception
		 */
		@RequestMapping(value="/BackEnd/order/confirmRefund")
		@ResponseBody
		public Map<String, Integer> confirmRefund(HttpServletRequest request) throws Exception {
			System.out.println("----orderHandler----confirmRefund()----");
			
			int state = 0;
			int oid = Integer.parseInt(request.getParameter("oid"));
			try {
				orderService.changeRefundStatus(oid);
				state = 1;
			} catch(Exception e) {
				e.printStackTrace();
			}
			Map<String, Integer> result = new HashMap<String, Integer>();
			result.put("state", state);
			
			return result;
		}
		
		/**
		 * 订单核销
		 * @param request
		 * @return
		 * @throws Exception
		 */
		@RequestMapping(value="/BackEnd/order/confirmCheck")
		@ResponseBody
		public Map<String, Integer> confirmCheck(HttpServletRequest request) throws Exception {
			System.out.println("----orderHandler----confirmCheck()----");
			
			int state = 0;
			int oid = Integer.parseInt(request.getParameter("oid"));
			try {
				orderService.changePaidStatus(oid);
				state = 1;
			} catch(Exception e) {
				e.printStackTrace();
			}
			Map<String, Integer> result = new HashMap<String, Integer>();
			result.put("state", state);
			
			return result;
		}

		/**
		 * 获得各个状态订单的所有页数
		 */
		@RequestMapping(value="/FrontEnd/order/getTotalPage")
		@ResponseBody
		public List<Integer> getTotalPage(HttpServletRequest request) throws Exception {
			System.out.println("----orderHandler----getTotalPage()----");
			HttpSession session = request.getSession();
			int qid = (int) session.getAttribute("qid");
			List<Integer> pages = new ArrayList<Integer>();
			//int qid = Integer.parseInt(request.getParameter("qid"));
			String tel = (String) session.getAttribute("tel");
			//String tel = request.getParameter("tel");
			pages = orderService.getTotalPage(qid, tel);
			
			return pages;
		}
		
		/**
		 * 添加评分
		 */
		@RequestMapping(value="/FrontEnd/order/addRating")
		@ResponseBody
		public boolean addRating(HttpServletRequest request) throws Exception {
			System.out.println("----orderHandler----addRating(555555)----");
			boolean isOK = true;
			int oid = Integer.parseInt(request.getParameter("oid"));
			float rating = Float.parseFloat(request.getParameter("mark"));
			try {
				RatingItem ratingItem = orderService.selectUidAndLidByOid(oid);
				System.out.println("uid: " + ratingItem.getUid());
				System.out.println("lid" + ratingItem.getLid());
				orderService.addRating(oid, rating);
				String str = "\r\n" + ratingItem.getUid() + "," + ratingItem.getLid() + "," + rating;
				System.out.println(str);
				String path = request.getServletContext().getRealPath("/");
				String ppath = new File(path).getParent();
				path = ppath+"/upload";
				FileInputUtil util = new FileInputUtil(path);
				util.writeToTXT(str);
			} catch(Exception e) {
				isOK = false;
				e.printStackTrace();
			}
			return isOK;
		}
		
		/**
		 * 获得评分
		 */
		@RequestMapping(value="/FrontEnd/order/getRating")
		@ResponseBody
		public String getRating(HttpServletRequest request) {
			System.out.println("----orderHandler----getRating()----");
			String rating = null;
			int oid = Integer.parseInt(request.getParameter("oid")); 
			try {
				rating = orderService.getRating(oid);
				System.out.println("rating: " + rating);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return rating;
		}
		
		/**
		 * 获得订单价格
		 */
		@RequestMapping(value="/FrontEnd/order/getTotal")
		@ResponseBody
		public float getTotal(HttpServletRequest request) {
			System.out.println("----orderHandler----getTotal()----");
			float total = 0;
			int oid = Integer.parseInt(request.getParameter("oid")); 
			try {
				total = orderService.getTotal(oid);
				System.out.println("total: " + total);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return total;
		}
		
		/**
		 * 申请退款
		 */
		@RequestMapping(value="/FrontEnd/order/applyForRefund")
		@ResponseBody
		public boolean applyForRefund(HttpServletRequest request) {
			System.out.println("----orderHandler----applyForRefund()----");
			
			boolean isOK = true;
			int oid = Integer.parseInt(request.getParameter("oid"));
			try {
				orderService.changePaidToRefunding(oid);
			} catch(Exception e) {
				isOK = false;
				e.printStackTrace();
			}
			return isOK;
		}
		
		/**
		 * 取消订单
		 */
		@RequestMapping(value="/FrontEnd/order/applyForCancel")
		@ResponseBody
		public boolean applyForCancel(HttpServletRequest request) {
			System.out.println("----orderHandler----applyForCancel()----");
			
			boolean isOK = true;
			int oid = Integer.parseInt(request.getParameter("oid"));
			try {
				orderService.changeUnpaidToCanceled(oid);
			} catch(Exception e) {
				isOK = false;
				e.printStackTrace();
			}
			return isOK;
		}
		
		/**
		 * 支付
		 */
		@RequestMapping(value="/FrontEnd/order/applyForPay")
		@ResponseBody
		public boolean applyForPay(HttpServletRequest request) {
			System.out.println("----orderHandler----applyForPay()----");
			
			boolean isOK = true;
			int oid = Integer.parseInt(request.getParameter("oid"));
			try {
				orderService.changeUnpaidToPaid(oid);
			} catch(Exception e) {
				isOK = false;
				e.printStackTrace();
			}
			return isOK;
		}
}
