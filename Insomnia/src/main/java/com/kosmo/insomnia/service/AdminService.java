package com.kosmo.insomnia.service;

import java.util.List;
import java.util.Map;

public interface AdminService {

	//전체보기
	List<AdminDTO> selectList(Map map);
	List<AdminDTO> selectBandList(Map map);
	List<AdminDTO> selectBandMusicList(String string);
	//상세보기
	AdminDTO selectOne(Map map);
	
	
	//입력/수정/삭제용]
	int delete(Map map);
	int insert(Map map);
	int update(Map map);
	
	//천제 레코드
	int getTotalRecord(Map map);
}
