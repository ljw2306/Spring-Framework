package com.naver.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.naver.utils.UploadFileUtils;

@Controller
public class UploadController {
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="/uploadajax", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String uploadajax(MultipartHttpServletRequest request) throws Exception {
		MultipartFile file = request.getFile("file");
		
		return UploadFileUtils.uploadFile(uploadPath, file);
	}
	
	@RequestMapping(value="/uploadajax", method=RequestMethod.GET)
	public void uploadajax() {
		
	}
	
	@RequestMapping(value="/uploadForm", method=RequestMethod.POST)
	public String uploadForm(MultipartHttpServletRequest request, Model model) throws IOException {
		MultipartFile file = request.getFile("file");
		
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString()+"_"+file.getOriginalFilename();
		
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(file.getBytes(), target);
		
		model.addAttribute("savedName", savedName);
		return "uploadResult";
		
	}
	
	@RequestMapping(value="/uploadForm", method=RequestMethod.GET)
	public void uploadForm() {
		
	}

}
