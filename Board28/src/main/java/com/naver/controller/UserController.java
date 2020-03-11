package com.naver.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.naver.dto.LoginTO;
import com.naver.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private UserService uservice;
	
	@RequestMapping(value="login", method = RequestMethod.GET)
	public void login() {
		
	}
	
	@RequestMapping(value="loginPost", method = RequestMethod.POST)
	public void login(LoginTO to, Model model) {
		LoginTO bto = uservice.login(to);
		model.addAttribute("login", bto);
	}
	
}
