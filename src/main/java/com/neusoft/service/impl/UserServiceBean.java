package com.neusoft.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neusoft.mapper.UserMapper;
import com.neusoft.po.User;
import com.neusoft.service.UserService;
@Service
public class UserServiceBean implements UserService {
	@Autowired
	private UserMapper u_mapper;
	@Override
	public boolean addUser(User user) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("tel", user.getTel());
		map.put("qid", user.getQid());
		int count = u_mapper.findCountByTelQid(map);
		System.out.println(count);
		//有重复的用户
		if(count>=1){
			return false;
		}else{ 
			u_mapper.addUser(user);
		}
		return true;
	}
	@Override
	public User findUserByTel(String tel, int qid) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("tel", tel);
		map.put("qid", qid);
		return u_mapper.findUserByTelQid(map);
	}
	@Override
	public boolean updateIcon(String tel, int qid, String url) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("qid", qid);
		map.put("tel", tel);
		map.put("url", url);
		int changeNum = u_mapper.updateIcon(map);
		if(changeNum>0)
			return true;
		else
			return false;
		
	}
}
