package com.kosmo.insomnia.service;

import java.util.List;
import java.util.Map;

public interface CommentService {
	//목록용]
	List<Map> selectList(Map map);
	
	//스크롤 시 세롭게 생기는 목록]
	List<Map> newSelectList(Map map);
	
	//입력/수정/삭제]
	void insert(Map map);
	void delete(Map map);
	void update(Map map);
	
	//정보 가져오기
	CommentDTO selectOne(Map map);
	
	
	//답변 등록 전 이전 글들의 STEP을 1씩 높여야한다.
	void replyBeforeUpdate(Map map);
	
	//답변 등록
	void reply(Map map);
	
	//댓글에 자식 댓글이 있는 지 확인하기
	boolean isChild(Map map);
}
