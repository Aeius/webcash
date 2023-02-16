<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String projectName = request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="./pages/templates/head.jsp">
        <jsp:param value="index" name="pageName" />
    </jsp:include> 
    <script src="<%=projectName %>/js/common/masonry.pkgd.js"></script>
    <script src="<%=projectName %>/js/common/imagesLoaded.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8fdc102fec7c743e98f39b3ed2466a1c"></script>
</head>
<body>
	<jsp:include page="./pages/templates/header.jsp"></jsp:include> 
	<jsp:include page="./pages/templates/nav.jsp"></jsp:include> 
	<div id="contents">
        <div id="main">
            <div class="restaurantListContainer">
            </div>
            <div class="popupForm">
        		<div class="popupWrap">
        			<div class="popup">
	        			<div class="popupMain">
	        				<div>
	        					<h2></h2>
	        					<p>함박스테이크집</p>
	        				</div>
	        				<div>
	        					<img src="" />
	        				</div>
	        				<div>
	        					<i class='fa fa-map-marker' aria-hidden='true'></i>
	        					<span></span>
	        					<div id="map" class="mapContainer">
	        						
	        					</div>
	        				</div>
	        			</div>
	        			<div class="popupFooter">
	        				<button>닫기</button>
	        			</div>
	        		</div>
        		</div>
        		
        	</div>
        </div>
    </div>
	<jsp:include page="./pages/templates/footer.jsp"></jsp:include> 
	<jsp:include page="./pages/templates/foot.jsp"></jsp:include> 
</body>
</html>