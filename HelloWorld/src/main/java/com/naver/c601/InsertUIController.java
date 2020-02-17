package com.naver.c601;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//@Controller
public class InsertUIController {
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(String name, int age) {
		System.out.println(name);
		System.out.println(age);
		
		return "list";
	}
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insertui(Model model) {
		model.addAttribute("name", "lee");
		model.addAttribute("age", 11);
		
		return "insert";
	}
	
}
