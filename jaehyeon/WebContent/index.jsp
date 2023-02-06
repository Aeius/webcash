<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mycss.css" rel="stylesheet">
<script type="text/javascript">

</script>
</head>
<body>
<jsp:include page="template/header.jspf"/>
<jsp:include page="template/menu.jspf"/>
<div class="content">
<h1>학생 성적 관리 웹사이트(ver 0.7.0)</h1>
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
            <td>내용이 긴 제목</td>
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
<jsp:include page="template/footer.jspf"/>
</body>
</html>