package com.kosmo.insomnia.service;

import java.util.Map;

public interface BGSPayService {
	//입력]
	int insert(Map map);
	//삭제]
	int delete(Map map);
	//조건을 만족하는 단 하나 검색]
	BGSPayDTO selectOne(Map map);
}/////interface
