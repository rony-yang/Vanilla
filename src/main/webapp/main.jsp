<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="./resources/css/main.css">
<style type="text/css">
	@font-face {
		font-family:"freefont";
		src:url("./resources/font/tway_fly.woff") format("trueType");
	}
	body {
	font-family:freefont;
	}
</style>
<title>Vanilla Shopping Mall</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>

	<%
		if (userID == null) {
	%>
		<div id="header-wrapper">
		<header id="header" class="container">
		
			<!-- Logo -->
			<div id="logo">
				<h1><a href="main.jsp">Vanilla</a></h1>
			</div>
	
			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li class="active"><a href="main.jsp">Main</a></li>			
					<li><a href="login.jsp">로그인</a></li>			
					<li><a href="productTop.jsp">TOP</a></li>			
					<li><a href="productBottom.jsp">BOTTOM</a></li>			
					<li><a href="productDress.jsp">DRESS</a></li>			
					<li><a href="bbs.jsp">게시판</a></li>			
					<li><a href="cart.jsp">장바구니</a></li>			
				</ul>
			</nav>
		</header>
		</div>
		<!-- Banner -->
		<div id="banner-wrapper">
			<div id="banner" class="box container">
				<div class="row">
					<div class="col-9 col-12-medium">
						<h2>WELCOME</h2>
						<p>바닐라 쇼핑몰에 오신것을 환영합니다</p>
					</div>
						<div class="col-3 col-12-medium">
							<ul>
								<li><a href="login.jsp" class="button medium icon solid fa-arrow-circle-right">로그인</a></li>
								<li><a href="join.jsp" class="button alt medium icon solid fa-question-circle">회원가입</a></li>
							</ul>
						</div>
				</div>
			</div>
		</div>
		
	<%
		} else {
	%>
		<div id="header-wrapper">
		<header id="header" class="container">
		
			<!-- Logo -->
			<div id="logo">
				<h1><a href="main.jsp">Vanilla</a></h1>
			</div>
	
			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li class="active"><a href="main.jsp">Main</a></li>			
					<li><a href="logoutAction.jsp">로그아웃</a></li>			
					<li><a href="productTop.jsp">TOP</a></li>			
					<li><a href="productBottom.jsp">BOTTOM</a></li>			
					<li><a href="productDress.jsp">DRESS</a></li>			
					<li><a href="bbs.jsp">게시판</a></li>			
					<li><a href="cart.jsp">장바구니</a></li>	
				</ul>
				<ul>
					<li  style="width: 100%; text-align: right;"><%=userID %>님 로그인 중입니다</li>
				</ul>
			</nav>
		</header>
		</div>
		<br />
		<div id="banner-wrapper">
			<div id="banner" class="box container">
				<div class="row">
					<div class="col-12 col-12-medium">
						<h2>WELCOME</h2>
						<p>바닐라 쇼핑몰에 오신것을 환영합니다</p>
					</div>
				</div>
			</div>
		</div>
		
	<%
		}
	%>				
	
	
	
	
	<div class="row">
		<div class="col-12">
			<div id="copyright">
				<h2>대표상품 둘러보기</h2>
			</div>
		</div>
	</div>
	
	<!-- Features -->
	<div id="features-wrapper">
		<div class="container">
			<div class="row">
				<div class="col-4 col-12-medium">

				<!-- Box -->
				<section class="box feature">
					<a href="#" class="image featured"><img src="./resources/images/top/10.jpg" /></a>
						<div class="inner">
							<p>부드러운 터치감의 쾌적한 원단으로 만들어진<br /> 세련된 분위기의 자켓입니다.</p>
							<br>
							<p><a href="productTop.jsp" class="button small icon solid fa-arrow-circle-right" style="margin: 20px auto; padding: 0px 20px; font-size: 17px; display: flex; justify-content: center;">상의 더 보러가기</a></p>
						</div>
				</section>

				</div>
				
				<div class="col-4 col-12-medium">

				<!-- Box -->
				<section class="box feature">
					<a href="#" class="image featured"><img src="./resources/images/bottom/16.jpg" /></a>
						<div class="inner">
							<p>깔끔하고 단정한 H라인의 세련되면서도 고급진<br /> 무드의 미디 스커트입니다.</p>
							<br>
							<p><a href="productBottom.jsp" class="button small icon solid fa-arrow-circle-right" style="margin: 20px auto; padding: 0px 20px; font-size: 17px; display: flex; justify-content: center;">하의 더 보러가기</a></p>
						</div>
				</section>

				</div>
				<div class="col-4 col-12-medium">

				<!-- Box -->
				<section class="box feature">
					<a href="#" class="image featured"><img src="./resources/images/dress/32.jpg" /></a>
						<div class="inner">
							<p>셔링을 넣어 자연스러운 볼륨감이 여성스러운<br /> 분위기를 연출해주는 원피스입니다.</p>
							<br>
							<p><a href="productDress.jsp" class="button small icon solid fa-arrow-circle-right" style="margin: 20px auto; padding: 0px 20px; font-size: 17px; display: flex; justify-content: center;">원피스 더 보러가기</a></p>
						</div>
				</section>

				</div>
			</div>
		</div>
	</div>
				
	
	<%@ include file="footer.jsp"%>
	
	<!-- Scripts -->
	<script src="./resources/js/jquery.min.js"></script>
	<script src="./resources/js/jquery.dropotron.min.js"></script>
	<script src="./resources/js/browser.min.js"></script>
	<script src="./resources/js/breakpoints.min.js"></script>
	<script src="./resources/js/util.js"></script>
	<script src="./resources/js/main.js"></script>
</body>
</html>