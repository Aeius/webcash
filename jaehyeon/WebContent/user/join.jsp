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
String joinResult = String.valueOf(session.getAttribute("joinResult"));
if(joinResult=="false"){
	%>
	<script type="text/javascript">
		alert("중복되는 학번입니다.");
	</script>
	<%
} else if(joinResult=="true"){
	%>
	<script type="text/javascript">
		location.href="/jaehyeon/user/login.do";
	</script>
	<%
}
session.setAttribute("joinResult", "null");
%>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript">
$(function(){
	// 로그인 시 아이디 입력 값 제어
	var idValid = false;
	$('input[name="num"]').keyup(function(e){
		var data = $(e.target).val();
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
	var pwData;
	$('input[name="pw"]').keyup(function(e){
		pwData = $(e.target).val();
		if(pwData.length>=4 && pwData.length<=20){
			$(e.target).parent().parent().children().first().css('color','green');
			pwValid = true;
		} else {
			$(e.target).parent().parent().children().first().css('color','red');
			pwValid = false;
		}
	});
	// 패스워드 재입력 값 제어
	var reValid = false;
	$('input[name="re"]').keyup(function(e){
		var data = $(e.target).val();
		if(pwData==data){
			$(e.target).parent().parent().children().first().css('color','green');
			reValid = true;
		} else {
			$(e.target).parent().parent().children().first().css('color','red');
			reValid = false;
		}
	});
	$('button[type="submit"]').click(function(e){
		if(!idValid){
			alert("학번은 숫자만 8자 입력가능합니다.");
			return false;
		} else if(!pwValid){
			alert("패스워드는 4자 이상 20자 이하입니다.");
			return false;
		} else if(!reValid){
			alert("패스워드 재입력을 확인해주세요.");
			return false;
		} else {
			$('#id').val(checkMsg($('#id').val()));
			$('#pw').val(checkMsg($('#pw').val()));
		}
	});
})
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
<h1>회원가입</h1>
<form action="join.do" method="post">
<table>
	<tbody>
	<tr>
		<td>학번</td>
		<td>
			<input type="text" name="num" id="num" required="required" maxlength="8">
		</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>
			<input type="text" name="name" id="name" required="required">
		</td>
	</tr>
	<tr>
		<td>패스워드</td>
		<td>
			<input type="password" name="pw" id="pw" required="required">
		</td>
	</tr>
	<tr>
		<td>패스워드 재입력</td>
		<td>
			<input type="password" name="re" id="re" required="required">
		</td>
	</tr>
	<tr>
		<td>역할</td>
		<td>
			<select name="job">
				<option value="학생">학생</option>
				<option value="교수">교수</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="submit">회원가입</button>
			<button type="reset">다시작성</button>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<a href="login.do">로그인하러가기</a>
		</td>
	</tr>
	</tbody>
</table>
</form>
</div>
<%@ include file="../template/footer.jsp"%>
</body>
</html>