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
    String simpleApiKey = "AAAAN4iICA8:APA91bH1lAxyS2mrQNk_1erIDf5Ee9zjmiDnDuztaWnstPgsoRf1tS6-SqIGHSHT73gK-SyBf5X0TjX5aCa9DZ0LzTrQGVcKdplg5fT1yltn3Wcdz0wkuRDgn9rVu4VK9UrE72H85oJ6";
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
       
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","project","12341234");
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
        //등록된 모든 토큰에 푸쉬 메시지 전송.
        MulticastResult multicast = sender.send(msg,token,3);//3는 메시지 전송실패시 재시도 횟수
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
	location.href="PushMessageSend.jsp";
</script>



