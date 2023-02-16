<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
<jsp:useBean id="user" class="com.user.UserBean"/>
<jsp:setProperty property="*" name="user"/>
<%
if("get".equals(request.getMethod())){
	response.sendRedirect("../login/login.jsp");
	System.out.println("11");

	return;
}
if(!user.getUpw().equals(user.getRepw())){
	
	System.out.println(user.getUpw()+","+user.getRepw());
	response.sendRedirect("signup.jsp?id="+user.getuid());

	return;
}

	int suc=0;
	boolean success=false;
	Connection conn=null;
	PreparedStatement pstmt=null; 
	ResultSet rs=null;
	
	String url = "jdbc:mysql://localhost:3306/lecture";
	String user1 = System.getenv("MYSQL_USER");
	String password = System.getenv("MYSQL_PW");

	String sql = "insert into nulluser values (0,?,?,?,?)";
		System.out.println(user.getUname());
		System.out.println(user.getuid());
		System.out.println(user.getUmail());
		System.out.println(user.getUpw());
	try {
		System.out.println(sql);
		Class.forName("com.mysql.cj.jdbc.Driver");
		if(conn==null || conn.isClosed())
		conn = DriverManager.getConnection(url, user1, password);
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user.getUname());
		pstmt.setString(2, user.getuid());
		pstmt.setString(3, user.getUmail());
		pstmt.setString(4, user.getUpw());
		suc = pstmt.executeUpdate();
		
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	

	response.sendRedirect("../");
%>
</body>
</html>