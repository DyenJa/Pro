package com.neusoft.service.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.neusoft.mapper.MessageMapper;
import com.neusoft.po.Message;
import com.neusoft.po.MessageImg;
import com.neusoft.po.MessageLike;
import com.neusoft.po.MessageReply;
import com.neusoft.service.MessageService;
import com.neusoft.tools.MoreMessagePage;
import com.neusoft.tools.MoreReplyPage;
import com.neusoft.tools.Page;

@Service
public class MessageServiceBean implements MessageService {
	@Autowired
	private MessageMapper messageMapper;
	
	@Override
	public List<Message> selectMessages(Page page, int qid) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("......MessageServiceBean.........selectMessages()..........");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("start", page.getStart());
		map.put("end", page.getEnd());
		map.put("qid", qid);
		List<Message> messages = messageMapper.getMessages(map);
		/*for(int i = 0;i<messages.size();i++){
			System.out.println("messageLikenum:"+messages.get(i).getLikenum()+"/tmessagereplynum:"+messages.get(i).getReplynum());
			System.out.println("messageImgsize:"+messages.get(i).getMessageimgs().size());
		}*/
		return messages;
	}

	@Override
	public boolean saveMessageReply(MessageReply messageReply) throws Exception {
		System.out.println("......MessageServiceBean.........saveMessageReply()..........");
		int num = messageMapper.addMessageReply(messageReply);
		return num==1;
	}



	@Override
	public List<MessageReply> selectMessageReplys(Page page, int mid) throws Exception {
		System.out.println(".....MessageServiceBean........selectMessageReplys().........");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("mid", mid);
		map.put("start", page.getStart());
		map.put("end", page.getEnd());

		List<MessageReply> messageReplys = messageMapper.getMessageReplys(map);
		return messageReplys;
	}

	@Override
	public int selectTotalNumOfMessages(int qid) throws Exception {
		System.out.println("........MessageServiceBean........selectTotalNumOfMessages()...............");
		int num = messageMapper.getTotalNumOfMessages(qid);
		System.out.println("num:"+num);
		return num;
	}

	@Override
	public int selectTotalNumOfMessageReplys(int mid) throws Exception {
		System.out.println(".....MessageServiceBean........selectTotalNumOfMessageReplys().........");
		int num = messageMapper.getTotalNumOfMessagesReplys(mid);
		return num;
	}

	@Override
	public boolean saveMessage(Message message, MultipartFile[] upload,String path) throws Exception {
		System.out.println(".....MessageServiceBean........saveMessage().........");
		int count = messageMapper.addMessage(message);
		if(count==1){
		MessageImg messageImg = new MessageImg();
		messageImg.setMid(message.getMid());
		for(int i=0;i<upload.length;i++){
			String filename  =System.currentTimeMillis()+upload[i].getOriginalFilename();
			File dest = new File(path,filename);	
			messageImg.setImgUrl(filename);
			count = messageMapper.addMessageImg(messageImg);
			if(count!=1){
				return false;
			}
			upload[i].transferTo(dest);
		}
		}else{
			return false;
		}
		return true;
}

	@Override
	public boolean deleteMessage(int mid,String path) throws Exception {
		System.out.println(".....MessageServiceBean........deleteMessage().........");
		messageMapper.deleteMessageLikeByMid(mid);
		messageMapper.deleteMessageReplyByMid(mid);
		if(deleteMessageImgs(mid,path)){
			messageMapper.deleteMessageImgByMid(mid);
		}
		int count = messageMapper.deleteMessageByMid(mid);	
		if(count==1) return true;
		else return false;
	}

	@Override
	public boolean deleteMessageImgs(int mid,String path) throws Exception {
		System.out.println(".....MessageServiceBean........deleteMessage().........");
		List<MessageImg> messageImgs = messageMapper.getMessageImgs(mid);
		if(messageImgs.isEmpty()){
			return false;
		}
		else{
			for(MessageImg messageImg:messageImgs){
				String filename = messageImg.getImgUrl();
				File img = new File(path,filename);	
				img.delete();
			}
			return true;
		}
	}

	@Override
	public boolean deleteMessageReplys(int[] replyids) throws Exception {
		System.out.println(".....MessageServiceBean........deleteMessageReplys().........");
		for(int i =0;i<replyids.length;i++){
			int count = messageMapper.deleteMessageReplyById(replyids[i]);
			if(count!=1){
				return false;
			}
		}
		return true;
	}

	@Override
	public List<Message> selectFrontEndMessages(int qid, String pubtime, int type) throws Exception {
		System.out.println(".....MessageServiceBean........selectFrontEndMessages().........");
		Map<String,Object> map = new HashMap<String,Object>();
		if(type==0){  //响应上啦刷新
			map.put("start", 0);
			map.put("end", MoreMessagePage.uppageNum);
			map.put("qid", qid);
			map.put("type", type);
			map.put("pubtime", pubtime);
		}else{
			map.put("start", 0);
			map.put("end", MoreMessagePage.downpageNum);
			map.put("qid", qid);
			map.put("type", type);
			map.put("pubtime", pubtime);
		}
		
		List<Message> messages = messageMapper.getMessages(map);
		map.clear();
		map.put("start", 0);
		map.put("end", 10);
		Map<String,Object> comment_map = new HashMap<String,Object>();
		comment_map.put("start", 0);
		comment_map.put("end", 3);
		for(Message message:messages){
			int mid = message.getMid();
			map.put("mid", mid);
			comment_map.put("mid", mid);
			List<MessageLike> messageLikes = messageMapper.getMessageLikes(map);
			List<MessageReply> messageReplys = messageMapper.getMessageReplys(comment_map);
			message.setMessagelikes(messageLikes);
			message.setMessagereplys(messageReplys);
		}
		return messages;
	}
	
	@Override
	public boolean updateMessageLike(int type, int mid, String nickname) throws Exception {
		System.out.println(".....MessageServiceBean........updateMessageLike().........");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("mid", mid);
		map.put("nickname", nickname);
		int num = messageMapper.getNumOfMessageLIkeByMidAndNickname(map);
		if(type==0){
			return num==1;
		}
		else{
			if(num==0){
				num = messageMapper.addMessageLike(map);
				return true;
			}
			else{
				num =messageMapper.deleteMessageLike(map);
				return false;
			}
		}
	}

	@Override
	public List<MessageReply> selectMoreMessageReplys(int mid, String pubtime, int type) throws Exception {
		System.out.println(".....MessageServiceBean........selectMoreMessageReplys().........");
		Map<String,Object> map = new HashMap<String,Object>();
		if(type==0){  //响应上啦刷新
			map.put("start", 0);
			map.put("end", MoreReplyPage.pageupnum);
			map.put("mid", mid);
			map.put("type", type);
			map.put("pubtime", pubtime);
		}else{
			map.put("start", 0);
			map.put("end", MoreReplyPage.pagedownnum);
			map.put("mid", mid);
			map.put("type", type);
			map.put("pubtime", pubtime);
		}
		List<MessageReply> messageReplys = messageMapper.getMessageReplys(map);
		return messageReplys;
	}
}