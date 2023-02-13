<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String projectName = request.getContextPath();
    String url = request.getServletPath();
    String[] urlArr = url.split("/");
    String pageName=null;
    if(urlArr.length>2 && urlArr[2]!=null)
    	pageName=urlArr[2];
    
    System.out.println(pageName);
    %>
<div id="nav">
        <ul>
            <li><a href="<%=projectName %>/" class="<%=pageName==null?"active":"" %>">홈</a></li>
            <li class="menu">
            	<a href="#" class="<%=pageName!=null&&pageName.equals("member")?"active":"" %>">회원 관리</a>
            	<ul>
                    <li><a href="<%=projectName %>/pages/member/">회원 목록</a></li>
                    <li><a href="<%=projectName %>/pages/member/add.jsp">회원 추가</a></li>
                </ul>
            </li>
            <li class="menu">
            	<a href="<%=projectName %>/" class="<%=pageName!=null&&pageName.equals("restaurant")?"active":"" %>">맛집 관리</a>
            	<ul>
                    <li><a href="<%=projectName %>/restaurant/list.do">맛집 목록</a></li>
                    <li><a href="<%=projectName %>/restaurant/add.do">맛집 추가</a></li>
                </ul>
            </li>
            <!--<li class="menu">
            	<a href="<%=projectName %>/" class="<%=pageName!=null&&pageName.equals("community")?"active":"" %>">커뮤니티</a>
            	<ul>
                    <li>item1</li>
                    <li>item2</li>
                    <li>item3</li>
                </ul>
            </li>  -->
        </ul>
    </div>