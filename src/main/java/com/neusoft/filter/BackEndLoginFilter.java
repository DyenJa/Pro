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
import javax.servlet.http.HttpSession;

public class BackEndLoginFilter implements Filter {

	@Override
	public void destroy() {
		System.out.println("........BackEndLoginFilter............destory()..............");
	}

	/*@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("........LoginFilter............doFilter()..............");
		HttpSession session = ((HttpServletRequest)request).getSession();
		boolean isLoginOk = Boolean.parseBoolean(session.getAttribute("isLoginOk")+"");
		
		if(isLoginOk){
			chain.doFilter(request, response);
		}else{
			
			//request.setAttribute("msg", "没有权限，请登入");
			request.getRequestDispatcher("/Education/login.html").forward(request, response);
			//((HttpServletResponse)response).sendRedirect("/Education/login.html");
		}
	}*/

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("........BackEndLoginFilter............init()..............");

	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();
        StringBuffer server = request.getRequestURL();
        boolean isLoginOk = Boolean.parseBoolean(session.getAttribute("isLoginOk")+"");
         if(isLoginOk){
        //如果发现是css或者js文件，直接放行
            chain.doFilter(request, response);
        }
         else{
 			//response.sendRedirect("/NeuEduPro/Education/Education/login.html");
 			//request.setAttribute("msg", "没有权限，请登入");
 			request.getRequestDispatcher("/BackEnd_final/BackEnd_final/login.jsp").forward(request, response);
 			//((HttpServletResponse)response).sendRedirect("/Education/login.html");
 		}
	}
}
