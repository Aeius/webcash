<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String projectName = request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../pages/templates/head.jsp">
        <jsp:param value="login" name="pageName" />
    </jsp:include> 
</head>
<body>
	<jsp:include page="../pages/templates/header.jsp"></jsp:include> 
	<div id="contents">
        <div id="main">
        	<div class="loginForm">
        		<form method="post">
        			<div class="inputForm">
        				<input type="text" name="m_id" placeholder="아이디를 입력하세요." />
        				<input type="password" name="password" placeholder="비밀번호를 입력하세요." />
        			</div>
        			<div class="buttonForm">
        				<button type="button" id="submit">로그인</button>
        				<div>계정이 존재하지 않는다면, <a href="<%=projectName%>/join.do">회원가입</a> 하러가기</div>
        			</div>
        		</form>
        	</div>
        </div>
    </div>
	<jsp:include page="../pages/templates/footer.jsp"></jsp:include> 
	<jsp:include page="../pages/templates/foot.jsp"></jsp:include> 
</body>
</html>