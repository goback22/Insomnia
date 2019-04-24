package com.kosmo.insomnia.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.insomnia.service.BGSConcertDTO;
import com.kosmo.insomnia.service.BGSConcertService;
import com.kosmo.insomnia.service.ListDTO;

@Service("bGSConcertService")
public class BGSConcertServiceImpl implements BGSConcertService {
	
	@Resource(name="bGSConcertDAO")
	private BGSConcertDAO dao;

	@Override
	public List<Map> selectList() {
		return dao.selectList();
	}

	@Override
	public List<BGSConcertDTO> selectMyList(Map map) {
		return dao.selectMyList(map);
	}

	@Override
	public int getCount(Map map) {
		return dao.getCount(map);
	}

	
}/////
