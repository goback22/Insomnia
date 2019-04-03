package com.kosmo.insomnia.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.insomnia.service.SupportersDTO;
import com.kosmo.insomnia.service.SupportersService;
@Service
public class SupportersServiceImpl implements SupportersService{

	@Resource(name="supportersDAO")
	private SupportersDAO dao;
	
	@Override
	public List<SupportersDTO> selectList() {
		return dao.selectList();
	}
	
}
