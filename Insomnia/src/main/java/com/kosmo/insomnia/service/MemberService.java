package com.kosmo.insomnia.service;

import java.util.List;
import java.util.Map;


public interface MemberService {
	List<MemberDTO> selectList();
	
	boolean isMember(Map map);
	
	int getTotalRecord(Map map);
	//상세보기용]
	MemberDTO selectOne(Map map);
	//입력/수정/삭제용]
	int delete(Map map);
	int insert(Map map);
	int update(Map map);
	
}
