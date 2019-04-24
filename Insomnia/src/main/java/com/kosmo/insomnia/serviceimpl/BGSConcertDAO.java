package com.kosmo.insomnia.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.insomnia.service.BGSConcertDTO;
import com.kosmo.insomnia.service.BGSConcertService;

@Repository("bGSConcertDAO")
public class BGSConcertDAO implements BGSConcertService{
		// SqlSessionTemplate객체 주입]
		@Resource(name = "template")
		private SqlSessionTemplate template;
		
		public List<Map> selectList() {
			return template.selectList("bGSConcertSelectList");
		}

		@Override
		public List<BGSConcertDTO> selectMyList(Map map) {
			return template.selectList("selectMyList_bgsconcert", map);
		}

		@Override
		public int getCount(Map map) {
			return template.selectOne("getCount_bgsconcert", map);
		}


	
}/////class

