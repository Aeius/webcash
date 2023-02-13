<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="/pages/templates/head.jsp">
        <jsp:param value="restaurant/add" name="pageName" />
    </jsp:include> 
<body>
	<jsp:include page="/pages/templates/header.jsp"></jsp:include> 
	<jsp:include page="/pages/templates/nav.jsp"></jsp:include> 
	<div id="contents">
        <div id="main">
            <div class="inputWrap">
                <div class="title">
                    <h2>맛집 추가</h2>
                </div>
                <form method="post">
                	<input type="hidden" name="m_id" value="test11" />
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
                            <label for="loc_x">맛집 위치(x 좌표)</label>
                            <input type="number" name="loc_x" id="loc_x" />
                        </div>
                        <div class="inputForm">
                            <label for="loc_y">맛집 위치(y 좌표)</label>
                            <input type="number" name="loc_y" id="loc_y" />
                        </div>
                        <div class="inputForm">
                            <label for="img1">사진1</label>
                            <input type="file" name="img1" id="img1" />
                        </div>
                        <div class="inputForm">
                            <label for="img2">사진2</label>
                            <input type="file" name="img2" id="img2" />
                        </div>
                        <div class="inputForm">
                            <label for="img3">사진3</label>
                            <input type="file" name="img3" id="img3" />
                        </div>
                        <div class="inputForm">
                            <label for="img4">사진4</label>
                            <input type="file" name="img4" id="img4" />
                        </div>
                        <div class="inputForm">
                            <label for="img5">사진5</label>
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