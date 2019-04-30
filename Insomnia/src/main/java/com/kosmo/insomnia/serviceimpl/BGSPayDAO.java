package com.kosmo.insomnia.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.insomnia.service.BGSPayDTO;
import com.kosmo.insomnia.service.BGSPayService;

@Repository("bGSPayDAO")
public class BGSPayDAO implements BGSPayService{
		// Mybatis 사용을 위한 SqlSessionTemplate객체 주입]
		@Resource(name = "template")
		private SqlSessionTemplate template;

		@Override
		public int insert(Map map) {
			System.out.println("map"+map);
			return template.insert("subPayInsert",map);
			
		}/////

		@Override
		public int delete(Map map) {
			return template.delete("subPayDelete",map);
		}/////

		@Override
		public BGSPayDTO selectOne(Map map) {
			return template.selectOne("subPaySelectOne",map);
		}/////
	
}/////class

