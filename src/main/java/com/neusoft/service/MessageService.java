package com.neusoft.service;

import java.util.List;


import org.springframework.web.multipart.MultipartFile;

import com.neusoft.po.Message;
import com.neusoft.po.MessageLike;
import com.neusoft.po.MessageReply;
import com.neusoft.tools.MoreMessagePage;
import com.neusoft.tools.Page;


public interface MessageService {
		public boolean updateMessageLike(int type,int mid,String nickname) throws Exception;
		public boolean saveMessageReply(MessageReply messageReply) throws Exception;
		public List<Message> selectFrontEndMessages(int qid,String pubtime,int type) throws Exception;

		public List<Message> selectMessages(Page page,int qid) throws Exception;
		public int selectTotalNumOfMessages(int qid) throws Exception;
		public int selectTotalNumOfMessageReplys(int mid) throws Exception;
		
		public List<MessageReply> selectMessageReplys(Page page,int mid) throws Exception;
		public List<MessageReply> selectMoreMessageReplys(int mid,String pubtime,int type) throws Exception;
		
		public boolean  saveMessage(Message messgae,MultipartFile[] upload,String path) throws Exception;
		//public List<Message> selectMessages(Page page,int qid) throws Exception;
		public boolean  deleteMessage(int mid,String path) throws Exception;
		public boolean  deleteMessageImgs(int mid,String path) throws Exception;
		
		public boolean  deleteMessageReplys(int[] replyids) throws Exception;
		
		
}
