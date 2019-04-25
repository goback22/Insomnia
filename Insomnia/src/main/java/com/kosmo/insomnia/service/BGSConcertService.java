package com.kosmo.insomnia.service;

import java.util.List;
import java.util.Map;

public interface BGSConcertService {
	//목록용]
	List<Map> selectList();
	
	//마이 페이지 목록용]
    List<BGSConcertDTO> selectMyList(Map map);
   
    //마이 페이지 페이징용  - totalCount가 아님에 주의
    int getCount(Map map);
	
}/////interface
