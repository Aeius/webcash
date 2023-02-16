<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
    	String path = request.getParameter("path");
    %>

<script type="text/javascript" src="<%=path %>/js/menu.js"></script>
<jsp:useBean id="login" class="com.user.UserBean" scope="session"></jsp:useBean>
    <div id="header">
		<a href="<%=path %>/"><img alt="" src="/nullproject/imgs/logo.png"></a>
		<%if(login.isResult()){ %>
		<div align="right"><a href="<%=path %>/login/logout.jsp" id="headLogin"><jsp:getProperty property="uid" name="login"/>님 로그아웃</a></div>
	 	<%}else{%>
		<div align="right"><a href="<%=path %>/login/login.jsp" id="headLogin">로그인</a></div>
	 	<%}  %>
	</div>
	
	<div id="menu">
	<ul>
		<li><a href="<%=path %>/menu.jsp">메뉴</a>
			<ol>
				<li><a href="<%=path %>/">후라이드</a>
					<ol>
						<li><a href="<%=path %>/"><img width="250px" height="150px" src="/nullproject/imgs/f1.jfif"> </a></li>
						<li><a href="<%=path %>/"><img width="250px" height="150px" alt="" src="/nullproject/imgs/f2.jpg"></a></li>
					</ol>
				</li>
				<li><a href="<%=path %>/">양념치킨</a>
					<ol>
						<li><a href="<%=path %>/"><img width="250px" height="150px" alt="" src="/nullproject/imgs/y1.jpg"></a></li>
						<li><a href="<%=path %>/"><img width="250px" height="150px" alt="" src="/nullproject/imgs/y2.png"></a></li>
					</ol></li>
				<li><a href="<%=path %>/">간장치킨</a>
					<ol>
						<li><a href="<%=path %>/"><img width="250px" height="150px" alt="" src="/nullproject/imgs/g1.jpg"></a></li>
						<li><a href="<%=path %>/"><img width="250px" height="150px" alt="" src="/nullproject/imgs/g2.jfif"></a></li>
					</ol></li>
			</ol></li>
		<li><a href="<%=path %>/map/map.jsp">오시는길</a></li>
		<li><a href="<%=path %>/review/review.do">고객후기</a></li>
		
		
		
		
		<%if(login.isResult()){ %>
		<li><a href="<%=path %>/myInfo/myInfo.jsp">내정보</a></li>
	 	<%}else{%>
		<li><a href="<%=path %>/login/login.jsp" id="headLogin">내정보</a></li>
	 	<%}  %>
		
	</ul>
</div>
	