<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
page import="customMysql.MysqlConnect, java.sql.*, java.util.*, model.Member"
%>
<%
request.setCharacterEncoding("utf-8");

int currentPageNum = request.getParameter("currentPageNum")!=null?Integer.parseInt(request.getParameter("currentPageNum")):0;
int countDataInPage = request.getParameter("countDataInPage")!=null?Integer.parseInt(request.getParameter("countDataInPage")):0;
int countInPageGroup = request.getParameter("countInPageGroup")!=null?Integer.parseInt(request.getParameter("countInPageGroup")):0;
String searchColumn = request.getParameter("searchColumn")!=null?convertStrToSafety(request.getParameter("searchColumn")):"";
String searchValue = request.getParameter("searchValue")!=null?convertStrToSafety(request.getParameter("searchValue")):"";

Connection conn=null;
Statement stmt=null;
ResultSet rs=null;
ArrayList<Member> result = new ArrayList<Member>();

String sql="";
String sqlWhere="";
int totalDataCount=0;

try{
	sqlWhere=" where 1=1 ";
	if(!searchColumn.equals("") && !searchValue.equals("")) sqlWhere+="and "+searchColumn+" like '%"+searchValue+"%' ";
	sql="select * from member "+sqlWhere+" order by reg_date desc limit "+currentPageNum+", "+countDataInPage;
	
	conn=MysqlConnect.getConn();
	stmt=conn.createStatement();
	rs=stmt.executeQuery(sql);
	
	while(rs.next()){
		Member member = new Member();
		member.setM_id(rs.getString("m_id"));
		member.setName(rs.getString("name"));
		member.setEmail(rs.getString("email"));
		member.setAge(rs.getInt("age"));
		member.setGender(rs.getString("gender"));
		member.setReg_date(rs.getString("reg_date"));
		
		result.add(member);
		totalDataCount++;
	}
}finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
}
%>
{
	"data":[
	<%
	for(int i=0;i<result.size();i++){
		Member member=result.get(i);
	%>
	{"m_id":"<%=member.getM_id() %>","name":"<%=member.getName() %>","email":"<%=member.getEmail() %>","age":"<%=member.getAge() %>","gender":"<%=member.getGender() %>","reg_date":"<%=member.getReg_date() %>"}
	<%
	if(i!=result.size()-1) out.print(",");
	}
	%>
	],
	"totalDataCount":<%=totalDataCount%>
}
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
