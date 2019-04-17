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

}
