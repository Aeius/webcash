<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<a href="../index.do"><div class="header"></div></a>
<%
String root = request.getContextPath();
String name = (String)session.getAttribute("name");
if(name==null){
%>
<div class="login">비회원 이용중...
<button onclick="location.href='<%=root%>/user/login.do'">login</button></div>
<%
} else {
%>
<div class="login"><%=name %>님 환영합니다. 
<button onclick="location.href='<%=root%>/user/logout.do'">logout</button></div>
<%
}
%>