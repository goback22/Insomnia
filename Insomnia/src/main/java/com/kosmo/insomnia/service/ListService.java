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
	
	//이전글
	ListDTO prevSelectOne(Map map);
	//다음글
	ListDTO nextSelectOne(Map map);
	
	//조회수
	int updateVisitCount(Map map);
	
	//조회 높은 순으로 목록 뿌리기
	List<ListDTO> readDesc(Map map);
	//조회 낮은 순으로 목록 뿌리기
	List<ListDTO> readAsc(Map map);
}