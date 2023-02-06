<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String projectName = "JMTrestaurant";
    String url = request.getServletPath();
    String[] urlArr = url.split("/");
    String pageName=null;
    if(urlArr.length>2 && urlArr[2]!=null)
    	pageName=urlArr[2];
    
    System.out.println(pageName);
    %>
<div id="nav">
        <ul>
            <li><a href="/<%=projectName %>/" class="<%=pageName==null?"active":"" %>">홈</a></li>
            <li><a href="/<%=projectName %>/pages/member/" class="<%=pageName!=null&&pageName.equals("member")?"active":"" %>">회원 목록</a></li>
            <li><a href="/<%=projectName %>/" class="<%=pageName!=null&&pageName.equals("restaurant")?"active":"" %>">맛집 목록</a></li>
            <li><a href="/<%=projectName %>/" class="<%=pageName!=null&&pageName.equals("community")?"active":"" %>">커뮤니티</a></li>
        </ul>
    </div>