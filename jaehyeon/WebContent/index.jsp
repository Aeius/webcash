<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mycss.css" rel="stylesheet">
<link href="css/carousel.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/carousel.js"></script>

</head>
<body>
<%@ include file="template/header2.jsp" %>
<%@ include file="template/menu.jsp" %>
    
<div class="content">
<h1>학생 성적 관리 웹사이트(ver 0.7.0)</h1>
    <div class="carousel">
        <ul>
            <li><img src="imgs/notice1.png"></li>
            <li><img src="imgs/notice2.png"></li>
            <li><img src="imgs/notice3.png"></li>
            <li><img src="imgs/notice4.png"></li>
        </ul>
    </div>
<h2>공지사항</h2>
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
        <tr>
            <td>1</td>
            <td><a href="detail.jsp">내용이 긴 제목이라서 계속해서 제목이 있는데 이것이 모바일에서 줄어 보일지?</a></td>
            <td>박재현</td>
            <td>2023-02-06</td>
            <td>0</td>
        </tr>
        <tr>
            <td>2</td>
            <td>내용이 긴 제목2</td>
            <td>박재현2</td>
            <td>2023-02-06</td>
            <td>1</td>
        </tr>
    </tbody>
</table>
</div>
<%@ include file="template/footer.jsp"%>
</body>
</html>