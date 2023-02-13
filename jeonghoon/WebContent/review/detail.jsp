<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<style type="text/css">
$(function(){
	$('#content').find('a').last().click(function() {
		history.back();
	})
	.prev().click(function(){
		var url=$(this).attr('href');
		var param=url.substring(url.indexOf('?'+1));
		var url1=url.substring(0,url.indexOf('?'));
		console.log(url1+"\n"+param);
		if(confirm("삭제하시겠습니까?")){
		$.post(url,param,function(){
			location.replace('list.do');
		})
		}
		return false;
	});
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
		<%@ page import="com.nullp.model.RevDto"%>
		<%
			RevDto bean = (RevDto)request.getAttribute("dto");
		%>
		<h2><%=bean.getSub() %></h2>
		<form method="post">
			
			<div>
				<span>글 번호</span>
				<span><%=bean.getRnum()%></span>				
				<span>작성일</span>
				<span><%=bean.getWriteDate()%></span>				
			</div>
			<div>
				<span>작성자</span>
				<span><%=bean.getUname() %></span>				
				<span>조회수</span>
				<span><%=bean.getViewCnt()%></span>				
			</div>
			<div>
				<span><%=bean.getContent()%></span>
			</div>
			
			<div>
					<a href="edit.do?idx=<%=bean.getRnum()%>">수정</a> 
					<a href="delete.do?idx=<%=bean.getRnum()%>">삭제</a> 
					<a href="#">뒤로</a>
			</div>
		</form>
		
		</div>
	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>
