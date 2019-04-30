package com.kosmo.insomnia.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.insomnia.service.CommentService;

@Repository
public class MainCommentDAO implements CommentService{
	// SqlSessionTemplate객체 주입]
	@Resource(name = "template")
	private SqlSessionTemplate template;
	
	@Override
	public List<Map> selectList(Map map) {
		return template.selectList("mainCommentSelectList",map);
	}

	@Override
	public void insert(Map map) {
		template.insert("mainCommentInsert",map);
		
	}

	@Override
	public void delete(Map map) {
		template.delete("mainCommentDelete",map);
		
	}

	@Override
	public void update(Map map) {
		template.update("mainCommentUpdate",map);
	}

}//class