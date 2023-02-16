<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String userNum = String.valueOf(session.getAttribute("num"));
%>
<div class="menu">
    <ul>
        <li><a href="notice/list.do">공지 사항</a></li>
        <li><a href="correction/list.do">정정 요청</a></li>
        <li><a href="student/list.do?num=<%=userNum%>">나의 성적</a></li>
        <li><a href="teacher/list.do">성적 관리</a></li>
    </ul>
</div>