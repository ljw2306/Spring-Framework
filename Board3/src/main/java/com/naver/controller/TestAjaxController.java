package com.naver.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.asm.TypeReference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.naver.dto.BoardVO;

@Controller
@RequestMapping("test")
public class TestAjaxController {
	
	@RequestMapping(value="test4", method=RequestMethod.POST)
	public void test4(@RequestParam Map<String, Object> map) {
		String jsonStr = map.get("mList").toString();
		ObjectMapper mapper = new ObjectMapper();
		List<Map<String, Object>> list = mapper.readValue(jsonStr, new TypeReference<ArrayList<Map<String, Object>>>(){}); throw Exception, IOException
		
	}
	
	@RequestMapping(value="test4", method=RequestMethod.GET)
	public void test4() {
		
	}
	
	@RequestMapping(value="test3", method = RequestMethod.POST)
	public BoardVO test3(BoardVO vo) {
		System.out.println(vo);
		return vo;
	}
	
	@RequestMapping(value="test3", method = RequestMethod.GET)
	public void test3() {
		
	}
	
	@RequestMapping(value="test22", method = RequestMethod.POST)
	@ResponseBody
	public String[] test22(String[] arr) {
		return arr;
	}
	
	@RequestMapping(value="test22", method = RequestMethod.GET)
	public void test22() {
		
	}
	
	@RequestMapping(value="test2", method = RequestMethod.POST)
	@ResponseBody
	public String[] test2(String[] arr) {
		System.out.println("::::::::::::::");
		for (String x : arr) {
			System.out.println(x);
		}
		System.out.println("11111111111111");
		return arr;
	}
	
	@RequestMapping(value="test2", method = RequestMethod.GET)
	public void test2() {
		
	}
	
	@RequestMapping(value="test1", method = RequestMethod.POST, produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String test1(String str) {
		return str;
	}
	
	
	@RequestMapping(value="test1", method = RequestMethod.GET)
	public void test1() {
		
	}

}
