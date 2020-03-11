package com.naver.ceptor;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import kr.co.ca.Test39Controller;

public class TestHandlerInterceptorImpl implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("$$$$$$$$$$$$$preHandle$$$$$$$$$$$$");
		HandlerMethod method = (HandlerMethod)handler;
		System.out.println(method.getBean());
		
		Method methodObj = method.getMethod();
		System.out.println(methodObj);
		
		Test39Controller t39 = (Test39Controller)method.getBean();
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("&&&&&&&&&&&&postHandle&&&&&&&&&&&");
		String login = (String)modelAndView.getModel().get("login");
		if (login != null) {
			HttpSession session = request.getSession();
			session.setAttribute("login", login);
			
			response.sendRedirect("/interC");
			
		}
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	

}
