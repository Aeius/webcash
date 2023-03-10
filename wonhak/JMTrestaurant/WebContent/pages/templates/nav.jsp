<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String projectName = request.getContextPath();
    String url = request.getServletPath();
    String[] urlArr = url.split("/");
    String pageName=null;
    if(urlArr.length>2 && urlArr[2]!=null)
    	pageName=urlArr[2];
    
    session = request.getSession();
    
    String m_id=null;
    int level=10;
    if(session.getAttribute("m_id")!=null){
    	m_id=session.getAttribute("m_id").toString();
    	level=Integer.parseInt(session.getAttribute("level").toString());
    }
    
    if(m_id!=null){
    %>
<div id="nav">
        <ul>
        	<% 
        	if(level==10){
        	%>
            <li><a href="<%=projectName %>/restaurant/list.do" class="active">맛집 목록</a></li>
            <li><a href="<%=projectName %>/restaurant/add.do" class="active">맛집 추가</a></li>
            <%
        	}else{
        		%>
        		<%-- <li><a href="<%=projectName %>/" class="<%=pageName==null?"active":"" %>">홈</a></li> --%>
            <li class="menu">
            	<a href="<%=projectName %>/pages/member/" class="<%=pageName!=null&&pageName.equals("member")?"active":"" %>">회원 관리</a>
            	<ul>
                    <li><a href="<%=projectName %>/pages/member/">회원 목록</a></li>
                    <li><a href="<%=projectName %>/pages/member/add.jsp">회원 추가</a></li>
                </ul>
            </li>
            <li class="menu">
            	<a href="<%=projectName %>/restaurant/list.do" class="<%=pageName!=null&&pageName.equals("restaurant")?"active":"" %>">맛집 관리</a>
            	<ul>
                    <li><a href="<%=projectName %>/restaurant/list.do">맛집 목록</a></li>
                    <li><a href="<%=projectName %>/restaurant/add.do">맛집 추가</a></li>
                </ul>
            </li>
        		<%
        	}
            %>
        </ul>
    </div>
    <%
    }
    %>