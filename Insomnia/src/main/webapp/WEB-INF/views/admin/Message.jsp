<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- message.jsp -->
<script>
	<c:choose>
		<c:when test="${succFail==1}">
			location.replace("<c:url value='/admin/AdminSubContent'/>");
		</c:when>
		<c:when test="${succFail==0}">
			history.back();
		</c:when>
	</c:choose>
</script>