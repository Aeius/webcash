<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
page import="customMysql.MysqlConnect, java.sql.*"
%>
<%
request.setCharacterEncoding("utf-8");

String m_id = request.getParameter("m_id")!=null?convertStrToSafety(request.getParameter("m_id")):"";

Connection conn=null;
Statement stmt=null;

String sql="delete from member where m_id = '"+m_id+"' ";
try{
	conn=MysqlConnect.getConn();
	stmt=conn.createStatement();
	stmt.executeUpdate(sql);
	
}finally{
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
	response.sendRedirect("../index.jsp");
}
%>
<%!
public String convertStrToSafety(String str){
	str=str.replace("--", "­­");
	str=str.replace("'", "＇");
	str=str.replace(",", "，");
	str=str.replace("<", "＜");
	str=str.replace(">", "＞");
	str=str.replace("(", "（");
	str=str.replace(")", "）");
	str=str.replace("%", "％");
	
	return str;
}
%>