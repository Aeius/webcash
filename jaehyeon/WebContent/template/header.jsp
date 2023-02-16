<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="header">
<a href="../index.do"><div class="logo"></div></a>
<%
String root = request.getContextPath();
String name = (String)session.getAttribute("name");
String job = String.valueOf(session.getAttribute("job"));
if(name==null){
%>
<div class="login"><span>비회원 이용중...</span>
<button onclick="location.href='<%=root%>/user/login.do'">login</button></div>
<%
} else {
%>
<div class="login"><span><%=job %> <%=name %>님</span>
<button onclick="location.href='<%=root%>/user/logout.do'">logout</button></div>
<%
}
%>
</div>