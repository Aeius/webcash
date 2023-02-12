<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
page import="customMysql.MysqlConnect, java.sql.*"
%>
<%
request.setCharacterEncoding("utf-8");

String m_id = request.getParameter("m_id")!=null?convertStrToSafety(request.getParameter("m_id")):"";
String password = request.getParameter("password")!=null?convertStrToSafety(request.getParameter("password")):"";
String name = request.getParameter("name")!=null?convertStrToSafety(request.getParameter("name")):"";
String email = request.getParameter("email")!=null?convertStrToSafety(request.getParameter("email")):"";
int age = request.getParameter("age")!=null?Integer.parseInt(convertStrToSafety(request.getParameter("age"))):0;
String gender = request.getParameter("gender")!=null?convertStrToSafety(request.getParameter("gender")):"M";

Connection conn=null;
Statement stmt=null;

String sql="insert into member(m_id,password,name,email,age,gender) ";
try{
	sql+="values(";
	sql+="'"+m_id+"',";
	sql+="md5('"+password+"'),";
	sql+="'"+name+"',";
	sql+="'"+email+"',";
	sql+="'"+age+"',";
	sql+="'"+gender+"'";
	sql+=")";
	System.out.println(sql);
	
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