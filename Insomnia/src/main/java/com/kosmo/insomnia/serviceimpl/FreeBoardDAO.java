package com.kosmo.insomnia.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.insomnia.service.FreeBoardDTO;
import com.kosmo.insomnia.service.FreeBoardService;
import com.kosmo.insomnia.service.ListDTO;
import com.kosmo.insomnia.service.ListService;
import com.sun.org.apache.bcel.internal.generic.LMUL;

@Repository
public class FreeBoardDAO implements FreeBoardService {
	
	@Resource(name = "template") // template : root-context.xml에서 SqlSessionTemplate를 지칭하는 id이다.
	private SqlSessionTemplate template;

	@Override
	public List<FreeBoardDTO> selectList(Map map) {
		return template.selectList("freeselectlist", map);
	}

	@Override
	public int insert(Map map) {
		return template.insert("freeinsert", map);
	}/////insert

	@Override
	public int delete(Map map) {
		return template.delete("freedelete",map);		
	}/////delete

	@Override
	public int update(Map map) {
		return template.update("freeupdate",map);
	}/////update

	@Override
	public FreeBoardDTO selectOne(Map map) {
		return template.selectOne("freeselectone", map);
	}/////selectOne

	@Override
	public int update_views(Map map) {
		return template.update("freeupdate_views", map);
	}/////update_views

	@Override
	public int update_like(Map map) {
		return template.update("freeupdate_like", map);
	}

	@Override
	public int update_hate(Map map) {
		return template.update("freeupdate_hate", map);
	}

	
	
}/////class