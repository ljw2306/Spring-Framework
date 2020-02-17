package com.naver.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="board")
public class BoardController {
	
	@RequestMapping(value="insert", method = RequestMethod.GET)
	public String insertui() {
		return "board/insert";
	}
	
	@RequestMapping(value="insert", method = RequestMethod.POST)
	public String insert() {
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="list")
	public String list(Model model) {
		model.addAttribute("name", "kim");
		model.addAttribute("age", 11);
		return "board/list";
	}
	
	@RequestMapping(value="update")
	public String updateui() {
		return "board/update";
	}
	
	@RequestMapping(value="update", method = RequestMethod.POST)
	public String update() {
		return "board/update";
	}
}
