package com.neusoft.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyFilter implements Filter {

	@Override
	public void destroy() {
		System.out.println("..............MyFilter..........destory().........");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("..............MyFilter..........doFilter().........");
		boolean condition = true;
		if(condition){
			request.setCharacterEncoding("utf-8");
		//	request.setAttribute("msg", "啦啦啦");
			//String msg = request.getParameter("msg");
			//System.out.println("msg:"+msg);
			//request.setAttribute("test",msg);

		chain.doFilter(request, response);
		}else{
		((HttpServletResponse)response).sendRedirect("index.jsp");
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("..............MyFilter..........init().........");
	}

}
