<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	//RegisterToken.jsp

	Connection conn = null;
    PreparedStatement pstm = null;
    String sql = null;
    String token = null;
    String requestMethod = null;
    
    request.setCharacterEncoding("utf-8");
    
    try{
    	Class.forName("oracle.jdbc.OracleDriver");
        String url = "jdbc:oracle:thin:@localhost:1521:orcl";  //수정 전은 myoracle
        conn = DriverManager.getConnection(url,"project","12341234");
        
        System.out.println("연결성공");
    }catch(Exception e){
    	System.out.println("연결실패");
        e.printStackTrace();
    }
    
    token = request.getParameter("token");
    out.println("token:"+token);
    if( token ==null || token.equals("") ){
        System.out.println("토큰값이 전달 되지 않았습니다.");
    }else{
        // 토큰값 전달시 쿼리문 입력할곳임
        String idVal = (session.getAttribute("id")).toString();
        sql = "INSERT INTO FCM_TOKENS(FCM_ID, ID, TOKEN) VALUES(TOKENS_SEQ.NEXTVAL, ?, ?)";
        pstm = conn.prepareStatement(sql);  
        pstm.setString(1, idVal);
        pstm.setString(2,token);        
        pstm.executeUpdate();
        System.out.println("토큰값이 입력되었습니다.");
    }
    pstm.close();
    conn.close();
    
%>