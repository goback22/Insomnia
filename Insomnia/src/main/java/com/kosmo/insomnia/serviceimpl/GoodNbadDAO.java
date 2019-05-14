package com.kosmo.insomnia.serviceimpl;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.insomnia.service.GoodNbadDTO;
import com.kosmo.insomnia.service.GoodNbadService;

@Repository
public class GoodNbadDAO implements GoodNbadService {
	
	@Resource(name = "template") // template : root-context.xml에서 SqlSessionTemplate를 지칭하는 id이다.
	private SqlSessionTemplate template;

	@Override
	public int insert(Map map) {
		return template.insert("gd_insert", map);
	}

	@Override
	public GoodNbadDTO selectOne(Map map) {
		return template.selectOne("gd_selectone", map);
	}

	

	
	
}/////class