<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String projectName = request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../pages/templates/head.jsp">
        <jsp:param value="join" name="pageName" />
    </jsp:include> 
</head>
<body>
	<jsp:include page="../pages/templates/header.jsp"></jsp:include> 
	<div id="contents">
        <div id="main">
        	<div class="joinForm">
        		<form method="post">
        			<div class="inputForm">
        				<input type="text" name="m_id" placeholder="아이디를 입력하세요." />
        				<input type="password" name="password" placeholder="비밀번호를 입력하세요." />
                        <input type="password" name="password_re" placeholder="비밀번호 확인을 입력하세요." />
                        <input type="text" name="name" placeholder="이름을 입력하세요." />
                        <input type="text" name="email" placeholder="이메일을 입력하세요." />
                        <select name="age">
                           	<%
                           	for(int i=8;i<=65;i++){
                           	%>
                               <option value="<%=i%>"><%=i%>세</option>
                               <%
                           	}
                               %>
                        </select>
                        <div class="radioGroup">
                            <input type="radio" name="gender" value="M" checked><label>남자</label>
                            <input type="radio" name="gender" value="F" ><label>여자</label>
                        </div>
        			</div>
        			<div class="buttonForm">
        				<button type="button" id="submit">회원가입 완료</button>
        			</div>
        		</form>
        	</div>
        </div>
    </div>
	<jsp:include page="../pages/templates/footer.jsp"></jsp:include> 
	<jsp:include page="../pages/templates/foot.jsp"></jsp:include> 
</body>
</html>