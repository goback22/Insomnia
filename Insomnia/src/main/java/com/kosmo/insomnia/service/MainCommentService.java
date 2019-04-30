package com.kosmo.insomnia.service;

import java.util.List;
import java.util.Map;

public interface MainCommentService {
	//목록용]
	List<Map> selectList(Map map);
	
	void insert(Map map);
	void update(Map map);
	void delete(Map map);
}
