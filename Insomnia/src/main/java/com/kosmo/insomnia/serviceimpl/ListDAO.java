package com.kosmo.insomnia.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.insomnia.service.ListDTO;
import com.kosmo.insomnia.service.ListService;

@Repository
public class ListDAO implements ListService {
	
	@Resource(name = "template") // template : root-context.xml에서 SqlSessionTemplate를 지칭하는 id이다.
	private SqlSessionTemplate template;
	
	@Override
	public boolean isMember(Map map) {
		return (Integer)template.selectOne("memberIsMember", map) == 0 ? false : true;
	}


	@Override
	public List<ListDTO> selectList(Map map) {
		return template.selectList("insSelectList",map);
	}

	@Override
	public int getTotalRecord(Map map) {
		return 0;
	}

	@Override
	public ListDTO selectOne(Map map) {
		return template.selectOne("insSelectOne",map);
	}

	@Override
	public int insert(Map map) {
		return template.insert("insInsert",map);
	}

	@Override
	public int update(Map map) {
		return template.update("insUpdate",map);
	}

	@Override
	public int delete(Map map) {
		return template.delete("insDelete",map);
	}
}