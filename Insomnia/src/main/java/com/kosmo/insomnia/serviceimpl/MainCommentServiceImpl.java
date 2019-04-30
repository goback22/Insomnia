package com.kosmo.insomnia.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.insomnia.service.CommentService;

@Service("mainCommentService")
public class MainCommentServiceImpl implements CommentService{
	//DAO 주입받기
	@Resource(name="mainCommentDAO")
	private MainCommentDAO dao;
	
	//목록
	@Override
	public List<Map> selectList(Map map) {
		return dao.selectList(map);
	}

	//작성
	@Override
	public void insert(Map map) {
		dao.insert(map);
	}

	//삭제
	@Override
	public void delete(Map map) {
		dao.delete(map);
	}

	//수정
	@Override
	public void update(Map map) {
		dao.update(map);
	}
}
