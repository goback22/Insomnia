package com.kosmo.insomnia.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

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

	
	
	
}/////
