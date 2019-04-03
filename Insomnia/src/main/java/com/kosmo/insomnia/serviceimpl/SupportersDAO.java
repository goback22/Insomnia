package com.kosmo.insomnia.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.insomnia.service.SupportersDTO;
import com.kosmo.insomnia.service.SupportersService;

@Repository
public class SupportersDAO implements SupportersService{
	//SqlSessionTemplate객체 주입]
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	
	@Override
	public List<SupportersDTO> selectList() {
		return template.selectList("supportSelectList");
	}
	
}
