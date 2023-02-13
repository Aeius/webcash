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
$(function(){
	$('#content')
		.find('button')
			.last().click(function(){
				history.back();
			})
	;
	
});
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
		<form method="post">
		<input type="hidden" name="rnum" value="<%=bean.getRnum() %>">
		<h2><input name="sub" value="<%=bean.getSub() %>"/></h2>
			
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
				<span><input name="content" value="<%=bean.getContent()%>"/></span>
			</div>
			
			<div>
					<button>수정</button>
					<button type="reset">취소</button>
					<button type="button">뒤로</button>
			</div>
		</form>
		
		</div>
	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>
