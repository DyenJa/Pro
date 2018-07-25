package com.neusoft.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neusoft.mapper.AdmineMapper;
import com.neusoft.po.Admine;
import com.neusoft.service.AdmineService;

@Service
public class AdmineServiceBean implements AdmineService{
	@Autowired
	private AdmineMapper ad_mapper;
	
	@Override
	public Admine selectAdmineByName(String name) throws Exception {
		
		return ad_mapper.findAdmineByName(name);
	}
}
