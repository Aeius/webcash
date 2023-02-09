<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String projectName = "JMTrestaurant";
    String pageName = request.getParameter("pageName");
    %>
<head>
    <meta charset="UTF-8">
    <title>우리 동네 맛집</title>
    <link rel="stylesheet" href="<%="/"+projectName+"/css/common.css"%>">
    <link rel="stylesheet" href="<%="/"+projectName+"/css/"+pageName+".css"%>">
    
    <!-- font-awesome -->
    <link rel="stylesheet" href="<%="/"+projectName+"/css/common/font-awesome-4.7.0/css/font-awesome.css"%>">
    
    <!-- jquery -->
    <script src="<%="/"+projectName+"/js/common/jquery-1.12.4.min.js"%>"></script>
    <script src="<%="/"+projectName+"/js/common/index.js"%>"></script>
    
    <script src="<%="/"+projectName+"/js/"+pageName+".js"%>"></script>
</head>