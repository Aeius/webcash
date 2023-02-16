<%@page import="java.util.List"%>
<%@page import="com.bit.model.AchieveDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/mycss.css" rel="stylesheet">
<style type="text/css">
.content>table{
	width: 300px;
}
</style>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
</head>
<body>
<%@ include file="../template/header.jsp" %>
<%@ include file="../template/menu2.jsp" %>
<%
List<AchieveDTO> list = (List<AchieveDTO>)request.getAttribute("student");
if(job.equals("교수")){
	%>
	<script type="text/javascript">
		alert("교수님은 확인할 성적이 없으세요...");
		location.href="/jaehyeon/index.do";
	</script>
	<%
}
%>
<div class="content">
<h1>학생 성적 관리 웹사이트(ver 0.7.0)</h1>
<h2>나의 성적</h2>
<p>학번 : <%=userNum %></p>
<p>이름 : <%=name %></p>
	<div>
		<div class="title">
			<div>과목</div>
			<div>점수</div>
		</div>
		<%
			for(AchieveDTO bean : list){
		%>
		<div class="article">
			<div><%=bean.getSubName() %></div>
			<div><%=bean.getScore() %></div>
		</div>
		<%} %>
	</div>
</div>
<%@ include file="../template/footer.jsp"%>
</body>
</html>