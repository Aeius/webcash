<%@page import="com.bit.model.CorrectionDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/mycss.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
</head>
<body>
<%@ include file="../template/header.jsp" %>
<%@ include file="../template/menu2.jsp" %>

<%
int num = Integer.parseInt(request.getParameter("num"));
%>
<div class="content">
<h2>정정 요청 게시판</h2>
<h2><%=num %>번 게시글을 삭제 하시겠습니까?</h2>
<form action="delete.do" method="post">
	<input type="hidden" name="num" value="<%=num %>">
	<input type="submit" value="확인">
	<input type="button" value="취소" onclick="history.back()">
</form>
</div>
<%@ include file="../template/footer.jsp"%>
</body>
</html>