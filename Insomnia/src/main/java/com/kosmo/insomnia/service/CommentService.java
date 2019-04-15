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
}
