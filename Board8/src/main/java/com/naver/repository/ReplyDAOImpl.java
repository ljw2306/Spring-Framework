package com.naver.repository;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.naver.dto.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession session;
	
	private final String NS = "com.naver.reply";
	
	@Override
	public void insert(ReplyVO vo) {
		session.insert(NS+".insert", vo);
	}

}
