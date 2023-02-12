<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/mycss.css" rel="stylesheet">
<style type="text/css">
.content>table>tbody{
	clear:both;
}
.content>table>thead>tr>th:nth-child(1){
	width: 100px;
}
.content>table>tbody>tr>td:nth-child(1){
	text-align: center;
}
.content>table>tbody>tr>td:nth-child(2){
	width: 100px;
	text-align: center;
	height: 48px;
	line-height: 48px;
}
.content>table>thead>tr>th:nth-child(2){
	width: 100px;
}
.modal1,.modal2{
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
 	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-body1{
	position: absolute;
	top: 50%;
	left: 50%;
	width: 300px;
	height: 80px;
	padding: 10px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(-50%) translateY(-50%);
}
.modal-body2{
	position: absolute;
	top: 50%;
	left: 50%;
	width: 300px;
	height: 180px;
	padding: 10px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(-50%) translateY(-50%);
}
.modal-body1>button{
	float: right;
}
.modal-body2>button{
	float: right;
}
.modal-body1>input{
	margin: 20px;
	display: block;
	height: 20px;
	line-height: 20px;
	font-size: 20px;
}
.modal-body2>form{
	display:block;
	width: 280px;
	height: 200px;
	padding: 15px;
	line-height: 20px;
}
.modal-body2>form>label{
	float: left;
	padding-left: 5px;
	margin: 5px;
}
.modal-body2>form>input{
	width: 200px;
	margin: 5px;
	display: block;
	height: 20px;
	line-height: 20px;
	font-size: 20px;
}
</style>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.modal1-on').click(function(e){
		if($('.modal1').css('display')=="none"){
			$('.modal1').css('display','block');
		}
	});
	$('.modal1-off').click(function(){
		if($('.modal1').css('display')=="block"){
			$('.modal1').css('display','none');
		}
	});
	$('.modal2-on').click(function(e){
		if($('.modal2').css('display')=="none"){
			$('.modal2').css('display','block');
		}
	});
	$('.modal2-off').click(function(){
		if($('.modal2').css('display')=="block"){
			$('.modal2').css('display','none');
		}
	});
});
</script>
</head>
<body>
<%@ include file="../template/header.jsp" %>
<%@ include file="../template/menu2.jsp" %>

<div class="content">
<h1>학생 성적 관리 웹사이트(ver 0.7.0)</h1>
<h2>학생 성적 관리</h2>
<p>과목
	<select>
		<option>국어</option>
		<option>영어</option>
		<option>수학</option>
	</select>
	<button class="modal1-on">과목추가</button>
	<span style="float:right">
		<button class="modal2-on">성적등록</button>
	</span>
</p>
<div class="modal1">
	<div class="modal-body1">
		<button class="modal1-off">X</button>
		<div>과목 추가</div>
		<form>
		<input type="text" name="sub" id="sub">
		<button>등록</button>
		</form>
	</div>
</div>
<div class="modal2">
	<div class="modal-body2">
		<button class="modal2-off">X</button>
		<div>성적 추가</div>
		<form>
		<input type="hidden" name="sub" id="sub" value="">
		<label for="num">학번</label>
		<input type="text" name="num" id="num">
		<label for="name">이름</label>
		<input type="text" name="name" id="name">
		<label for="score">성적</label>
		<input type="text" name="score" id="score">
		<button>등록</button>
		</form>
	</div>
</div>
<table>
	<thead>
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>점수</th>
			<th></th>
		</tr>
	</thead>
    <tbody>
        <tr>
            <td>20230101</td>
            <td>이순신</td>
            <td>90</td>
            <td>
	            <button>수정</button>
	            <button>삭제</button>
            </td>
        </tr>
        <tr>
            <td>20230102</td>
            <td>장보고</td>
            <td>80</td>
            <td>
            	<button>수정</button>
            	<button>삭제</button>
           	</td>
        </tr>
        <tr>
            <td>20230103</td>
            <td>홍길동</td>
            <td>70</td>
            <td>
	            <button>수정</button>
	            <button>삭제</button>
            </td>
        </tr>
    </tbody>
</table>
</div>
<%@ include file="../template/footer.jsp"%>
</body>
</html>