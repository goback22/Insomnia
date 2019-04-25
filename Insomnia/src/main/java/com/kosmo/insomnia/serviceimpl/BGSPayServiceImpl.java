package com.kosmo.insomnia.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.insomnia.service.BGSPayService;
import com.kosmo.insomnia.service.ListDTO;

@Service("bGSPayService")
public class BGSPayServiceImpl implements BGSPayService {
	
	@Resource(name="bGSPayDAO")
	private BGSPayDAO dao;

	@Override
	public int insert(Map map) {
		return dao.insert(map);
	}/////입력]

	@Override
	public int delete(Map map) {
		return 0;
	}/////삭제]
	
}/////class
