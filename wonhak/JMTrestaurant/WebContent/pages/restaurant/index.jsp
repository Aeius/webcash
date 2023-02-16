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
    %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/pages/templates/head.jsp">
        <jsp:param value="restaurant/index" name="pageName" />
    </jsp:include> 
</head>
<body>
	<jsp:include page="/pages/templates/header.jsp"></jsp:include> 
	<jsp:include page="/pages/templates/nav.jsp"></jsp:include> 
	<div id="contents">
        <div id="main">
            <div class="searchForm">
                <div>
                    <div class="select">
                        <select name="searchColumn" id="searchColumn">
                            <option value="name">맛집 이름</option>
                            <option value="addr">주소</option>
                        </select>
                    </div>
                    <div class="input">
                        <input type="text" id="searchValue" />
                    </div>
                    <div class="button">
                        <button type="button" onclick="searchResult();">검색</button>
                    </div>
                </div>
        	</div>
        	<div class="dataTable">
        		<input type="hidden" id="m_id" value="<%=m_id %>" />
        		<input type="hidden" id="level" value="<%=level %>" />
                <table>
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>맛집 이름</th>
                            <th>주소</th>
                            <th>등록회원ID</th>
                            <th>등록일</th>
                            <%
                            if(m_id!=null && level==1){
                            %>
                            <th>설정</th>
                            <%
                            }
                            %>
                        </tr>
                    </thead>
                    <tbody id="dataList">
                        
                    </tbody>
                </table>
        	</div>
        	<div class="buttonForm">
                <div class="buttonGroup">
                    <button type="button" onclick="location.href='./add.do'">추가</button>
                </div>
            </div>
        	<div class="pagination">
                <div id="pageGroup">

                </div>
        	</div>
        	<div class="popupForm">
        		<div class="popupWrap">
        			<div class="popup">
	        			<div class="popupHeader">
	        				<i class="fa fa-window-close-o" aria-hidden="true"></i>
	        			</div>
	        			<div class="popupMain">
	        				<p>해당 맛집 게시글을 정말 삭제하시겠습니까?</p>
	        			</div>
	        			<div class="popupFooter">
	        				
	        			</div>
	        		</div>
        		</div>
        		
        	</div>
        </div>
    </div>
	<jsp:include page="/pages/templates/footer.jsp"></jsp:include> 
	<jsp:include page="/pages/templates/foot.jsp"></jsp:include> 
</body>
</html>