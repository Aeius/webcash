<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<style type="text/css">
$(function() {
		$('#content').find('input').eq(0).focus()
		.end()
		.end()
		.find('button').last().click(function(){
			history.back();
		})
	});
</style>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/jquery.bxslider.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	
	<jsp:include page="../template/header.jsp">
				<jsp:param value=".." name="path"/>
	</jsp:include>

		<div id="content">
		
		<h2>Insert Emp</h2>
		<form method="post">
			<div>
				<label>제목</label>
				<input name="sub"/>
			</div>
			<div>
				<input name="content"/>
			</div>
			<div>
				<label>작성자</label>
				<input name="uname"/>
			</div>
			<div>
				<button>입력</button>
				<button type="reset">취소</button>
				<button type="button">뒤로</button>
			</div>
		</form>
		
		</div>
	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>
