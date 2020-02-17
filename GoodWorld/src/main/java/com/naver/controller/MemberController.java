package com.naver.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.dto.MemberDTO;
import com.naver.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {
	
	@Inject
	private MemberService mservice;
	
	@RequestMapping(value="delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id")String id, Model model) {
		mservice.delete(id);
		model.addAttribute("test", "test");
		return "redirect:/member/list";
	}
	
	@RequestMapping(value="update", method = RequestMethod.POST)
	public String update(MemberDTO dto, RedirectAttributes rtts) {
		rtts.addAttribute("test1", "test1");
		rtts.addFlashAttribute("test2", "test2");
		mservice.update(dto);
		return "redirect:/member/list";
	}
	
	@RequestMapping(value="update/{id}", method = RequestMethod.GET)
	public String updateui(@PathVariable("id") String id, Model model) {
		MemberDTO dto = mservice.updateui(id);
		model.addAttribute("dto", dto);
		return "member/update";
	}
	
	@RequestMapping(value="read", method = RequestMethod.GET)
	public void read(String id, Model model) {
		MemberDTO dto = mservice.read(id);
		model.addAttribute("dto", dto);
	}
	
	@RequestMapping(value="insert", method = RequestMethod.POST)
	public String insert(MemberDTO dto) {
		mservice.insert(dto);
		return "redirect:/member/list";
	}
	
	@RequestMapping(value="insert", method = RequestMethod.GET)
	public void insertui() {
	}
	
	@RequestMapping(value="list", method = RequestMethod.GET)
	public String list(Model model) {
		List<MemberDTO> list = mservice.getList();
		model.addAttribute("list", list);
		return "member/list";
	}
	
}
