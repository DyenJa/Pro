package com.neusoft.service;

import com.neusoft.po.User;

public interface UserService {
	
	public boolean addUser(User user) throws Exception;
	
	public User findUserByTel(String tel , int qid) throws Exception;
	
	public boolean updateIcon(String tel, int qid, String url) throws Exception;
}
