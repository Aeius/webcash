<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String projectName = "JMTrestaurant";
    String pageName = request.getParameter("pageName");
    %>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="<%="/"+projectName+"/css/common.css"%>">
    <link rel="stylesheet" href="<%="/"+projectName+"/css/"+pageName+".css"%>">
</head>