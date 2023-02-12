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

#content form>tr {
	padding: 10px;
}

#content .blank {
	height: 15px;
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
				<form action="findIdResult.jsp" method="post">
					<tr>
						<td colspan="2" align="center">ID 찾기</td>
					</tr>
					<tr>
						<td class="blank"></td>
					</tr>
					<tr>
						<td align="right">아이디</td>
						<td><input type="text" id="id"></td>
					</tr>
					<tr>
						<td><br /></td>
						<td/>
					</tr>
					<tr>
						<td align="right">이름</td>
						<td><input type="text" id="name" ></td>
					</tr>
					<tr>
						<td><br /></td>
						<td/>
					</tr>
					<tr>
						<td align="right">이메일</td>
						<td><input type="email" id="email"></td>
					</tr>
					<tr>
						<td><br /></td>
						<td/>
					</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit">찾기</button>
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