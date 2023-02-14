<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
page import="customMysql.MysqlConnect, java.sql.*, java.util.*, model.Member"
%>
<%
request.setCharacterEncoding("utf-8");

String m_id = request.getParameter("m_id")!=null?request.getParameter("m_id"):"";

Connection conn=null;
Statement stmt=null;
ResultSet rs=null;
ArrayList<Member> result = new ArrayList<Member>();

String sql="select * from member where m_id='"+m_id+"' ";
Member member = new Member();
try{
	conn=MysqlConnect.getConn();
	stmt=conn.createStatement();
	rs=stmt.executeQuery(sql);
	
	if(rs.next()){
		member.setM_id(rs.getString("m_id"));
		member.setName(rs.getString("name"));
		member.setEmail(rs.getString("email"));
		member.setAge(rs.getInt("age"));
		member.setGender(rs.getString("gender"));
		member.setReg_date(rs.getString("reg_date"));
	}
}finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
	
	out.println(member.toString());
}
%>

