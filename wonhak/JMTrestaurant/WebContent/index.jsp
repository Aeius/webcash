<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="./pages/templates/head.jsp">
        <jsp:param value="index" name="pageName" />
    </jsp:include> 
<body>
	<jsp:include page="./pages/templates/header.jsp"></jsp:include> 
	<jsp:include page="./pages/templates/nav.jsp"></jsp:include> 
	<div id="contents">
        <div id="main">
            메인화면입니다.
        </div>
    </div>
	<jsp:include page="./pages/templates/footer.jsp"></jsp:include> 
	<jsp:include page="./pages/templates/foot.jsp">
        <jsp:param value="index" name="pageName" />
    </jsp:include> 
</body>
</html>