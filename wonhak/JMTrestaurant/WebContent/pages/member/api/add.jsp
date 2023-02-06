<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
page import="customMysql.MysqlConnect, java.sql.*"
%>
<%
Connection conn=MysqlConnect.getConn();
System.out.println(conn);
%>