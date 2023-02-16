<%@page import="com.bit.model.CorrectionDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/mycss.css" rel="stylesheet">
<style type="text/css">
.content>table>tbody>tr>td>input{
	width: 600px;
}
</style>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
</head>
<body>
<%@ include file="../template/header.jsp" %>
<%@ include file="../template/menu2.jsp" %>
    
<div class="content">
<h2>정정 요청 게시판</h2>
<h2>답글 달기</h2>
<%
CorrectionDTO bean = (CorrectionDTO)request.getAttribute("detail");
%>
<form action="reply.do" method="post">
<input type="hidden" name="userNum" value="<%=userNum %>">
<input type="hidden" name="ref" value="<%=bean.getRef()%>">
<input type="hidden" name="seq" value="<%=bean.getSeq()%>">
<input type="hidden" name="lvl" value="<%=bean.getLvl()%>">
<table>
	<tbody>
	<tr>
		<td>글제목</td>
		<td>
			<input type="text" name="title" value="re:<%=bean.getTitle()%>">
		</td>
	</tr>
	<tr>
		<td>글내용</td>
		<td>
			<textarea name="content" cols="50" rows="10"></textarea>
		</td>
	</tr>
	</tbody>
	<tr>
		<td colspan="2">
			<input type="submit" value="작성">
			<input type="reset" value="취소">
			<input type="button" value="뒤로" onclick="history.back()">
		</td>
	</tr>
</table>
</form>
</div>
<%@ include file="../template/footer.jsp"%>
</body>
</html>