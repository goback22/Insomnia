package com.kosmo.insomnia.serviceimpl.login;

import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kosmo.insomnia.service.login.LoginService;
import com.kosmo.insomnia.util.login.MailHandler;
import com.kosmo.insomnia.util.login.TempKey;

@Service
public class LoginServiceImpl implements LoginService {
	@Inject
	private JavaMailSender mailSender;

	// OneMemoDAO객체 주입
	@Resource(name = "loginServiceDAO")
	private LoginServiceDAO dao;

	@Override
	public void create(Map map) {
		dao.insertUser(map);// 회원가입 DAO
		
		String key = new TempKey().getKey(50, false);// 인증키 생성
		dao.createAuthKey(map.get("id").toString(), key);
		
		try {
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("[insomnia 회원가입 이메일 인증]");
			sendMail.setText(new StringBuffer().append("<h1>메일인증</h1>")
					.append("<a href='http://localhost:8080/insomnia/emailConfirm.ins?user_email=").append(map.get("id").toString())
					.append("&key=").append(key).append("' target='_blenk'>이메일 인증 확인</a>").toString());
			sendMail.setFrom("insmonia@insumnia.com", "인섬니아 관리자");
			sendMail.setTo(map.get("id").toString());
			sendMail.send();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void createAuthKey(String user_emial, String user_authcode) {
	}


	@Override
	public void userAuth(Map map) {
		dao.userAuth(map);
	}


	@Override
	public boolean checkSignup(String id) {
		
		return false;
	}

	@Override
	public void insertUser(Map map) {
		// TODO Auto-generated method stub
		
	}
	
	

}
