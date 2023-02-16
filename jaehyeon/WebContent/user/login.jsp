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
<%
String loginResult = String.valueOf(session.getAttribute("loginResult"));
if(loginResult=="false"){
	%>
	<script type="text/javascript">
		alert("없는 학번이거나 패스워드를 확인해주세요");
	</script>
	<%
} else if(loginResult=="true"){
	%>
	<script type="text/javascript">
		location.href="/jaehyeon/index.do";
	</script>
	<%
}
session.setAttribute("loginResult", "null");

%>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript">
$(function(){
	// 로그인 시 아이디 입력 값 제어
	var idValid = false;
	$('input[name="num"]').keyup(function(e){
		var data = $(e.target).val();
		console.log(data, data.length);
		if(data.length!=8 || isNaN(data)){
			$(e.target).parent().parent().children().first().css('color','red');
			idValid = false;
		} else {
			$(e.target).parent().parent().children().first().css('color','green');
			idValid = true;
		}
	});
	// 로그인 시 패스워드 입력 값 제어
	var pwValid = false;
	$('input[name="pw"]').keyup(function(e){
		var data = $(e.target).val();
		console.log(data, data.length);
		if(data.length>=4 && data.length<=20){
			$(e.target).parent().parent().children().first().css('color','green');
			pwValid = true;
		} else {
			$(e.target).parent().parent().children().first().css('color','red');
			pwValid = false;
		}
	});
	$('button[type="submit"]').click(function(e){
		if(!idValid){
			alert("학번은 숫자만 8자 입력가능합니다.");
			return false;
		} else if(!pwValid){
			alert("패스워드는 4자 이상 20자 이하입니다.");
			return false;
		} else {
			$('#id').val(checkMsg($('#id').val()));
			$('#pw').val(checkMsg($('#pw').val()));
		}
	});
});
function checkMsg(msg){
	//query 문장에서 공격 당하지 않기 위해 특수문자로 변환
	msg = msg.replace("--", "­­"); 
	msg = msg.replace("'", "＇"); 
	msg = msg.replace(",", "，"); 
	msg = msg.replace("<", "＜"); 
	msg = msg.replace(">", "＞");
	msg = msg.replace("(", "（");
	msg = msg.replace(")", "）");
	msg = msg.replace("%", "％");
	return msg;
}
</script>
</head>
<body>
<%@ include file="../template/header.jsp" %>
<%@ include file="../template/menu2.jsp" %>
    
<div class="content">
<h1>로그인</h1>
<form action="login.do" method="post">
<table>
	<tbody>
	<tr>
		<td>학번</td>
		<td>
			<input type="text" name="num" id="num" maxlength="8" required="required">
		</td>
	</tr>
	<tr>
		<td>패스워드</td>
		<td>
			<input type="password" id="pw" name="pw" required="required">
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="submit">로그인</button>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<a href="join.do">회원가입하러가기</a>
		</td>
	</tr>
	</tbody>
</table>
</form>
</div>
<%@ include file="../template/footer.jsp"%>
</body>
</html>