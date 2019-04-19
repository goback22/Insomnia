package com.kosmo.insomnia.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.insomnia.service.ListDTO;
import com.kosmo.insomnia.service.ListService;

@Service("insService")
public class ListServiceImpl implements ListService{
	
	//OneMemoDAO객체 주입
	@Resource(name="listDAO")
	private ListDAO dao;
	
	@Override
	public boolean isMember(Map map) {
		return dao.isMember(map);
	}

	@Override
	public List<ListDTO> selectList(Map map) {
		return dao.selectList(map);
	}

	@Override
	public int getTotalRecord(Map map) {
		return dao.getTotalRecord(map);
	}

	@Override
	public ListDTO selectOne(Map map) {
		return dao.selectOne(map);
	}

	@Override
	public int insert(Map map) {
		return dao.insert(map);
	}

	@Override
	public int update(Map map) {
		return dao.update(map);
	}

	@Override
	public int delete(Map map) {
		return dao.delete(map);
	}

	@Override
	public ListDTO prevSelectOne(Map map) {
		return dao.prevSelectOne(map);
	}

	@Override
	public ListDTO nextSelectOne(Map map) {
		return dao.nextSelectOne(map);
	}

	@Override
	public int updateVisitCount(Map map) {
		System.out.println("impl");
		return dao.updateVisitCount(map);
	}

}//class