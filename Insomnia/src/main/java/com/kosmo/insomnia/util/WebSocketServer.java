package com.kosmo.insomnia.util;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kosmo.insomnia.service.MemberDTO;
import com.kosmo.insomnia.serviceimpl.MemberDAO;

public class WebSocketServer extends TextWebSocketHandler {
   // 접속한 클라이언트를 저장하기 위한 속성(멤버변수)]
   private Map<String, WebSocketSession> clients = new HashMap<String, WebSocketSession>();

   @Resource(name = "memberDAO")
   MemberDAO dao;

   // 클라이언트와 연결이 끊었졌을때 호출되는 콜백 메소드]
   // -컬렉션에 저장된 클라이언트 삭제
   @Override
   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
      System.out.println(session.getId() + "연결이 끊어젔어요");
      clients.remove(session.getId());
   }///////////////////////

   // 클라이언트와 연결이 되었을때 호출되는 콜백 메소드]
   // -컬렉션에 연결된 클라이언트 추가
   @Override
   public void afterConnectionEstablished(WebSocketSession session) throws Exception {
      System.out.println(session.getId() + "연결했어요");
      clients.put(session.getId(), session);
   }
   // 클라이언트로 부터 메시지를 받았을때 자동 호출되는 콜백 메소드]
   // 클라이언트로부터 전송되는 모든 메시지 처리

   @Override
   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
      System.out.println(session.getId() + "로부터 받은 메시지:" + message.getPayload());
      Map map = new HashMap();
      map.put("id", message.getPayload().toString().split(":")[1].trim());
      MemberDTO dto = dao.selectOne(map);
      System.out.println("dtoname:" + dto.getName());
      System.out.println("dtoProfileImg:" + dto.getProfile_img());

//      //접속한 모든 클라이언트에게 session.getId()가 보낸
//      //메시지 뿌려주기]
      String name = dto.getName();
      String profile_img = dto.getProfile_img();

      System.out.println("WebsocketServer.java:name" + name);
      System.out.println("WebsocketServer.java:name" + profile_img);

      for (WebSocketSession client : clients.values()) {
//         if(session.getId() != client.getId())//자기가 보낸 메시지를 다시 받지 않도록
      client.sendMessage(new TextMessage(name + ":" + profile_img + ":" + message.getPayload()));
      System.out.println(new TextMessage(name + ":" + profile_img + ":" + message.getPayload()));
//            client.sendMessage(message);
//         System.out.println(client.getId()+"이가 보낸 메시지:"+message.getPayload());
      }
   }
   // 클라이언트와 통신장애시 자동으로 호출되는 메소드]

   @Override
   public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
      System.out.println(session.getId() + "와 통신 장애 발생:" + exception.getMessage());
   }
}