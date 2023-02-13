<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
page import="customMysql.MysqlConnect, java.sql.*, java.util.*, model.Member"
%>
<%
request.setCharacterEncoding("utf-8");

int currentPageNum = request.getParameter("currentPageNum")!=null?(Integer.parseInt(request.getParameter("currentPageNum"))-1):0;
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
	conn=MysqlConnect.getConn();
	
	sqlWhere=" where 1=1 ";
	if(!searchColumn.equals("") && !searchValue.equals("")) sqlWhere+="and mem."+searchColumn+" like '%"+searchValue+"%' ";
	
	sql="select count(*) as cnt from member mem "+sqlWhere;
	stmt=conn.createStatement();
	rs=stmt.executeQuery(sql);
	
	if(rs.next()){
		totalDataCount=rs.getInt("cnt");
	}
	
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
	int startPage = startPage = currentPageNum*countDataInPage;
	//else startPage = (currentPageNum*countDataInPage)+1;
	//sql="select mem.* from member mem, (select @rownum=:@rownum+1 from dual) a "+sqlWhere+" order by mem.reg_date desc limit "+currentPageNum+", "+countDataInPage;
	sql="select * from (select mem.*, @rownum:=@rownum+1 as num from member mem, (select @rownum:=0 from dual) a "+sqlWhere+") b order by num asc limit "+startPage+", "+countDataInPage;
	System.out.println(sql);
	
	stmt=conn.createStatement();
	rs=stmt.executeQuery(sql);
	
	while(rs.next()){
		Member member = new Member();
		member.setNum(rs.getInt("num"));
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
%>
{
	"data":[
	<%
	for(int i=0;i<result.size();i++){
		Member member=result.get(i);
	%>
	{"num":"<%=member.getNum() %>","m_id":"<%=member.getM_id() %>","name":"<%=member.getName() %>","email":"<%=member.getEmail() %>","age":"<%=member.getAge() %>","gender":"<%=member.getGender() %>","reg_date":"<%=member.getReg_date() %>"}
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
