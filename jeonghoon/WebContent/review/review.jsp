<%@page import="com.nullp.model.RevDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/main.css">

<style type="text/css">
#content h2{
	width: 30%;
}

#revBtn>a{
	margin:10px auto;
	display: block;
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

#content table{
	margin: 0px auto;
}
#content thead>tr>th{
	margin-bottom:10px;
	padding-bottom:10px;
	
	border-bottom: 3px solid rgba(122,122,0,0.3);
}
#content tbody{}
#content tbody>tr{
	height: 50px;
}
#content tbody>tr>td{
	text-align: center;
	border-bottom: 1px, dashed, rgba(122,122,0,0.2);
}
#content tbody>tr>td>a{
	color:black;
	text-decoration: none;
}

</style>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<jsp:useBean id="login" class="com.user.UserBean" scope="session"/>
<jsp:setProperty property="*" name="login"/>
<script type="text/javascript">
var cnt=0;

function moreInfo() {
	var beforecnt=cnt;
	cnt+=5;
	for (var i = beforecnt; i <= cnt; i++) {
		  $('tbody>tr').eq(i).show();
		}
};
$(document).ready(function(){
	if(<%=login.isResult()%>==true){
		$('#revBtn').children().show();
	}else{
		$('#revBtn').children().hide();
	}
  cnt=12;
  $('tbody').children().hide();
  for (var i = 0; i <= cnt; i++) {
	  $('tbody>tr').eq(i).show();
	}
});
$(window).scroll(function(){
    if(($(window).scrollTop()/($(document).height()-window.innerHeight)*100)==100){
    	setTimeout(function (){
	    	moreInfo(); 
    		}, 500);
    	
    }
});
</script>
</head>
<body>

	<jsp:include page="../template/header.jsp">
		<jsp:param value=".." name="path" />
	</jsp:include>

	<div id="content">
		<h2>고객 후기</h2>
		<p id="revBtn">
			<a href="add.do">후기 입력</a>
		</p>
		<table>
			<thead>
				<tr>
					<th>작성자</th>
					<th width="60%">제목</th>
					<th width="10%">날짜</th>
					<th width="10%">조회수</th>
				</tr>
			</thead>
			<tbody>
			<%
				java.util.List<RevDto> list =null;
				list=(java.util.List<RevDto>)request.getAttribute("revList");
				for(RevDto bean:list){
				%>
				<tr>
					<td><a href="detail.do?idx=<%=bean.getRnum()%>"><%=bean.getUname() %></a></td>
					<td><a href="detail.do?idx=<%=bean.getRnum()%>"><%=bean.getSub() %></a></td>
					<td><a href="detail.do?idx=<%=bean.getRnum()%>"><%=bean.getWriteDate() %></a></td>
					<td><a href="detail.do?idx=<%=bean.getRnum()%>"><%=bean.getViewCnt() %></a></td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>
