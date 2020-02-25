package com.naver.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.naver.dto.BoardVO;
import com.naver.dto.PageTO;
import com.naver.service.BoardService;

@Controller
@RequestMapping("board")
public class BoardController {
	
	@Inject
	private BoardService bservice;
	
	@RequestMapping(value="listpage", method = RequestMethod.GET)
	public void listpage(PageTO to, Model model) {
		to = bservice.listpage(to);
		model.addAttribute("to", to);
	}

	@RequestMapping(value="update", method = RequestMethod.POST)
	public String update(BoardVO vo, @RequestParam("curPage")int curPage) {
		bservice.update(vo);
		return "redirect:/board/listpage?curPage="+curPage;
	}
	
	@RequestMapping(value="update", method = RequestMethod.GET)
	public String updateui(int bno, int curPage, Model model) {
		BoardVO vo = bservice.updateui(bno);
		model.addAttribute("vo", vo);
		model.addAttribute("curPage", curPage);
		return "board/update";
	}
	
	
	@RequestMapping(value="read/{bno}", method = RequestMethod.GET)
	public String read(@PathVariable("bno")int bno, int curPage, Model model) {
		BoardVO vo = bservice.read(bno);
		model.addAttribute("vo", vo);
		model.addAttribute("curPage", curPage);
		return "board/read";
	}
	
	@RequestMapping(value="insert", method = RequestMethod.POST)
	public String insert(BoardVO vo) {
		bservice.insert(vo);
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="insert", method = RequestMethod.GET)
	public void insertui() {
	}
	
	@RequestMapping(value="list", method = RequestMethod.GET)
	public void list(Model model) {
		List<BoardVO> list = bservice.list();
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="delete/{bno}/{curPage}", method=RequestMethod.POST)
	public String delete(@PathVariable("bno")int bno, @PathVariable("curPage") int curPage) {
		bservice.delete(bno);
		return "redirect:/board/listpage?curPage="+curPage;
	}
	
}
