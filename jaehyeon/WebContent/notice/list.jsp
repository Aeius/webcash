<%@page import="com.bit.model.NoticeDTO"%>
<%@page import="java.util.List"%>
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
<style type="text/css">
#search{
	margin:10px auto;
	text-align: center;
}
#search>div{
	width: 200px;
	height: 90px;
	border-bottom: 2px solid gray;
	border-right: 2px solid gray;
}
</style>
</head>
<body>
<%@ include file="../template/header.jsp" %>
<%@ include file="../template/menu2.jsp" %>

<div class="content">
<h1>학생 성적 관리 웹사이트(ver 0.7.0)</h1>
<h2>공지사항 게시판</h2>
<table class="board">
	<thead>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
	</thead>
    <tbody>
		<%
		List<NoticeDTO> list = null;
		list = (List<NoticeDTO>)request.getAttribute("notice");
		for(NoticeDTO bean : list){
		%>
		<tr>
		    <td><a href="detail.do?num=<%=bean.getNum() %>"><%=bean.getNum() %></a></td>
		    <td><a href="detail.do?num=<%=bean.getNum() %>"><%=bean.getTitle() %></a></td>
		    <td><a href="detail.do?num=<%=bean.getNum() %>"><%=bean.getUserName() %></a></td>
		    <td><a href="detail.do?num=<%=bean.getNum() %>"><%=bean.getDate() %></a></td>
		    <td><a href="detail.do?num=<%=bean.getNum() %>"><%=bean.getCnt() %></a></td>
		</tr>
		<% }%>
    </tbody>
</table>
  	<div id="search">
  		<a href="write.do">글작성</a>
    </div>
</div>
<%@ include file="../template/footer.jsp"%>
</body>
</html>