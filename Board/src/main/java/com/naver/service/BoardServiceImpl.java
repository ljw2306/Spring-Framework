package com.naver.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.dto.BoardVO;
import com.naver.repository.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDAO bdao;
	
	@Override
	public List<BoardVO> list() {
		return bdao.list();
	}
	
	@Override
	public void insert(BoardVO vo) {
		bdao.insert(vo);
	}
	
	@Override
	public BoardVO read(int bno) {
		bdao.updateReadCnt(bno);
		return bdao.read(bno);
	}
	
	@Override
	public BoardVO updateui(int bno) {
		return bdao.updateui(bno);
	}
	
	@Override
	public void update(BoardVO vo) {
		bdao.update(vo);
	}
}
