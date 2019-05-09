package com.kosmo.insomnia.serviceimpl.login;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.insomnia.service.MemberDTO;
import com.kosmo.insomnia.service.login.LoginService;
import com.kosmo.insomnia.util.login.MailHandler;
import com.kosmo.insomnia.util.login.TempKey;

@Repository
public class LoginServiceDAO implements LoginService{

	@Resource(name = "template")
	private SqlSessionTemplate template;

	@Override
	public void create(Map map) {		
	}

	@Override
	public void insertUser(Map map) {
		template.insert("memberInsert", map);
		
	}

	@Override
	public void createAuthKey(String user_email, String user_authcode) {
		MemberDTO dto = new MemberDTO();
		dto.setActivation_key(user_authcode);
		dto.setId(user_email);
		template.selectOne("createAuthKey", dto);
	}

	@Override
	public void userAuth(Map map) {
		template.update("userAuth", map);
	}

	@Override
	public boolean checkSignup(String id) {
		return false;
	}

	
}