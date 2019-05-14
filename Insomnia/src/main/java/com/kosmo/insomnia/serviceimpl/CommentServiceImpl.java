package com.kosmo.insomnia.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.insomnia.service.CommentDTO;
import com.kosmo.insomnia.service.CommentService;

@Service("commentService")
public class CommentServiceImpl implements CommentService {
	
	@Resource(name="commentDAO")
	private CommentDAO dao;

	@Override
	public List<Map> selectList(Map map) {
		return dao.selectList(map);
	}

	@Override
	public void insert(Map map) {
		dao.insert(map);
	}

	@Override
	public void delete(Map map) {
		dao.delete(map);
	}

	@Override
	public void update(Map map) {
		dao.update(map);
	}

	@Override
	public CommentDTO selectOne(Map map) {
		return dao.selectOne(map);
	}

	@Override
	public void reply(Map map) {
		dao.reply(map);
	}

	@Override
	public boolean isChild(Map map) {
		System.out.println("여기는 오는건가요..?");
		System.out.println("mapmapmap:"+map);
		return dao.isChild(map);
	}

	@Override
	public List<Map> newSelectList(Map map) {
		return dao.newSelectList(map);
	}

	@Override
	public void replyBeforeUpdate(Map map) {
		dao.replyBeforeUpdate(map);
	}

}//class