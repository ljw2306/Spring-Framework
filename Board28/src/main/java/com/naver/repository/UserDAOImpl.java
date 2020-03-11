package com.naver.repository;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.naver.dto.LoginTO;

@Repository
public class UserDAOImpl implements UserDAO	{
	
	@Inject
	private SqlSession session;
	
	private final String NS = "com.naver.user";
	
	@Override
	public LoginTO login(LoginTO to) {
		return session.selectOne(NS+".login", to);
	}

}
