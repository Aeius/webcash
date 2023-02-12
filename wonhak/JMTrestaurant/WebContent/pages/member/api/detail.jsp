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
try{
	conn=MysqlConnect.getConn();
	stmt=conn.createStatement();
	rs=stmt.executeQuery(sql);
	
	if(rs.next()){
		Member member = new Member();
		member.setM_id(rs.getString("m_id"));
		member.setName(rs.getString("name"));
		member.setEmail(rs.getString("email"));
		member.setAge(rs.getInt("age"));
		member.setGender(rs.getString("gender"));
		member.setReg_date(rs.getString("reg_date"));
		
		result.add(member);
	}
}finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
}

for(int i=0;i<result.size();i++){
	Member member=result.get(i);
%>
{"m_id":"<%=member.getM_id() %>","name":"<%=member.getName() %>","email":"<%=member.getEmail() %>","age":"<%=member.getAge() %>","gender":"<%=member.getGender() %>","reg_date":"<%=member.getReg_date() %>"}
<%
if(i!=result.size()-1) out.print(",");
}
%>

