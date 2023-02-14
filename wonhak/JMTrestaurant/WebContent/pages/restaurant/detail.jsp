<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="/pages/templates/head.jsp">
        <jsp:param value="restaurant/detail" name="pageName" />
    </jsp:include> 
<body>
	<jsp:include page="/pages/templates/header.jsp"></jsp:include> 
	<jsp:include page="/pages/templates/nav.jsp"></jsp:include> 
	<div id="contents">
        <div id="main">
            <div class="inputWrap">
                <div class="title">
                    <h2>맛집 상세</h2>
                </div>
                <form method="post">
                <%
                int r_id=Integer.parseInt(request.getParameter("r_id"));
                %>
                	<input type="hidden" name="r_id" value="<%=r_id %>" readonly />
                	<input type="hidden" name="m_id" value="test11" readonly />
                    <div class="inputGroup">
                        <div class="inputForm">
                            <label for="name">맛집 이름</label>
                            <input type="text" name="name" id="name" readonly />
                        </div>
                        <div class="inputForm">
                            <label for="addr">주소</label>
                            <input type="text" name="addr" id="addr" readonly />
                        </div>
                        <div class="inputForm">
                            <label for="content">소개글</label>
                            <input type="text" name="content" id="content" readonly />
                        </div>
                        <div class="inputForm">
                            <label for="loc_x">맛집 위치(x 좌표)</label>
                            <input type="number" name="loc_x" id="loc_x" readonly />
                        </div>
                        <div class="inputForm">
                            <label for="loc_y">맛집 위치(y 좌표)</label>
                            <input type="number" name="loc_y" id="loc_y" readonly />
                        </div>
                        <div class="imgViewForm">
                        	
                        </div>
                    </div>
                    <div class="buttonGroup">
                        <button type="button" onclick="location.replace('./edit.do?r_id=<%=r_id %>')">수정</button>
                        <button type="button" onclick="location.replace('./list.do')">뒤로가기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
	<jsp:include page="/pages/templates/footer.jsp"></jsp:include> 
	<jsp:include page="/pages/templates/foot.jsp"></jsp:include> 
</body>
</html>