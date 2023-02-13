<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
    	String path = request.getParameter("path");
    %>

<script type="text/javascript" src="<%=path %>/js/menu.js"></script>

    <div id="header">
		<a href="<%=path %>/"><img alt="" src="/nullproject/imgs/logo.png"></a>
		<div><a href="<%=path %>/login/login.jsp" id="headLogin">로그인</a></div>
		
	</div>
	
	<div id="menu">
	<ul>
		<li><a href="<%=path %>/menu.jsp">메뉴</a>
			<ol>
				<li><a href="<%=path %>/">후라이드</a>
					<ol>
						<li><a href="<%=path %>/">후라이드1</a></li>
						<li><a href="<%=path %>/">후라이드2</a></li>
					</ol>
				</li>
				<li><a href="<%=path %>/">양념치킨</a>
					<ol>
						<li><a href="<%=path %>/">양념치킨1</a></li>
						<li><a href="<%=path %>/">양념치킨2</a></li>
					</ol></li>
				<li><a href="<%=path %>/">간장치킨</a>
					<ol>
						<li><a href="<%=path %>/">간장치킨1</a></li>
						<li><a href="<%=path %>/">간장치킨2</a></li>
					</ol></li>
			</ol></li>
		<li><a href="<%=path %>/map/map.jsp">오시는길</a></li>
		<li><a href="<%=path %>/review/review.do">고객후기</a></li>
		<li><a href="<%=path %>/myInfo/myInfo.jsp">내정보</a></li>
	</ul>
</div>
	