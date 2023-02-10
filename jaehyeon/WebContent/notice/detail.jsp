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
<h1>공지 사항</h1>
<form action="insert.jsp" method="post">
<table> 
	<tbody>
		<tr>
			<td width="100px">제목</td>
			<td>제목이 들어가는 자리 입니다.</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>박재현</td>
		</tr>
		<tr>
			<td colspan="2">
			Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis sequi autem placeat nostrum est inventore assumenda. Repellendus quia esse tempora quis ipsum animi reprehenderit hic temporibus, repellat nobis autem quidem?
			<br>
			Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis sequi autem placeat nostrum est inventore assumenda. Repellendus quia esse tempora quis ipsum animi reprehenderit hic temporibus, repellat nobis autem quidem?
			<br>
			Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis sequi autem placeat nostrum est inventore assumenda. Repellendus quia esse tempora quis ipsum animi reprehenderit hic temporibus, repellat nobis autem quidem?
			</td>
		</tr>
		<tr>
		</tr>
		<tr>
			<td colspan="2">
				<a href="modify.jsp">[수정]</a>
				<a href="delete.jsp">[삭제]</a>
			</td>
		</tr>
	</tbody>
</table>
</form>
</div>
<%@ include file="../template/footer.jsp"%>
</body>
</html>