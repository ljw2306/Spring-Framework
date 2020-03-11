package com.naver.repository;

import com.naver.dto.LoginTO;

public interface UserDAO {
	public LoginTO login(LoginTO to);

}
