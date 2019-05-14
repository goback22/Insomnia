package com.kosmo.insomnia.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.insomnia.service.BandDTO;
import com.kosmo.insomnia.service.BandImgDTO;
import com.kosmo.insomnia.service.BandMemberDTO;
import com.kosmo.insomnia.service.BandMusicDTO;
import com.kosmo.insomnia.service.BandService;
import com.kosmo.insomnia.service.BandSubmitDTO;
import com.kosmo.insomnia.service.BandSubmitWaitingDTO;
import com.kosmo.insomnia.service.RewardWaitingDTO;
import com.kosmo.insomnia.service.SeqDTO;

@Service("bandService")
public class BandServiceImpl implements BandService{
	
	@Resource(name="bandDAO")
	private BandDAO dao;
	
	@Override
	public List<BandMemberDTO> isMemberBand(String id) {
		return dao.isMemberBand(id);
	}////isMemberBand
	
	@Override
	public String getMemberProfile(String id) {
		return dao.getMemberProfile(id);
	}//getMemeberProfile
	
	@Override
	public void addNewBand(Map map) {
		dao.addNewBand(map);
	}//addNewBand
	
	@Override
	public BandDTO getBandDTOByB_no(String b_no) {
		return dao.getBandDTOByB_no(b_no);
	}//getBandDTOByNB_no
	
	@Override
	public boolean isMember(String id) {
		return dao.isMember(id);
	}//is Member
	
	@Override
	public String getB_noByB_name(String b_name) {
		return dao.getB_noByB_name(b_name);
	}//getB_noByB_name
	
	@Override
	public int addNewBandMember(Map bandMember) {
		return dao.addNewBandMember(bandMember);
	}//addNewBandMember
	
	@Override
	public boolean isExistBand(String b_name) {
		return dao.isExistBand(b_name);
	}//isExistBand
	
	@Override
	public BandDTO getBandDTOByB_name(String b_name) {
		return dao.getBandDTOByB_name(b_name);
	}///getBandDTOById
	
	@Override
	public List<BandSubmitWaitingDTO> getBandSubmitWaitingDTO(String b_no) {
		return dao.getBandSubmitWaitingDTO(b_no);
	}///getBandSubmitWaitng
	
	@Override
	public List<BandImgDTO> getBandImgDTO(String b_no) {
		return dao.getBandImgDTO(b_no);
	}///getBandImgDTO
	
	@Override
	public int getTotalBandImg(String b_no) {
		return dao.getTotalBandImg(b_no);
	}//getTotalBandImg
	
	@Override
	public int addBandImg(Map map) {
		String flag = isExistBandImg(map.get("newFileName").toString());
		if(flag != null) {
			return 0;
		}//if
		return dao.addBandImg(map);
	}//addBandImg
	
	@Override
	public String isExistBandImg(String newFileName) {
		return dao.isExistBandImg(newFileName);
	}//isExistBandImg
	
	@Override
	public List<BandMusicDTO> getPlayList(String b_no) {
		return dao.getPlayList(b_no);
	}//getPlayList
	
	@Override
	public int getTotalBandMusic(String b_no) {
		return dao.getTotalBandMusic(b_no);
	}//getTotalBandMusic
	
	@Override
	public int addBandMusic(BandMusicDTO dto) {
		return dao.addBandMusic(dto);
	}//addBandMusic
	
	@Override
	public int addBandSubmitWaiting(BandSubmitWaitingDTO dto) {
		return dao.addBandSubmitWaiting(dto);
	}//addBandSubmitWaiting
	
	@Override
	public int addRewardWaiting(RewardWaitingDTO dto) {
		return dao.addRewardWaiting(dto);
	}///rewardWaiting
	
	@Override
	public List<BandMusicDTO> getListBandMusicDTO(String b_no) {
		return dao.getListBandMusicDTO(b_no);
	}///getListbandMusciDTO
	
	@Override
	public List<RewardWaitingDTO> getListRewardWaitingDTO(String sw_no) {
		return dao.getListRewardWaitingDTO(sw_no);
	}//getListRewardWaitingDTO
	
	@Override
	public List<BandDTO> allBand() {
		return dao.allBand();
	}//allBand
	
	@Override
	public int acceptBandSubmitWaiting(String b_no) {
		return dao.acceptBandSubmitWaiting(b_no);
	}//acceptBandSubmitWaiting
	
	@Override
	public int completeBandSubmitWaiting(String sw_no) {
		return dao.completeBandSubmitWaiting(sw_no);
	}//completeBandSubmitWaiting
	
	@Override
	public int addBandSubmit(BandSubmitDTO dto) {
		return dao.addBandSubmit(dto);
	}//addBandSubmit
	
	@Override
	public BandSubmitDTO getBandSubmitDTO(String sw_no) {
		return dao.getBandSubmitDTO(sw_no);
	}//beanSubmitDTO
	
	@Override
	public int getSeq_band(SeqDTO dto) {
		return dao.getSeq_band(dto);
	}//getSeq_band
	
	@Override
	public BandSubmitDTO getBandSubmitDTOByS_no(String s_no) {
		return dao.getBandSubmitDTOByS_no(s_no);
	}//getBandSubmitDTOByS_no

	@Override
	public int like_follow_insert(Map map) {
		return dao.like_follow_insert(map);
	}

	@Override
	public int like_follow_delete(Map map) {
		return dao.like_follow_delete(map);
	}
	

	@Override
	public int getLikeNFollow(Map map) {
		return dao.getLikeNFollow(map);
	}

	@Override
	public int getBandLikeNFollow(Map map) {
		return dao.getBandLikeNFollow(map);
	}

	@Override
	public List<BandDTO> getLikeBand(Map map) {
		return dao.getLikeBand(map);
	}

	@Override
	public int distinguishLike(Map map) {
		return dao.distinguishLike(map);
	}

	
	
}//class BandServiceImpl
