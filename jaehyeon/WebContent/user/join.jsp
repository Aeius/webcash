<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/mycss.css" rel="stylesheet">
<style type="text/css">
.content>form>table>tbody>tr>td{
	font-size: 20px;
}
.content>form>table>tbody>tr>td>a{
	text-decoration: none;
	color: black;
}
.content>form>table>tbody>tr>td>a:hover{
	color: dodgerblue;
}
.content>form>table>tbody>tr>td>input{
	width: 300px;
	height: 30px;
	margin: 10px;
}
</style>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
</head>
<body>
<%@ include file="../template/header.jsp" %>
<%@ include file="../template/menu2.jsp" %>
    
<div class="content">
<h1>회원가입</h1>
<form action="insert.jsp" method="post">
<table>
	<tbody>
	<tr>
		<td>학번</td>
		<td>
			<input type="text" name="num">
		</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>
			<input type="text" name="name">
		</td>
	</tr>
	<tr>
		<td>패스워드</td>
		<td>
			<input type="password" name="pw">
		</td>
	</tr>
	<tr>
		<td>패스워드 재입력</td>
		<td>
			<input type="password" name="re">
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="submit">회원가입</button>
			<button type="reset">취소</button>
			<a href="login.jsp">로그인</a>
		</td>
	</tr>
	</tbody>
</table>
</form>
</div>
<%@ include file="../template/footer.jsp"%>
</body>
</html>