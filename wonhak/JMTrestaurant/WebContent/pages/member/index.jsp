<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String projectName = "JMTrestaurant";
    %>
<!DOCTYPE html>
<html>
    <jsp:include page="/pages/templates/head.jsp">
        <jsp:param value="member/index" name="pageName" />
    </jsp:include> 
<body>
	<jsp:include page="/pages/templates/header.jsp"></jsp:include> 
	<jsp:include page="/pages/templates/nav.jsp"></jsp:include> 
	<div id="contents">
        <div id="main">
            <div class="searchForm">
                <div>
                    <div class="select">
                        <select name="searchColumn" id="searchColumn">
                            <option value="m_id">ID</option>
                            <option value="m_name">이름</option>
                            <option value="m_email">이메일</option>
                        </select>
                    </div>
                    <div class="input">
                        <input type="text" id="searchValue" />
                    </div>
                    <div class="button">
                        <button type="button">검색</button>
                    </div>
                </div>
        	</div>
        	<div class="dataTable">
                <table>
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>ID</th>
                            <th>이름</th>
                            <th>이메일</th>
                            <th>나이</th>
                            <th>성별</th>
                            <th>등록일</th>
                        </tr>
                    </thead>
                    <tbody id="dataList">
                        
                    </tbody>
                </table>
        	</div>
        	<div class="buttonForm">
                <div class="buttonGroup">
                    <button type="button" onclick="location.href='./add.jsp'">추가</button>
                </div>
            </div>
        	<div class="pagination">
                <div>
                    <span>
                        이전
                    </span>
                    <span>
                        1
                    </span>
                    <span>
                        2
                    </span>
                    <span>
                        3
                    </span>
                    <span>
                        4
                    </span>
                    <span>
                        5
                    </span>
                    <span>
                        다음
                    </span>
                </div>
        	</div>
        </div>
    </div>
	<jsp:include page="/pages/templates/footer.jsp"></jsp:include> 
	<jsp:include page="/pages/templates/foot.jsp"></jsp:include> 
</body>
</html>