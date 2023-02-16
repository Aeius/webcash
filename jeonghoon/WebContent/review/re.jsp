<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<style type="text/css">
#content button{
	margin:10px auto;
	display: inline-block;
	width:100px;
	height: 35px;
	box-sizing: border-box;
	border: 2px solid grey;
	border-radius: 4px;
	text-align: center;
	line-height: 35px;
	color: rgba(0,0,0,0.5);
	background-color: rgba(122,122,0,0.3);
	text-decoration: none;
}
form{
	width: 70%;
	margin: 0px auto;
}
form div{
	margin: 10px;
}
form div>span{
	width: 150px;
	display: inline-block;
	padding-left: 10px;
}

form div>span:nth-child(2n+1){
	background-color: rgba(122,122,0,0.3);
}

form #sub>span{
	width: 300px;
	font-size: 20px;
	font-weight: bold;
	background-color: white;
}
form #innerContent>span{	
	background-color: white;
}
textarea{
	width:600px; 
	height:400px; 
    resize:none;
	border: medium solid black;
	border-radius: 10px;
	padding: 10px;
	margin: 10px;
}
</style>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(function() {
	$('#content').find('input').eq(0).focus();
	$('.btnClass #reBtn').click(function(e){
		console.log('click');
		e.preventDefault();
		history.back();
	});
});
</script>
</head>
<body>
	
	<jsp:include page="../template/header.jsp">
				<jsp:param value=".." name="path"/>
	</jsp:include>
<jsp:useBean id="login" class="com.user.UserBean" scope="session"/>
<jsp:setProperty property="*" name="login"/>
		<div id="content">
		<%@ page import="com.nullp.model.RevDto"%>
		<%
			RevDto bean = (RevDto)request.getAttribute("dto");
		%>
		<h2>답글 작성</h2>
		<form method="post">
			<input name="bernum" value="<%=bean.getRnum() %>" type="hidden">
			<input name="ref" value="<%=bean.getRef() %>" type="hidden">
			<input name="seq" value="<%=bean.getSeq() %>" type="hidden">
			<input name="lvl" value="<%=bean.getLvl() %>" type="hidden">
			<input name="uname" value="<%=login.getuid() %>" type="hidden">
			<div>
				<label>제목</label>
				<input name="sub"/>
			</div>
			<div>
				<span>작성자</span>
				<span><%=login.getuid() %></span>				
			</div>
			<div id="innerContent">
				<span><textarea name="content"></textarea></span>
			</div>
			<div class="btnClass">
				<button>입력</button>
				<button type="reset">취소</button>
				<button type="button" id="reBtn">뒤로</button>
			</div>
		</form>
		
		</div>
	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>
