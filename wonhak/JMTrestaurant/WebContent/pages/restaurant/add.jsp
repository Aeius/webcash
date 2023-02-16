<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/pages/templates/head.jsp">
        <jsp:param value="restaurant/add" name="pageName" />
    </jsp:include> 
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8fdc102fec7c743e98f39b3ed2466a1c"></script>
</head>
<%
session = request.getSession();

String m_id=null;
int level=10;
if(session.getAttribute("m_id")!=null){
	m_id=session.getAttribute("m_id").toString();
	level=Integer.parseInt(session.getAttribute("level").toString());
}
%>
<body>
	<jsp:include page="/pages/templates/header.jsp"></jsp:include> 
	<jsp:include page="/pages/templates/nav.jsp"></jsp:include> 
	<div id="contents">
        <div id="main">
            <div class="inputWrap">
                <div class="title">
                    <h2>맛집 추가</h2>
                </div>
                <form method="post" enctype="multipart/form-data">
                	<input type="hidden" name="m_id" value="<%=m_id %>" />
                    <div class="inputGroup">
                        <div class="inputForm">
                            <label for="name">맛집 이름</label>
                            <input type="text" name="name" id="name" />
                        </div>
                        <div class="inputForm">
                            <label for="addr">주소</label>
                            <input type="text" name="addr" id="addr" />
                        </div>
                        <div class="inputForm">
                            <label for="content">소개글</label>
                            <input type="text" name="content" id="content" />
                        </div>
                        <div class="inputForm">
                            <label>맛집 위치 지정</label>
                            <div id="map" class="mapContainer">
	        						
	        				</div>
                            <input type="hidden" name="loc_x" id="loc_x" value="0" />
                            <input type="hidden" name="loc_y" id="loc_y" value="0" />
                        </div>
                        <div class="inputForm">
                            <label for="img1">메인 사진</label>
                            <input type="file" name="img1" id="img1" />
                        </div>
                        <div class="inputForm">
                            <label for="img2">상세 사진1</label>
                            <input type="file" name="img2" id="img2" />
                        </div>
                        <div class="inputForm">
                            <label for="img3">상세 사진2</label>
                            <input type="file" name="img3" id="img3" />
                        </div>
                        <div class="inputForm">
                            <label for="img4">상세 사진3</label>
                            <input type="file" name="img4" id="img4" />
                        </div>
                        <div class="inputForm">
                            <label for="img5">상세 사진4</label>
                            <input type="file" name="img5" id="img5" />
                        </div>
                    </div>
                    <div class="buttonGroup">
                        <button type="submit">등록</button>
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