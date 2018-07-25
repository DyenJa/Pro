package com.neusoft.control;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neusoft.po.Message;
import com.neusoft.po.MessageReply;
import com.neusoft.service.MessageService;
import com.neusoft.tools.Tools;

@Controller
public class MorePageHandler {
		@Autowired
		private MessageService messageService;
		
		@RequestMapping(value="/FrontEnd/more/pullrefresh")
		@ResponseBody
		public List<Message> pullrefresh_handler(HttpServletRequest request,String pubtime,int type) throws Exception{
			System.out.println("........MorePageHandler.......pullrefresh_handler()........");
			System.out.println("pubtime:"+pubtime);
			System.out.println("type:"+type);
			HttpSession session = request.getSession();
			int  qid = (int) session.getAttribute("qid");
			List<Message> messages = messageService.selectFrontEndMessages(qid,pubtime,type);
			return messages;
		}
		
		@RequestMapping(value="/FrontEnd/more/good")
		@ResponseBody
		public String responsegood_handler(int mid,int type,HttpServletRequest request) throws Exception{
			System.out.println("........MorePageHandler.......responsegood_handler()........");
			HttpSession session = request.getSession();
			String nickName =(String) session.getAttribute("nickName");
			boolean isOK = messageService.updateMessageLike(type, mid, nickName);
			if(isOK){
				return "{\"result\":true}";
			}
			else{
				return "{\"result\":false}";
			}
		}
		
		@RequestMapping(value="/FrontEnd/more/comment")
		@ResponseBody
		public String responsecomment_handler(String content,int mid,HttpServletRequest request) throws Exception{
			System.out.println("........MorePageHandler.......responsecomment_handler()........");
			HttpSession session = request.getSession();
			String nickName =(String) session.getAttribute("nickName");
			MessageReply messageReply = new MessageReply();
			messageReply.setMid(mid);
			messageReply.setContent(Tools.Stringfilter(content));
			messageReply.setNickName(nickName);
			boolean isOK = messageService.saveMessageReply(messageReply);
			if(isOK){
				return "{\"result\":true}";
			}
			else{
				return "{\"result\":false}";
			}
		}
		
		@RequestMapping(value="/FrontEnd/more/morecomment")
		@ResponseBody
		public List<MessageReply> responsemorecomment_handler(String pubtime,int type,int mid) throws Exception{
			System.out.println("........MorePageHandler.......responsemorecomment_handler()........");
			List<MessageReply> morereplys = messageService.selectMoreMessageReplys(mid, pubtime, type);
			return morereplys;
		}		
}
