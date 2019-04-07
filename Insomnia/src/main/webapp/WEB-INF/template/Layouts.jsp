<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insomnia</title>
	<tiles:insertAttribute name="Body"/>
	<!-- 푸터 부분 -->
	<tiles:insertAttribute name="Footer"/>
	
	<%--                jsp페이지 작성 규칙
	
	1. css파일과 js파일들의 개별화를 위해 layout.jsp에서 제공해주지 않는다.
		개별적으로 css, js를 추가시켜 </head>로 헤드를 닫아주어야 한다.
		
	2. Body부분까지 작성한 후에 </body>를 닫지않는다.
		layout.jsp가 제공해주는 Footer에 </body>와 </html>태그가 포함되어있다.
		
	3. Navigation Bar는 개별적으로 jsp페이지에 붙여 사용 하도록 한다.
	사용법 : 네비게이션 바가 들어갈 자리에 jsp:include 태그를 사용한다.
	
			<jsp:include page="../template/Nav.jsp"/>
			
	위의 태그를 그대로 복붙해서 사용하면 된다.
	기본경로가 설정되어있기때문에 경로불문 사용하면 된다.
	 --%> 
	
</body>
</html>