package com.neusoft.mapper;

import java.util.Map;

import com.neusoft.po.User;

public interface UserMapper {
	
	public int addUser(User user) throws Exception;
	//tel,qid
	public User findUserByTelQid(Map<String, Object> map) throws Exception;
	//tel,qid
	public int findCountByTelQid(Map<String,Object> map) throws Exception;
	//url ,tel ,qid
	public int updateIcon(Map<String,Object> map) throws Exception;
}
