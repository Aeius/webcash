<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String projectName = request.getContextPath();
    
	session = request.getSession();
    
    String m_id=null;
    int level=10;
    if(session.getAttribute("m_id")!=null){
    	m_id=session.getAttribute("m_id").toString();
    	level=Integer.parseInt(session.getAttribute("level").toString());
    }
    
    if(m_id!=null){
    %>
    <div id="header">
        <h1>우리 동네 JMT</h1>
        <div>
        	<div class="headerLogin">
	           	<span onclick="location.href='<%=projectName %>/logout.do'"><i class="fa fa-sign-out" aria-hidden="true"></i> 로그아웃</span>
	        </div>
        </div>
    </div>
    <%
    }else{
    %>
    <div id="header">
        <h1>우리 동네 JMT</h1>
        <div>
        	<div class="headerLogin">
	           	<span onclick="location.href='<%=projectName %>/login.do'"><i class="fa fa-sign-in" aria-hidden="true"></i> 로그인</span><span onclick="location.href='<%=projectName %>/join.do'"><i class="fa fa-user-plus" aria-hidden="true"></i> 회원가입</span>
	        </div>
        </div>
    </div>
    <%
    }
    %>