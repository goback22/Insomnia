package com.kosmo.insomnia.service;

import java.util.List;
import java.util.Map;

public interface RewardService {
	
	///조건을 만족하는 여러 리워드 검색용
	List<RewardDTO> selectList(Map map);
	
	///조건을 만족하는 단 하나의 리워드 검색용
	RewardDTO selectOne(Map map);
	
	//조건을 만족하는 전체 행 수 구하기
	int getCount(Map map);
	
	//그냥 전체 행 수 구하기
	int getTotalCount(Map map);
	
	///입력*수정*삭제용
	int delete();
	int insert();
	int update();
	
	//안드로이드 펀딩]
	List<Map> selectFunding();
	List<Map> selectFunding2();
	
	///안드로이드를 위한 쿼리문1
	List<Map> selectAndroidReward2(Map map);
	
	
}
