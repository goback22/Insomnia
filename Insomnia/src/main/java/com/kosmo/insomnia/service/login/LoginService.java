package com.kosmo.insomnia.service.login;

import java.util.Map;

import com.kosmo.insomnia.service.MemberDTO;

public interface LoginService {

	void create(Map map);
	void insertUser(Map map);
	void createAuthKey(String user_emial, String user_authcode);
	void userAuth(Map map);
	boolean checkSignup(String id);
	
}