package com.naver.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.naver.dto.MemberDTO;
import com.naver.service.TestService;

@Controller
@RequestMapping("aop")
public class TestAOPController {
	
	@Autowired
	private TestService tservice;
	
	@RequestMapping(value="start", method=RequestMethod.GET)
	public void start() {
		tservice.start();
	}
	
	@RequestMapping(value="end", method=RequestMethod.GET)
	public void end() {
		MemberDTO dto = new MemberDTO("m001", "kim", 11);
		tservice.end(dto);
	}
	
}
