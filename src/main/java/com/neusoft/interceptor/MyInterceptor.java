package com.neusoft.interceptor;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class MyInterceptor implements HandlerInterceptor {
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		System.out.println(".........MyInterceptor........afterCompletion()......最终通知...."+new Date());
	
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		System.out.println(".........MyInterceptor........postHandle()......后置通知....");
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		System.out.println(".........MyInterceptor........preHandle()......前置通知....");
		HttpSession session = ((HttpServletRequest)request).getSession();
		boolean isLoginOk = Boolean.parseBoolean(session.getAttribute("isLoginOk")+"");
		if(isLoginOk){
			return true;
		}
		else{
			request.setAttribute("msg", "没有权限，请登入");
			((HttpServletRequest)request).getRequestDispatcher("/BackEnd_final/BackEnd_final/login.jsp").forward(request, response);
		}
		return false;
	}

}
