package com.naver.controller;

import javax.inject.Inject;

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
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public void insert(@RequestBody ReplyVO vo) {
		System.out.println(vo);
		rservice.insert(vo);
	}
}
