package com.kosmo.insomnia.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.insomnia.service.CommentService;

@Repository
public class CommentDAO implements CommentService{
	//SqlSessionTemplate객체 주입]
	@Resource(name="template")
	private SqlSessionTemplate template;

	@Override
	public List<Map> selectList(Map map) {
		return template.selectList("commentSelectList",map);
	}

	@Override
	public void insert(Map map) {
		template.insert("commentInsert",map);
	}

	@Override
	public void delete(Map map) {
		template.delete("commentDelete",map);
	}

	@Override
	public void update(Map map) {
		template.update("commentUpdate",map);
	}

}
