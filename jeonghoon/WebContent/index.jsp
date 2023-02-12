<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/jquery.bxslider.min.css">

<style type="text/css">
.bx{
	width: 550px;
	margin: 0px auto;
}
.bx>ul{}
.bx>ul>li{}
.bx li>img{
	width:	550px;
	height: 300px;
}
.bx .bx-wrapper{
	position: relative;
}
.bx .bx-controls-direction>a{
	position: absolute;
	top:32px;
	left:0px;
	background-color: rgba(0,0,0,0.0);
	width: 250px;
	height: 282px;
}
.bx-pager{
	width: 120px;
	margin: 0px auto;
}
.bx-pager .bx-pager-item{
	float: left;
	width: 20px;height:20px;
}
.bx .bx-controls-direction>a:last-child{
	left: 290px;
}
.bx .bx-pager-link{
	text-decoration: none;
	color: grey;
}
.bx .bx-pager .active{
	color: #333;
}
.contentText{
	width: 700px;
	margin: 0px auto;
}

</style>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/jquery.bxslider.min.js"></script>
<script type="text/javascript">
$(function() {
	$('.bx>ul').bxSlider({slideWidth:550,moveSlides:1});	
	});

</script>
</head>
<body>
	
	<jsp:include page="template/header.jsp">
				<jsp:param value="." name="path"/>
	</jsp:include>
		<div id="content">
		<div class="bx">
			<ul>
				<li><img src="imgs/chick1.jfif"/></li>
				<li><img src="imgs/chick2.jpg"/></li>
				<li><img src="imgs/chick3.jpg"/></li>
				<li><img src="imgs/chick4.jpg"/></li>
				<li><img src="imgs/chick5.jfif"/></li>
			</ul>
		</div>
		<div class="contentText">
			<p>저희 치킨은 어쩌고~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>
			<p>치킨 집의 역사는 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>
			<p>프렌차이즈 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>
		</div>
	</div>
	<jsp:include page="template/footer.jsp"></jsp:include>
</body>
</html>
