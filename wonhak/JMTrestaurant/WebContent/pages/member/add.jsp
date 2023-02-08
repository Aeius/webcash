<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="/pages/templates/head.jsp">
        <jsp:param value="member/add" name="pageName" />
    </jsp:include> 
<body>
	<jsp:include page="/pages/templates/header.jsp"></jsp:include> 
	<jsp:include page="/pages/templates/nav.jsp"></jsp:include> 
	<div id="contents">
        <div id="main">
            <div class="inputWrap">
                <div class="title">
                    <h2>회원 추가</h2>
                </div>
                <form action="./api/insert.jsp" method="post">
                    <div class="inputGroup">
                        <div class="inputForm">
                            <label for="m_id">ID</label>
                            <input type="text" name="m_id" id="m_id" />
                        </div>
                        <div class="inputForm">
                            <label for="name">이름</label>
                            <input type="text" name="name" id="name" />
                        </div>
                        <div class="inputForm">
                            <label for="password">비밀번호</label>
                            <input type="password" name="password" id="password" />
                        </div>
                        <div class="inputForm">
                            <label for="password_re">비밀번호 확인</label>
                            <input type="password" name="password_re" id="password_re" />
                        </div>
                        <div class="inputForm">
                            <label for="email">이메일</label>
                            <input type="email" name="email" id="email" />
                        </div>
                        <div class="selectForm">
                            <label for="age">나이</label>
                            <select name="age" id="age">
                                <option value="8">8세</option>
                            </select>
                        </div>
                        <div class="radioForm">
                            <label>성별</label>
                            <div class="radioGroup">
                                <input type="radio" name="gender" id="gender_M" value="M" checked />
                                <label for="gender_M">남자</label>
                                <input type="radio" name="gender" id="gender_F" value="F" />
                                <label for="gender_F">여자</label>
                            </div>
                        </div>
                    </div>
                    <div class="buttonGroup">
                        <button type="submit">등록</button>
                        <button type="button" onclick="location.href='./'">뒤로가기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
	<jsp:include page="/pages/templates/footer.jsp"></jsp:include> 
	<jsp:include page="/pages/templates/foot.jsp"></jsp:include> 
</body>
</html>