package com.kosmo.insomnia.web.my;

import org.springframework.social.UserIdSource;

public class StaticUserIdSource implements UserIdSource {

	@Override
	public String getUserId() {
		return null;
	}

}
