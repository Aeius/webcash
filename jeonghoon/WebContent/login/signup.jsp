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
	height: 380px;
	margin: 80px auto;
	background-color: rgba(155, 255, 100, 0.2);
}

#content div>table {
	margin: 0px auto;
	padding-top: 50px;
}

#content form>tr {
	padding: 10px;
}

#content .blank {
	height: 15px;
}
</style>
</head>
<body>
	<jsp:include page="../template/header.jsp">
		<jsp:param value=".." name="path" />
	</jsp:include>
	<jsp:include page="../template/menu.jsp"></jsp:include>
	<div id="content">
		<div></div>
		<div>
			<table>
				<form action="signUpResult.jsp" method="post">
					<tr>
						<td colspan="2" align="center">회원가입</td>
					</tr>
					<tr>
						<td class="blank"></td>
					</tr>
					<tr>
						<td align="right">이름</td>
						<td><input type="text"></td>
					</tr>
					<tr>
						<td><br /></td>
						<td />
					</tr>
				<tr>
					<td align="right">비밀번호</td>
					<td><input type="password"></td>
				</tr>
				<tr>
					<td><br /></td>
					<td />
				</tr>
				<tr>
					<td align="right">비밀번호 확인</td>
					<td><input type="password"></td>
				</tr>
				<tr>
					<td><br /></td>
					<td />
				</tr>
				<tr>
					<td align="right">이메일</td>
					<td><input type="email"></td>
				</tr>
				<tr>
					<td><br /></td>
					<td />
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit">가입</button>
						<button type="reset">취소</button>
					</td>

				</tr>
				</form>
			</table>
		</div>
	</div>
	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>