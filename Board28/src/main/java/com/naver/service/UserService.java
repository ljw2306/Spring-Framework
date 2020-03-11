package com.naver.service;

import com.naver.dto.LoginTO;

public interface UserService {
	
	public abstract LoginTO login(LoginTO to);

}
