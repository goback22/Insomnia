package com.kosmo.insomnia.service;

import java.util.List;
import java.util.Map;


public interface MemberService {
	
	List<MemberDTO> selectList();
	
	
	int getTotalRecord(Map map);
	//상세보기용]
	MemberDTO selectOne(Map map);
	//입력/수정/삭제용]
	int delete(Map map);
	int insert(Map map);
	int update(Map map);
	
	//사진 등록
	int updateProfile(Map map);
		
	//소셜 로그인
	boolean isSocialMember(Map map);
	
	//소셜 회원가입
	boolean socialRegister(Map map);
	
	//소셜 추가정보
	int socialUpdate(Map map);
	
	//아이디 중복확인
	int checkSignup(String id);
	
	//비밀번호 수정
	int changePassword(Map map);
	
	//이메일로 아이디 찾기
	MemberDTO getIdByEmail(Map map);
	
	//이메일 수정
	int editEmail(Map map);
	
	//전화번호 수정
	int editPhone(Map map);
	
	
}