package com.neusoft.control;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.neusoft.po.Message;
import com.neusoft.po.MessageReply;
import com.neusoft.service.MessageService;
import com.neusoft.tools.MessagePage;
import com.neusoft.tools.MessageReplyPage;
import com.neusoft.tools.Page;
import com.neusoft.tools.Tools;

@Controller
public class MessageHandler {
	@Autowired
	private MessageService messageService;
	

@RequestMapping(value="/BackEnd/message/publish")
@ResponseBody
public String publishMessage(String mtitle,@RequestParam MultipartFile[] upload,HttpServletRequest request) throws Exception{
	System.out.println("........MessageHandle.......publish.....");
	System.out.println(request.getRequestURI());
	String path = request.getServletContext().getRealPath("/");
	String ppath = new File(path).getParent();
	path = ppath+"/upload/messageimgs";
	HttpSession session = request.getSession();
	int  qid = (int) session.getAttribute("qid");
	Message message = new Message();
	message.setMtitle(Tools.Stringfilter(mtitle));
	message.setQid(qid);
	//boolean isOK = true;
	boolean isOK = messageService.saveMessage(message, upload, path);
	if(isOK){
		return "{\"result\":true}";
	}
	else{
		return "{\"result\":false}";
	}
}

@RequestMapping(value="/BackEnd/message/messagelist")
public String messagelist_Handler(HttpServletRequest request) throws Exception{
	System.out.println(".........MessageHandler..........messagelist_Handler()........");
	HttpSession session = request.getSession();
	int  qid = (int) session.getAttribute("qid");
	int currentPage = 1;
	if(request.getParameter("currentPage")==null){
		currentPage = 1;
	}else{
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int num = messageService.selectTotalNumOfMessages(qid);	
	Page page = new MessagePage(currentPage,num);
	
	List<Message> messages = messageService.selectMessages(page, qid);
	request.setAttribute("page", page);
	request.setAttribute("messages", messages);
	return "forward:/BackEnd_final/BackEnd_final/messageView.jsp";
}

@RequestMapping(value="/BackEnd/message/messagedelete")
public String messagedelete_Handler(HttpServletRequest request,int mid,int currentPage) throws Exception{
		System.out.println(".........MessageHandler..........messagedelete_Handler()........");
		String path = request.getServletContext().getRealPath("/");
		String ppath = new File(path).getParent();
		path = ppath+"/upload/messageimgs";
		boolean isOK = messageService.deleteMessage(mid, path);
		return "forward:/BackEnd/message/messagelist";
}

@RequestMapping(value="/BackEnd/message/messagereview")
public String messagereview_Handler(HttpServletRequest request,int messagePage,int mid) throws Exception{
	System.out.println(".........MessageHandler..........messagereview_Handler()........");
	int currentPage = 1;
	if(request.getParameter("currentPage")==null){
		currentPage = 1;
	}else{
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int num = messageService.selectTotalNumOfMessageReplys(mid);
	Page page = new  MessageReplyPage(currentPage,num);
	
	List<MessageReply> messageReplys = messageService.selectMessageReplys(page, mid);
	request.setAttribute("page", page);
	request.setAttribute("messageReplys", messageReplys);
	request.setAttribute("messagePage", messagePage);
	request.setAttribute("mid", mid);
	return "forward:/BackEnd_final/BackEnd_final/messageReview.jsp";
}

@RequestMapping(value="/BackEnd/message/delete_messagereply")
@ResponseBody
public String delete_messagereply_handler(HttpServletRequest request,int[] replyids) throws Exception{
	System.out.println("........MessageHandler.........delete_messagereply_handler().........");
	boolean isOK = messageService.deleteMessageReplys(replyids);
	if(isOK){
		return "{\"result\":true}";
	}
	else{
		return "{\"result\":false}";
	}
}
}

