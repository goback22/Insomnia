package com.kosmo.insomnia.service;

import java.util.List;
import java.util.Map;

public interface RewardService {
	
	///조건을 만족하는 여러 리워드 검색용
	List<RewardDTO> selectList(Map map);
	
	///조건을 만족하는 단 하나의 리워드 검색용
	RewardDTO selectOne(Map map);
	
	///입력*수정*삭제용
	int delete();
	int insert();
	int update();
	
}