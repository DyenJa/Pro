package com.neusoft.control;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neusoft.po.Admine;
import com.neusoft.service.AdmineService;

@Controller
public class AdmineHandler {
	@Autowired
	private AdmineService ad_serv;
	
	@RequestMapping(value="/BackEnd/Manager/log")
	@ResponseBody
	public Map<String, Object> login(String name,String pwd,HttpSession session) throws Exception{
		Admine admine = ad_serv.selectAdmineByName(name);
		boolean msg = false;
		Map<String, Object> map = new HashMap<String, Object>();
		if(admine!=null && pwd.equals(admine.getAdpassword())){
			Integer qid  = admine.getQid();
			session.setAttribute("qid", qid);
			msg=true;
		}
		if(msg){
			session.setAttribute("isLoginOk", "true");
		}else{
			session.setAttribute("isLoginOk", "false");
		}
		map.put("msg", msg);
		return map;
	}
}
