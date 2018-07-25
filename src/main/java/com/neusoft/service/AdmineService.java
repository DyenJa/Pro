package com.neusoft.service;

import com.neusoft.po.Admine;

public interface AdmineService {
	public Admine selectAdmineByName(String name) throws Exception;
}
