<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<style type="text/css">
#content{
	margin: 0px auto;
}
#content #userInfo{
	margin: 20px auto;
	width: 60%;
}
#content #userInfo>div{
	margin-top: 30px;
	background-color: rgba(255,255,255,0.3);
	border-bottom: 2px, solid, black;
}
#content #userInfo>div>span{
	width: 100px;
	height: 50px;
	line-height: 50px;
	font-size: 18px;
}
#content #userInfo>div>span:first-child{
	width: 150px;
	background-color: rgba(122,122,0,0.3);
	display: inline-block;
	padding-left: 10px;
}

#reBtn{
	float: right;
	display: block;
	width:50px;
	height: 35px;
	box-sizing: border-box;
	border: 2px solid grey;
	border-radius: 4px;
	text-align: center;
	line-height: 35px;
	color: red;
	background-color: rgba(122,122,0,0.3);
	margin-top: 10px;
}
</style>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#reBtn').click(function(e){
		console.log('click');
		e.preventDefault();
		history.back();
	});
});
</script>
</head>
<body>
	<jsp:useBean id="login" class="com.user.UserBean" scope="session" />
	<jsp:setProperty property="*" name="login" />
	<jsp:include page="../template/header.jsp">
		<jsp:param value=".." name="path" />
	</jsp:include>

	<div id="content">
		<h2>내 정보</h2>
		<div id="userInfo">
			<div>
				<span>회원 번호</span> <span><%=login.getNum()%></span>
			</div>
			<div>
				<span>ID</span> <span><%=login.getuid()%></span>
			</div>
			<div>
				<span>이름</span> <span><%=login.getUname()%></span>
			</div>
			<div>
				<span>이메일</span> <span><%=login.getUmail()%></span>
			</div>
		<button type="button" id="reBtn">뒤로</button>
		</div>
	</div>
	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>
