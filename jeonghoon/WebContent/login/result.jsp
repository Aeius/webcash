<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="login" class="com.user.UserBean" scope="session"/>
<jsp:setProperty property="*" name="login"/>
<%
	int suc=0;
	boolean success=false;
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs = null;
	String url = "jdbc:mysql://localhost:3306/lecture";
	String user = System.getenv("MYSQL_USER");
	String password = System.getenv("MYSQL_PW");

// 	String sql = "select count(*) as cnt from nulluserwhere uid='"+login.getUid()+"' and upw=md5('"+login.getUpw()+"')";
	String sql = "select count(*) as cnt from nulluser where uid='"+login.getUid()+"' and upw='"+login.getUpw()+"'";
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		if(conn==null || conn.isClosed())
		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		rs=stmt.executeQuery(sql);
		if(rs.next()){
			login.setResult(rs.getInt("cnt")>0);
			}
		if(login.isResult()){
			sql = "select * from nulluser where uid='"+login.getUid()+"';";
			stmt.close();
			rs.close();
			stmt = conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()){
				login.setNum(rs.getInt("num"));
				login.setUid(rs.getString("uid"));
				login.setUmail(rs.getString("umail"));
				login.setUname(rs.getString("uname"));
			}
		}
		
	}finally{
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
	response.sendRedirect("../");
%>
</body>
</html>