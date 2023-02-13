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

</style>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/jquery.bxslider.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>

	<jsp:include page="../template/header.jsp">
		<jsp:param value=".." name="path" />
	</jsp:include>

	<div id="content">
		<h2>고객 후기</h2>
		<table>
			<thead>
				<tr>
					<th>작성자</th>
					<th width="60%">제목</th>
					<th width="10%">시간</th>
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
		<p>
			<a href="add.do">후기 입력</a>
		</p>
	</div>
	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>
