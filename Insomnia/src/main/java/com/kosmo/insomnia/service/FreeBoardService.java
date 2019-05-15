package com.kosmo.insomnia.service;

import java.util.List;
import java.util.Map;

public interface FreeBoardService{
	//목록용]
	List<FreeBoardDTO> selectList(Map map);
	
	//입력/수정/삭제]
	int insert(Map map);
	int delete(Map map);
	int update(Map map);
	
	//정보 가져오기
	FreeBoardDTO selectOne(Map map);
	
	//조회수]
	int update_views(Map map);
	
	//좋아요]
	int update_like(Map map);
	
	//싫어요]
	int update_hate(Map map);

}/////class
