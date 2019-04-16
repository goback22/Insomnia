package com.kosmo.insomnia.service;

import java.util.List;
import java.util.Map;

public interface ListService {
	//로그인
	boolean isMember(Map map);
	
	//목록용
	List<ListDTO> selectList(Map map);
	
	//전체 레코드 수
	int getTotalRecord(Map map);
	
	//상세보기용
	ListDTO selectOne(Map map);
	
	//입력 수정 삭제
	int insert(Map map);
	int update(Map map);
	int delete(Map map);
}