package com.kosmo.insomnia.serviceimpl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.insomnia.service.GoodNbadDTO;
import com.kosmo.insomnia.service.GoodNbadService;

@Service("goodService")
public class GoodNbadServiceImpl implements GoodNbadService{
	
	//FreeBoardDAO객체 주입
	@Resource(name="goodNbadDAO")
	private GoodNbadDAO dao;

	@Override
	public int insert(Map map) {
		return dao.insert(map);
	}

	@Override
	public GoodNbadDTO selectOne(Map map) {
		return dao.selectOne(map);
	}

	

	
	
}//class