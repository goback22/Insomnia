<%@page import="java.util.Scanner"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.google.android.gcm.server.Result"%>
<%@page import="java.util.List"%>
<%@page import="com.google.android.gcm.server.MulticastResult"%>
<%@page import="com.google.android.gcm.server.Message"%>
<%@page import="com.google.android.gcm.server.Sender"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	//token값저장용
    ArrayList<String> token = new ArrayList<String>();  
	
	 
    //Firebase Console->프로젝트 선택->설정->프로젝트 설정
    //->클라우드 메시징->서버키 복사
    String simpleApiKey = "AAAAdxhW5go:APA91bEOM7vrXSiQusce7meRsZNwU_2ZRBXjT1WF_dW1EjMrh-k2BlAzzx61OWg_0JxhMBltse2Ps40pJJobsLCWAw8z2BkU85h7V_NTqNHQQ2oX40dPW0p5tveRAX3h7TMXM5KzvH8M";
    //String gcmURL = "https://android.googleapis.com/fcm/send";    
    String gcmURL ="https://fcm.googleapis.com/fcm/send";
    Connection conn = null; 
    PreparedStatement psmt = null; 
    ResultSet rs = null;
    
    String message = request.getParameter("message");
    String title = request.getParameter("title");;
    int successTokens=0;
    try {
    	Class.forName("oracle.jdbc.OracleDriver");
       
        conn = DriverManager.getConnection("jdbc:oracle:thin:@orcl.c3yirc2i0ocz.ap-northeast-2.rds.amazonaws.com:1521:orcl","project","12341234");
        System.out.println("conn의 값은?" + conn);////////
        psmt= conn.prepareStatement("SELECT TOKEN FROM FCM_TOKENS");
        rs = psmt.executeQuery();       
       
        while(rs.next()){
            token.add(rs.getString(1));
        }
        conn.close();     
      
        Sender sender = new Sender(simpleApiKey);
        Message msg = new Message.Builder()        
        .addData("message",message)//데이타 메시지
        .addData("title",title)//데이타 타이틀
        .build();
        System.out.println("메세지는? " + message);
        System.out.println("타이틀은? " + title);
        System.out.println("msg객체는? " + msg);
        
        //등록된 모든 토큰에 푸쉬 메시지 전송.
        MulticastResult multicast = sender.send(msg,token,3);//3는 메시지 전송실패시 재시도 횟수
        
        System.out.println("multicast 값까지 오나? " + multicast);
        //푸쉬 결과  
        
        if (multicast != null) {
            List<Result> resultList = multicast.getResults();
            
            
            for (Result result : resultList) {
            	if(result.getMessageId()!=null) successTokens++;   
            	
                System.out.println("메시지 아이디:"+result.getMessageId());
                
            }
            System.out.println(successTokens+"개의 기기에 전송되었어요...");
        }
       

    }catch (Exception e) {
        e.printStackTrace();
    }
    
%>
<script>
	alert("<%=successTokens%>개의 기기에 메시지가 전송되었어요...");
	//location.href="PushMessageSend.jsp";
	location.href="PushMessageSend.jsp";
</script>



