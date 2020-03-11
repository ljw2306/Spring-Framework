package com.naver.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.naver.dto.ReplyVO;
import com.naver.service.ReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {
	
	@Inject
	private ReplyService rservice;
	
	@RequestMapping(method=RequestMethod.PUT)
	public String update(@RequestBody ReplyVO vo) {
		rservice.update(vo);
		return "success_update";
	}
	
	@RequestMapping(value="{rno}", method=RequestMethod.DELETE)
	public String delete(@PathVariable int rno) {
		rservice.delete(rno);
		return "success_delete";
	}
	
	@RequestMapping(value="{bno}", method=RequestMethod.GET)
	public List<ReplyVO> list(@PathVariable Integer bno) {
		List<ReplyVO> list = rservice.list(bno);
		return list;
	}
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public void insert(@RequestBody ReplyVO vo) {
		rservice.insert(vo);
	}
}