package com.naver.service;

import org.springframework.stereotype.Service;

import com.naver.dto.ReplyVO;

public interface ReplyService {
	public abstract void insert(ReplyVO vo);
}
