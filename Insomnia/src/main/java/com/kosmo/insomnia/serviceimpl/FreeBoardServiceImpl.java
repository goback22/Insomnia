package com.kosmo.insomnia.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.insomnia.service.FreeBoardDTO;
import com.kosmo.insomnia.service.FreeBoardService;

@Service("freeService")
public class FreeBoardServiceImpl implements FreeBoardService{
	
	//FreeBoardDAO객체 주입
	@Resource(name="freeBoardDAO")
	private FreeBoardDAO dao;

	@Override
	public List<FreeBoardDTO> selectList(Map map) {
		return dao.selectList(map);
	}/////selectList

	@Override
	public int insert(Map map) {
		return dao.insert(map);
	}/////insert

	@Override
	public int delete(Map map) {
		return dao.delete(map);
	}/////delete

	@Override
	public int update(Map map) {
		return dao.update(map);
	}/////update

	@Override
	public FreeBoardDTO selectOne(Map map) {
		return dao.selectOne(map);
	}/////selectOne

	@Override
	public int update_views(Map map) {
		return dao.update_views(map);
	}/////update_views

	@Override
	public int update_like(Map map) {
		return dao.update_like(map);
	}/////update_like

	@Override
	public int update_hate(Map map) {
		return dao.update_hate(map);
	}/////update_hate
	
}//class