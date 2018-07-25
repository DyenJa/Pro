package com.neusoft.mapper;

import java.util.List;
import java.util.Map;

import com.neusoft.po.Message;
import com.neusoft.po.MessageImg;
import com.neusoft.po.MessageLike;
import com.neusoft.po.MessageReply;
import com.neusoft.tools.Page;


public interface MessageMapper {
	
	public int addMessageReply(MessageReply messageReply) throws  Exception;
	public int addMessageLike(MessageLike messageLike,int qid) throws Exception;

	public int getTotalNumOfMessages(int qid) throws Exception;
	public int getNumOfMessageLIkeByMidAndNickname(Map<String,Object> map) throws Exception;
	public int addMessageLike(Map<String,Object> map) throws Exception;
	public int deleteMessageLike(Map<String,Object> map) throws Exception;
	public int getTotalNumOfMessagesReplys(int mid) throws Exception;
	
	public List<Message> getMessages(Map<String,Object> map) throws Exception;
	
	public List<Message> getPullRefreshMessages(Map<String,Object> map) throws Exception;
	
	public int addMessage(Message message) throws Exception;
	public int addMessageImg(MessageImg messageImg) throws Exception;
	public List<MessageReply> getMessageReplys(Map<String,Object> map) throws Exception;
	public List<MessageLike> getMessageLikes(Map<String,Object> map) throws Exception;
	
	public int deleteMessageLikeByMid(int mid) throws Exception;
	public int deleteMessageReplyByMid(int mid) throws Exception;
	public int deleteMessageImgByMid(int mid) throws Exception;
	public int deleteMessageByMid(int mid) throws Exception;
	
	public List<MessageImg> getMessageImgs(int mid) throws Exception;
	
	public int deleteMessageReplyById(int id) throws Exception;
}
