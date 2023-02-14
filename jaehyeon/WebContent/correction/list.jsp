<%@page import="com.bit.model.CorrectionDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/mycss.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
</head>
<body>
<%@ include file="../template/header.jsp" %>
<%@ include file="../template/menu2.jsp" %>

<div class="content">
<h1>학생 성적 관리 웹사이트(ver 0.7.0)</h1>
<h2>정정 요청 게시판</h2>
<table>
	<thead>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
	</thead>
    <tbody>
    <%
    List<CorrectionDTO> list = (List<CorrectionDTO>)request.getAttribute("correction");
    for(CorrectionDTO bean : list){
    %>
        <tr>
            <td><a href="detail.do?num=<%=bean.getNum()%>"><%=bean.getNum() %></a></td>
            <td><a href="detail.do?num=<%=bean.getNum()%>"><%=bean.getTitle() %></a></td>
            <td><a href="detail.do?num=<%=bean.getNum()%>"><%=bean.getUserName() %></a></td>
            <td><a href="detail.do?num=<%=bean.getNum()%>"><%=bean.getDate() %></a></td>
            <td><a href="detail.do?num=<%=bean.getNum()%>"><%=bean.getCnt() %></a></td>
        </tr>
     <%} %>
    </tbody>
</table>
	<div id="pagination">
  		<a href="#">이전</a>
  		<a href="#">1</a>
  		<a href="#">2</a>
  		<a href="#">3</a>
  		<a href="#">4</a>
  		<a href="#">5</a>
  		<a href="#">이후</a>
  	</div>
  	<div id="search">
  		<select>
  			<option>제목</option>
  			<option>작성자</option>
  			<option>내용</option>
  		</select>
  		<input type="text" name="search">
  		<button type="submit">검색</button>
  		<a href="write.jsp">글작성</a>
	</div>
</div>
<%@ include file="../template/footer.jsp"%>
</body>
</html>