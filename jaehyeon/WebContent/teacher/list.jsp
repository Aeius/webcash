<%@page import="com.bit.model.SubjectDTO"%>
<%@page import="com.bit.model.AchieveDTO"%>
<%@page import="java.util.List"%>
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
.modal1,.modal2,.modal3,.modalPut,.modalDel{
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
</head>
<body>
<%@ include file="../template/header.jsp" %>
<%@ include file="../template/menu2.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String subName = request.getParameter("subName");
if(!job.equals("교수")){
	%>
	<script type="text/javascript">
		alert("교수님만 접근 할 수 있습니다!");
		location.href="/jaehyeon/index.do";
	</script>
	<%
}
String result = String.valueOf(session.getAttribute("result"));
if(result.equals("nothing")){
	%>
	<script type="text/javascript">
		alert("존재하지 않는 학생입니다.");
	</script>
	<%
} else if (result.equals("dup")){
	%>
	<script type="text/javascript">
		alert("이미 존재하는 과목입니다.");
	</script>
	<%
} else if (result.equals("err")){
	%>
	<script type="text/javascript">
		alert("성적은 0~100점 사이입니다.");
	</script>
	<%
}
session.setAttribute("result", "null");
%>
<div class="content">
<h1>학생 성적 관리 웹사이트(ver 0.7.0)</h1>
<h2>학생 성적 관리</h2>
<p>과목
	<select id="subject">
		<option>과목 선택</option>
	<%
	request.setCharacterEncoding("UTF-8");
	List<SubjectDTO> subject = (List<SubjectDTO>)request.getAttribute("subject");
	String sub = request.getParameter("subName");
	for(SubjectDTO bean : subject){
	%>
		<option value="<%=bean.getName()%>"><%=bean.getName() %></option>
	<%} %>
	</select>
	<button class="modal1-on">추가</button>
	<button class="modal3-on">삭제</button>
	<span style="float:right">
		<button class="modal2-on">성적등록</button>
	</span>
</p>
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
        	<td colspan="4">
        		<h4>과목을 선택해주세요</h4>
        	</td>
    	</tr>
    </tbody>
</table>

</div>
<div class="modal1">
	<div class="modal-body1">
		<button class="modal1-off">X</button>
		<div>과목 추가</div>
		<form action="addSub.do" method="post">
		<input type="text" name="sub" id="sub">
		<button>등록</button>
		<button class="modal1-off" type="button">취소</button>
		</form>
	</div>
</div>
<div class="modal3">
	<div class="modal-body1">
		<button class="modal3-off">X</button>
		<div>과목 삭제</div>
		<div>주의! 등록된 성적도 모두 삭제 됩니다.</div>
		<form action="delSub.do" method="post">
		<button>삭제</button>
		<button class="modal3-off" type="button">취소</button>
		</form>
	</div>
</div>
<div class="modal2">
	<div class="modal-body2">
		<button class="modal2-off">X</button>
		<div>성적 등록</div>
		<form action="addAchieve.do" method="post">
			<label for="userNum">학번</label>
			<input type="text" name="userNum" id="userNum">
			<label for="score">성적</label>
			<input type="text" name="score" id="score">
			<button>등록</button>
			<button class="modal2-off" type="button">취소</button>
		</form>
	</div>
</div>
<div class="modalPut">
	<div class="modal-body2">
		<button class="modalPut-off">X</button>
		<div>성적 수정</div>
		<form action="putAchieve.do" method="post">
		<label for="userNum">학번</label>
		<input type="text" name="userNum" id="userNum" readonly>
		<label for="name">이름</label>
		<input type="text" name="name" id="name" readonly>
		<label for="score">성적</label>
		<input type="text" name="score" id="score">
		<button>등록</button>
		<button class="modalPut-off" type="button">취소</button>
		</form>
	</div>
</div>
<div class="modalDel">
	<div class="modal-body1">
		<button class="modalDel-off">X</button>
		<div>성적 삭제</div>
		<form action="delAchieve.do" method="post">
		<input type="hidden" name="userNum" id="userNum">
		<div>성적을 삭제하시겠습니까?</div>
		<button>삭제</button>
		<button class="modalDel-off" type="button">취소</button>
		</form>
	</div>
</div>
<%@ include file="../template/footer.jsp"%>
</body>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript">
$(function(){
	// 모달 창 관리
	// 과목 추가
	$('.modal1-on').click(function(){
		if($('.modal1').css('display')=="none"){
			$('.modal1').css('display','block');
		}
	});
	$('.modal1-off').click(function(){
		if($('.modal1').css('display')=="block"){
			$('.modal1').css('display','none');
		}
	});
	// 과목 삭제
	$('.modal3-on').click(function(){
		var subject = $('#subject option:selected').text();
		if(subject=="과목 선택"){
			alert("과목을 선택해주세요!");
			return;
		}
		if($('.modal3').css('display')=="none"){
			$('.modal3').css('display','block');
		}
		// 선택한 과목 hidden타입으로 input 추가
		var input = $('<input type="hidden" name="subName" id="subName" />').val(subject);
		$('.modal3 form').append(input);
	});
	$('.modal3-off').click(function(){
		if($('.modal3').css('display')=="block"){
			$('.modal3').css('display','none');
		}
		// hidden input 삭제
		$('.modal3 form>input[type="hidden"]').remove();
	});
	// 성적 추가
	$('.modal2-on').click(function(){
		var subject = $('#subject option:selected').text();
		if(subject=="과목 선택"){
			alert("과목을 선택해주세요!");
			return;
		}		
		if($('.modal2').css('display')=="none"){
			$('.modal2').css('display','block');
		}
		// 선택한 과목 hidden타입으로 input 추가
		var input = $('<input type="hidden" name="subName" id="subName" />').val(subject);
		$('.modal2 form').append(input);
	});
	$('.modal2-off').click(function(){
		if($('.modal2').css('display')=="block"){
			$('.modal2').css('display','none');
		}
		// hidden input 삭제
		$('.modal2 form>input[type="hidden"]').remove();
	});
	// 과목 선택 시 성적 출력
	$('#subject').change(function(e){
			getList();
	});
	// 선택중인 과목 출력되도록
	var subName = window.location.search.split('=')[1];
	$('option:contains('+subName+')').attr("selected","selected");
	getList();
});

function getList(){
	var subject = $('#subject option:selected').text();
	$.get('<%=root%>/teacher/achieve.do', {subject:subject}, function(data){
		// json 데이터 파싱
		// {"achieve":[{"userNum":20230201, "userName":"홍길동", "score": 97}, {},...]}
		var json = JSON.parse(data);
		$('table>tbody').html(""); // 테이블 비우기
		// 값이 없거나 기본값을 선택한 경우
		if(json.achieve.length == 0){
			var values = $('<tr/>').html(
								'<td colspan="4">'+
				        			'<h4>성적을 추가하거나 과목을 선택하십시오.</h4>'+
				        		'</td>');
			$('table>tbody').append(values);
		// 과목 선택 시 값 정상 출력
		} else {
			for(i = 0; i < json.achieve.length; i++){
				var values = $('<tr/>').html(
								'<td>'+json.achieve[i].userNum+'</td>' +
								'<td>'+json.achieve[i].userName+'</td>' +
								'<td>'+json.achieve[i].score+'</td>' +
								'<td><button class="modalPut-on">수정</button>' +
								'<button class="modalDel-on">삭제</button></td>');
				$('table>tbody').append(values);
			}
			// input id=sub인 곳에 현재 선택한 과목 num 주기
			// 리스트 생성 후 수정,삭제 이벤트 추가
			$('.modalPut-on').click(function(){
				var userNum = $(this).parent().parent().children().html();
				var name = $(this).parent().parent().children().next().html();
				var score = $(this).parent().parent().children().next().next().html();
				if($('.modalPut').css('display')=="none"){
					$('.modalPut').css('display','block');
				}
				// 선택한 학생의 성적 출력
				$('.modalPut form>input').eq(0).val(userNum);
				$('.modalPut form>input').eq(1).val(name);
				$('.modalPut form>input').eq(2).val(score);
				// 선택한 과목 hidden타입으로 input 추가
				var subject = $('#subject option:selected').text();
				var input = $('<input type="hidden" name="subName" id="subName" />').val(subject);
				$('.modalPut form').append(input);
			});
			$('.modalPut-off').click(function(){
				if($('.modalPut').css('display')=="block"){
					$('.modalPut').css('display','none');
				}
				// hidden input 삭제
				$('.modalPut form>input[type="hidden"]').remove();
			});
			$('.modalDel-on').click(function(){
				var num = $(this).parent().parent().children().html();
				if($('.modalDel').css('display')=="none"){
					$('.modalDel').css('display','block');
				}
				// 선택한 학생의 성적 출력
				$('.modalDel form>input').eq(0).val(num);
				// 선택한 과목 hidden타입으로 input 추가
				var subject = $('#subject option:selected').text();
				var input = $('<input type="hidden" name="subName" id="subName" />').val(subject);
				$('.modalDel form').append(input);
			});
			$('.modalDel-off').click(function(){
				if($('.modalDel').css('display')=="block"){
					$('.modalDel').css('display','none');
				}
				// hidden input 삭제
				$('.modalDel form>input[type="hidden"]').remove();
			});
		}
	});
}
</script>
</html>