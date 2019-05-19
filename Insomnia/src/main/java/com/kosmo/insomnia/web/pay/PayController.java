package com.kosmo.insomnia.web.pay;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;
import java.util.Vector;

import javax.annotation.Resource;
import javax.annotation.Resources;
import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.insomnia.service.BandDTO;
import com.kosmo.insomnia.service.MemberDTO;
import com.kosmo.insomnia.service.RewardDTO;
import com.kosmo.insomnia.serviceimpl.BandServiceImpl;
import com.kosmo.insomnia.util.login.MailHandler;

@Controller
public class PayController {
	
	@Resource(name="bandService")
	private BandServiceImpl bandService;
	
	//결제페이지[서브]로 이동]
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/Pay/PayPage.ins")
	public String payPage(@RequestParam Map map,Map view,HttpSession session) throws Exception{
		view.put("name", session.getAttribute("login_user_name"));
		view.put("email", session.getAttribute("id"));
		view.put("phone_num", session.getAttribute("login_user_phoneNb"));
		
		StringTokenizer st = new StringTokenizer(view.get("email").toString(), "@");
		view.put("email_first",st.nextToken());
		view.put("email_second", st.nextToken());
		
		view.put("phone_first", view.get("phone_num").toString().substring(2,6));
		view.put("phone_second", view.get("phone_num").toString().substring(6));	
			
		return "/Pay/SubPayPage.tiles";
	}///payPage()
	
	@RequestMapping("/kakao/pay.ins")
	public String kakaopay() throws Exception{
		return "/Pay/Androidkakao.tiles";
	}
	
	
	
	
	
	@RequestMapping(value="/Pay/MainPayPage.ins")
	public String mainPayPage(@RequestParam Map map, Model model, HttpSession session) throws Exception{
		//////////////////////////////////reward info parsing
		//id얻어오기
		String id = session.getAttribute("id").toString();;
		//모델에 넣어 반환할 list선언
		List<RewardDTO> resultList = new Vector<RewardDTO>();
		//b_no를 받아서 bandInfo를 받아 넣어주자.
		String b_no = map.get("b_no").toString();
		BandDTO bandDto = bandService.getBandDTOByB_no(b_no);
		
		//rw_no를 얻어와서 reward정보를 조회하고 dto를 넣어주자.
		Set<String> keys = map.keySet();
		for(String key : keys) {
			Map resultMap = new HashMap();
			if(key.equals("support")) {
				RewardDTO rewardDto = new RewardDTO();
				rewardDto.setSupport(String.valueOf(map.get(key))); // int로 넘어올 시 스트링형으로 반환
				resultList.add(rewardDto); //후원금(support)항목만 넣고 반환 / 나머지 정보는 view페이지에서 채워준다.
				rewardDto.setB_no(bandDto.getB_no());
				rewardDto.setB_album_cover(bandDto.getB_album_cover());
				break;
			}//if
			RewardDTO rewardDto = bandService.getRewardDTO(String.valueOf(key));
			rewardDto.setCount(map.get(key).toString());
			rewardDto.setB_no(b_no);
			rewardDto.setB_album_cover(bandDto.getB_album_cover());
			rewardDto.setB_name(bandDto.getB_name());
			resultList.add(rewardDto);
		}//for
		model.addAttribute("rewards", resultList);
		
		
		/////////////////////////////// id로 사용자 정보 불러오기
		MemberDTO memberDto = bandService.getMemberDTO(id);
		model.addAttribute("member", memberDto);
		model.addAttribute("band", bandDto);
		
		//우편번호 넣기
		StringTokenizer ship = new StringTokenizer(memberDto.getShipping_address(),"^");
		model.addAttribute("roadAddress", ship.nextToken());
		model.addAttribute("jibunAddress",ship.hasMoreTokens() ? ship.nextToken().toString() : null);
		model.addAttribute("detailAddress", ship.hasMoreTokens() ? ship.nextToken().toString() : null);
		model.addAttribute("extraAddress", ship.hasMoreTokens() ? ship.nextToken().toString() : null);
		
		StringTokenizer st = new StringTokenizer(memberDto.getEmail(), "@");
		model.addAttribute("name", memberDto.getName());
		
		model.addAttribute("email_first", st.nextToken());
		model.addAttribute("email_second", st.nextToken());
		
		model.addAttribute("phone_first", memberDto.getPhone().substring(2, 6));
		model.addAttribute("phone_second", memberDto.getPhone().substring(6));
		
		return "Pay/MainPayPage.tiles";
	}///mainPayPage

}/////class
