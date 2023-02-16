<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<style type="text/css">

#content div {
	height: 50px;
}
#content div+div {
	width: 400px;
	height: 300px;
	margin: 80px auto;
	background-color: rgba(155, 255, 100, 0.2);
}

#content div>table {
	margin: 0px auto;
	padding-top: 50px;
}
#content .blank{
	height: 15px;
}
#content #loginBtn{
	margin-top: 1px;
	height: 44px;
}
#content td{
align-content: center;

}
#content td>a{
text-decoration: none;
color: black;
}
</style>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>

</head>
<body>
	<jsp:include page="../template/header.jsp">
				<jsp:param value=".." name="path"/>
	</jsp:include>
	<div id="content">
	<div></div>
	<div>
	<table>
		<form action="result.jsp" method="post">
				<tr>
					<td colspan="3" align="center">로그인</td>
				</tr>
				<tr>
				<td class="blank"></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid"></td>
					<td rowspan="2"><button type="submit" id="loginBtn">로그인</button></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="upw"></td>
				</tr>
				
			<tr>
				<td class="blank"></td>
			</tr>
				<tr>
				<td colspan="3" align="center">
					<a href="signup.jsp">회원가입</a>
				</td>
			</tr>
			<tr>
				<td class="blank"></td>
			</tr>
<!-- 			<tr> -->
<!-- 				<td colspan="3" align="center"> -->
<!-- 					<a href="findId.jsp">ID</a> -->
<!-- 					 /  -->
<!-- 					<a href="resetPw.jsp">PW를 잊어버렸어요</a> -->
<!-- 				</td> -->
<!-- 			</tr> -->
			</form>
			</table>
	</div>
	</div>
	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>