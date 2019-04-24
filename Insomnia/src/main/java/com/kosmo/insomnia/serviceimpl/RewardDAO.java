package com.kosmo.insomnia.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.kosmo.insomnia.service.RewardDTO;
import com.kosmo.insomnia.service.RewardService;

@Repository
public class RewardDAO implements RewardService {
	
	@Resource(name="template")
	private SqlSessionTemplate template;

	@Override
	public List<RewardDTO> selectList(Map map) {
		return template.selectList("selectList_reward", map);
	}

	@Override
	public RewardDTO selectOne(Map map) {
		return template.selectOne("selectOne_reward", map);
	}

	@Override
	public int delete() {
		return template.delete("delete_reward");
	}

	@Override
	public int insert() {
		return template.insert("insert_reward");
	}

	@Override
	public int update() {
		return template.update("update_reward");
	}
	
	//조건을 만족하는 행의 수 - 마이페이지에서 '내가' 구매한 리워드의 수를 위해.
	@Override
	public int getCount(Map map) {
		return template.selectOne("getCount_reward", map);
	}
	//전체 행의 수 
	@Override
	public int getTotalCount(Map map) {
		return template.selectOne("getTotalCount_reward", map);
	}

}
