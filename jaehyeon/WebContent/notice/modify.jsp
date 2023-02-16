<%@page import="com.bit.model.NoticeDTO"%>
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
<h1>공지 사항</h1>
<h2>글 수정</h2>
<%
NoticeDTO bean = (NoticeDTO)request.getAttribute("detail");
%>
<form action="modify.do" method="post">
<input type="hidden" name="num" value="<%=bean.getNum()%>">
<table>
	<tbody>
	<tr>
		<td>글제목</td>
		<td>
			<input type="text" name="title" value="<%=bean.getTitle()%>">
		</td>
	</tr>
	<tr>
		<td>글내용</td>
		<td>
			<textarea name="content" cols="50" rows="10"><%=bean.getContent() %></textarea>
		</td>
	</tr>
	</tbody>
	<tr>
		<td colspan="2">
			<input type="submit" value="수정">
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