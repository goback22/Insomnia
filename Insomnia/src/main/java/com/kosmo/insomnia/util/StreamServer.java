package com.kosmo.insomnia.util;

import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import javax.annotation.Resource;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kosmo.insomnia.service.MemberDTO;
import com.kosmo.insomnia.serviceimpl.BandServiceImpl;

public class StreamServer extends TextWebSocketHandler{

	//접속한 클라이언트를 저장하기 위한 속성
	private Map<String, WebSocketSession> clients = new HashMap<String, WebSocketSession>();
	
	@Resource(name = "bandService")
	BandServiceImpl bandService;
	
	
	
	/*
	 * 통신 규약 설정
	 * 
	 * tokenizer 문자기준 분류$메세지
	 * 
	 */
	
	
	
	////클라이언트와 연결이 끊어졌을때 호출되는 콜백 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed : " +session.getId() );
		//클라이언트에서 제거
		clients.remove(session.getId());
		
		//이름 얻어와서 퇴장 메세지 뿌려주기
		/*
		String name = bandService.getMemberDTO(session.getId()).getName();
		for(WebSocketSession client : clients.values()) {
			client.sendMessage(new TextMessage("off$"+name+"님이 퇴장하셨습니다."));
		}//for
		*/
	}/////afterConnectionClosed
	
	
	//클라이언트와 연결이 되었을 때 호출되는 콜백 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished : " + session.getId());
		//클라이언트에 추가
		clients.put(session.getId(), session);
		
	}//afterConnectionEstablished
	

	//클라이언트로부터 메세지를 받았을때 자동 호출되는 콜백 메소드
	//클라이언트로부터 전송되는 모든 메세지 처리
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage : " + message.getPayload());
		
		
		//1] 메세지 받기
		String id = session.getId();
		String msg = message.getPayload();
		
		//2] 분석하기
		StringTokenizer st = new StringTokenizer(msg, "$");
		String protocol = st.nextToken();
		String name = null;
		
		switch(protocol) {
		case "entrance" : 
			name = bandService.getMemberDTO(st.nextToken()).getName();
			for(WebSocketSession client : clients.values()) {
				client.sendMessage(new TextMessage("entrance$"+name+"님이 입장하셨습니다."));
			}//for
			break;
		case "off" : 
			name = bandService.getMemberDTO(st.nextToken()).getName();
			for(WebSocketSession client : clients.values()) {
				client.sendMessage(new TextMessage("off$"+name+"님이 퇴장하셨습니다."));
			}//for
			break;
		case "msg" :
			String userId = st.nextToken();
			MemberDTO member = bandService.getMemberDTO(userId);
			if(member.getProfile_img().equals("default_cover_img.jpg")) {
				member.setProfile_img("/insomnia/upload/member/profile/"+member.getProfile_img());
			}//
			else if(member.getProfile_img().startsWith("http")){}
			else {
				member.setProfile_img("https://s3.ap-northeast-2.amazonaws.com/insomnia4/cover_Image/"+member.getProfile_img());
			}///프로필 이미지 설정
			String sendMsg = st.nextToken();
			System.out.println(sendMsg);
			for(WebSocketSession client : clients.values()) {
				client.sendMessage(new TextMessage("msg$"+member.getName()+"$"+member.getProfile_img()+"$"+ sendMsg+"$"+userId));
			}///모두 메세지 뿌려주기
		case "error":
			System.out.println("error : "+ message.getPayload());break;
		default : 
			System.out.println("분석되지 않은 메세지 : " +protocol);
		}///parseMsg
		
		////분석 후
		//3] id로 정보 가져오기
		
		
	}//handleTextMessage
	
	
	//클라이언트와 통신장애시 자동으로 호출되는 메소드
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println(session.getId() + "와 통신 장애 발생 : " +  exception.getMessage());
	}///handleTransportError
	
}///class StreamServer
