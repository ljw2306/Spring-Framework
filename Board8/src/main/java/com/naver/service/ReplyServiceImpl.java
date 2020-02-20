package com.naver.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.dto.ReplyVO;
import com.naver.repository.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO rdao;
	
	@Override
	public void insert(ReplyVO vo) {
		rdao.insert(vo);
	}

}
