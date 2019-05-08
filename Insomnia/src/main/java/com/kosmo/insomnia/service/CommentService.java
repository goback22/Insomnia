package com.kosmo.insomnia.service;

import java.util.List;
import java.util.Map;

public interface CommentService {
	//목록용]
	List<Map> selectList(Map map);
	
	//입력/수정/삭제]
	void insert(Map map);
	void delete(Map map);
	void update(Map map);
	
	//정보 가져오기
	CommentDTO selectOne(Map map);
	
	void reply(Map map);
	
	//댓글에 자식 댓글이 있는 지 확인하기
	boolean isChild(Map map);
}
