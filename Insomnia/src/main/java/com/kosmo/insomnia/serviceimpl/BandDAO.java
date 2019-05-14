package com.kosmo.insomnia.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.insomnia.service.BandDTO;
import com.kosmo.insomnia.service.BandImgDTO;
import com.kosmo.insomnia.service.BandMemberDTO;
import com.kosmo.insomnia.service.BandMusicDTO;
import com.kosmo.insomnia.service.BandService;
import com.kosmo.insomnia.service.BandSubmitDTO;
import com.kosmo.insomnia.service.BandSubmitWaitingDTO;
import com.kosmo.insomnia.service.RewardWaitingDTO;
import com.kosmo.insomnia.service.SeqDTO;

@Repository
public class BandDAO implements BandService {

	@Resource(name = "template")
	private SqlSessionTemplate template;
	
	@Override
	public List<BandMemberDTO> isMemberBand(String id) {
		return template.selectList("isBandMember", id);
	}//isMemberBand
	
	@Override
	public String getMemberProfile(String id) {
		return template.selectOne("getMemberProfileImg", id);
	}//getMemberProfile
	
	@Override
	public void addNewBand(Map map) {
		template.insert("addNewBand", map);
	}///addNewBand
	
	@Override
	public BandDTO getBandDTOByB_no(String b_no) {
		return template.selectOne("getBandDTOByB_no", b_no);
	}//getBandDTOByB_no
	
	@Override
	public boolean isMember(String id) {
		return template.selectOne("isMember_createNewBand", id) == null ? false : true;
	}//isMember
	
	@Override
	public String getB_noByB_name(String b_name) {
		return template.selectOne("getB_noByB_name", b_name);
	}//getB_noBy_name
	
	@Override
	public int addNewBandMember(Map bandMember) {
		return template.insert("addNewBandMember", bandMember);
	}//addNewBandMember
	
	@Override
	public boolean isExistBand(String b_name) {
		List<BandDTO> result = template.selectList("isExistBand", b_name);
		return result.size() == 0 ? false : true;
	}//isExistBand
	
	@Override
	public BandDTO getBandDTOByB_name(String b_name) {
		return template.selectOne("getBandDTOByB_name", b_name);
	}//getBandDTOById
	
	@Override
	public List<BandSubmitWaitingDTO> getBandSubmitWaitingDTO(String b_no) {
		return template.selectList("getBandSubmitWaitingDTOList", b_no);
	}///getBandSubmitWatingDTO
	
	@Override
	public List<BandImgDTO> getBandImgDTO(String b_no) {
		return template.selectList("getBandImgDTOList", b_no);
	}//getBandImgDTO
	
	@Override
	public int getTotalBandImg(String b_no) {
		return template.selectOne("getTotalBandImg", b_no);
	}///getTotalBandImg
	
	@Override
	public int addBandImg(Map map) {
		return template.insert("addBandImg", map);
	}//addBandImg
	
	@Override
	public String isExistBandImg(String newFileName) {
		System.out.println(newFileName);
		return template.selectOne("isExistBandImg", newFileName);
	}//isExistBandImg
	
	@Override
	public List<BandMusicDTO> getPlayList(String b_no) {
		return template.selectList("getPlayList", b_no);
	}//getPlayList
	
	@Override
	public int getTotalBandMusic(String b_no) {
		return template.selectOne("getTotalBandMusic", b_no);
	}///getTotalBandMusic
	
	@Override
	public int addBandMusic(BandMusicDTO dto) {
		return template.insert("addBandMusic", dto);
	}//addBandMusic
	
	@Override
	public int addBandSubmitWaiting(BandSubmitWaitingDTO dto) {
		return template.insert("addBandSubmitWaiting", dto);
	}//addBandSubmitWaiting
	
	@Override
	public int addRewardWaiting(RewardWaitingDTO dto) {
		return template.insert("addRewardWaiting", dto);
	}//rewardWaiting
	
	@Override
	public List<BandMusicDTO> getListBandMusicDTO(String b_no) {
		return template.selectList("getListBandMusicDTO", b_no);
	}///getListBandMusciDTO
	
	@Override
	public List<RewardWaitingDTO> getListRewardWaitingDTO(String sw_no) {
		return template.selectList("getListRewardWaitingDTO", sw_no);
	}//getListRewardWaitingDTO
	
	@Override
	public List<BandDTO> allBand() {
		return template.selectList("allBand");
	}//allBand()
	
	@Override
	public int acceptBandSubmitWaiting(String b_no) {
		return template.update("acceptBandSubmitWaiting", b_no);
	}//acceptBandSubmitWaiting
	
	@Override
	public int completeBandSubmitWaiting(String sw_no) {
		return template.update("completeBandSubmitWaiting", sw_no);
	}///completeBandSumbitWaiting
	
	@Override
	public int addBandSubmit(BandSubmitDTO dto) {
		return template.update("addBandSubmit", dto);
	}//addBandSubmit
	
	@Override
	public BandSubmitDTO getBandSubmitDTO(String sw_no) {
		return template.selectOne("getBandSubmitDTO", sw_no);
	}//getBandSubmitDTO
	
	@Override
	public int getSeq_band(SeqDTO dto) {
		return template.insert("getSeq_band", dto);
	}///getSeq_band
	
	@Override
	public BandSubmitDTO getBandSubmitDTOByS_no(String s_no) {
		return template.selectOne("getBandSubmitDTOByS_no", s_no);
	}///getBandSubmitDTOByS_no

	@Override
	public int like_follow_insert(Map map) {
		return template.insert("like_follow_insert", map);
	}

	@Override
	public int like_follow_delete(Map map) {
		return template.delete("like_follow_delete", map);
	}

	@Override
	public int getLikeNFollow(Map map) {
		return template.selectOne("getLikeNFollow", map);
	}

	@Override
	public int getBandLikeNFollow(Map map) {
		return template.selectOne("getBandLikeNFollow", map);
	}

	@Override
	public List<BandDTO> getLikeBand(Map map) {
		return template.selectList("getLikeBand", map);
	}

	@Override
	public int distinguishLike(Map map) {
		return template.selectOne("distinguishLike", map);
	}

	
	
	

	
}// class BandDAO
