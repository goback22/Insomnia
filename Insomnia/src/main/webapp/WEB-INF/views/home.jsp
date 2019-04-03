<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>
	<form class="form-inline" method="post"
		action="<c:url value='/home/supporters.ins'/>">
		<button type="submit" class="btn btn-primary">검색</button>

	</form>



	<table>

		<c:forEach var="record" items="${requestScope.list}">
			<tr>
				<td>이름 :${record.ID }</td>
			</tr>

		</c:forEach>
	</table>
</body>
</html>
