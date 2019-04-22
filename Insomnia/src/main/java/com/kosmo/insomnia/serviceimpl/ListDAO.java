package com.kosmo.insomnia.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.insomnia.service.ListDTO;
import com.kosmo.insomnia.service.ListService;
import com.sun.org.apache.bcel.internal.generic.LMUL;

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
		return template.selectOne("insTotalCount", map);
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


	@Override
	public ListDTO prevSelectOne(Map map) {
		return template.selectOne("prevSelect",map);
	}


	@Override
	public ListDTO nextSelectOne(Map map) {
		return template.selectOne("nextSelect",map);
	}

	//조회 수 업데이트
	@Override
	public int updateVisitCount(Map map) {
		System.out.println("dao");
		return template.update("updateVisit",map);
	}

	//조회 높은순
	@Override
	public List<ListDTO> readDesc(Map map) {
		return template.selectList("readDesc",map);
	}
	
	//조회 낮은순
	@Override
	public List<ListDTO> readAsc(Map map) {
		return template.selectList("readAsc",map);
	}
}