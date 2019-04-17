package com.kosmo.insomnia.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.insomnia.service.RewardDTO;
import com.kosmo.insomnia.service.RewardService;

@Service
public class RewardServiceImpl implements RewardService {

	@Resource(name="rewardDAO")
	private RewardDAO dao;
	
	
	@Override
	public List<RewardDTO> selectList(Map map) {
		return dao.selectList(map);
	}

	@Override
	public RewardDTO selectOne(Map map) {
		return dao.selectOne(map);
	}

	@Override
	public int delete() {
		return dao.delete();
	}

	@Override
	public int insert() {
		return dao.insert();
	}

	@Override
	public int update() {
		return dao.update();
	}

}