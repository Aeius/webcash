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

<div class="content">
<h1>학생 성적 관리 웹사이트(ver 0.7.0)</h1>
<h2>나의 성적</h2>
<p>학번 : </p>
<p>이름 : </p>
<table>
    <tbody>
		<tr>
			<th>과목</th>
			<th>학점</th>
		</tr>
	    <tr>
	    	<td>국어</td>
	    	<td>A</td>
	    </tr>
	    <tr>
	    	<td>영어</td>
	    	<td>A</td>
	    </tr>
	    <tr>
	    	<td>수학</td>
	    	<td>A</td>
	    </tr>
    </tbody>
</table>
</div>
<%@ include file="../template/footer.jsp"%>
</body>
</html>