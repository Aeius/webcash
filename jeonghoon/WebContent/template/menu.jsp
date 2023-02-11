<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="js/menu.js"></script>
<%
	if (true) {
%>
<div id="menu">
	<ul>
		<li><a href="menu.jsp">메뉴</a>
			<ol>
				<li><a href="emp/list.html">후라이드</a>
					<ol>
						<li><a href="emp/list.html">후라이드1</a></li>
						<li><a href="emp/add.html">후라이드2</a></li>
					</ol>
				</li>
				<li><a href="emp/list.html">양념치킨</a>
					<ol>
						<li><a href="emp/list.html">양념치킨1</a></li>
						<li><a href="emp/add.html">양념치킨2</a></li>
					</ol></li>
				<li><a href="emp/list.html">간장치킨</a>
					<ol>
						<li><a href="emp/list.html">간장치킨1</a></li>
						<li><a href="emp/add.html">간장치킨2</a></li>
					</ol></li>
			</ol></li>
		<li><a href="#">오시는길</a></li>
		<li><a href="#">고객문의</a></li>
		<li><a href="#">내정보</a></li>
	</ul>
</div>
<%
	} else {
%>
<div id="menu">
	<ul>
		<li><a href="../menu.jsp">메뉴</a></li>
		<li><a href="#">오시는길</a></li>
		<li><a href="#">치킨게시판</a></li>
		<li><a href="#">내정보</a></li>
	</ul>
</div>

<%
	}
%>