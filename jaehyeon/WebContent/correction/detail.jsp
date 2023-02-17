<%@page import="com.bit.model.CorrectionDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/mycss.css" rel="stylesheet">
<link href="../css/detail.css" rel="stylesheet">

<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
</head>
<body>
<%@ include file="../template/header.jsp" %>
<%@ include file="../template/menu2.jsp" %>
    
<div class="content">
<h2>정정 요청 게시판</h2>
<form action="insert.jsp" method="post">
<table> 
	<tbody>
	<%
	CorrectionDTO bean = (CorrectionDTO)request.getAttribute("detail");
	%>
		<tr>
			<td width="100px">제목</td>
			<td><%=bean.getTitle()%></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><%=bean.getUserName() %></td>
		</tr>
		<tr>
			<td colspan="2">
			<%=bean.getContent() %>
			</td>
		</tr>
		<tr>
		</tr>
		<%
		if(userNum.equals(bean.getUserNum()+"")){
        %>
		<tr>
			<td colspan="2">
				<a href="modify.do?num=<%=bean.getNum()%>">[수정]</a>
				<a href="delete.do?num=<%=bean.getNum()%>">[삭제]</a>
			</td>
		</tr>
		<% } else if(job.equals("교수") || job.equals("학생")){ %>
		<tr>
            <td colspan="2">
                <a href="reply.do?num=<%=bean.getNum()%>">[답글]</a>
            </td>
        </tr>
		<% }%>
	</tbody>
</table>
</form>
</div>
<%@ include file="../template/footer.jsp"%>
</body>
</html>