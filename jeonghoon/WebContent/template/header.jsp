<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
    	String path = request.getParameter("path");
    %>

    <div id="header">
		<a href="<%=path %>/"><img alt="" src="/nullproject/imgs/logo.png"></a>
		<div><a href="<%=path %>/login/login.jsp" id="headLogin">로그인</a></div>
		
	</div>