<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/mycss.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<%@ include file="../template/header.jsp" %>
<%@ include file="../template/menu2.jsp" %>
    
<div class="content">
<h1>공지 사항</h1>
<h2>글 작성</h2>
<form action="write.do" method="post">
<input type="hidden" name="userNum" id="userNum" value="<%=userNum%>">
<table> 
	<tr>
		<td>글제목</td>
		<td>
			<input type="text" name="title">
		</td>
	</tr>
	<tr>
		<td>글내용</td>
		<td>
			<textarea name="content" cols="50" rows="10"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="입력">
			<input type="reset" value="취소">
		</td>
	</tr>
</table>
</form>
</div>
<%@ include file="../template/footer.jsp"%>
</body>
</html>