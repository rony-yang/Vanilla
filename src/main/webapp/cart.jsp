<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<li><a href="main.jsp">Main</a></li>			
					<li><a href="login.jsp">로그인</a></li>			
					<li><a href="productTop.jsp">TOP</a></li>			
					<li><a href="productBottom.jsp">BOTTOM</a></li>			
					<li><a href="productDress.jsp">DRESS</a></li>			
					<li><a href="bbs.jsp">게시판</a></li>			
					<li class="active"><a href="cart.jsp">장바구니</a></li>			
				</ul>
			</nav>
		</header>
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
					<li><a href="main.jsp">Main</a></li>			
					<li><a href="logoutAction.jsp">로그아웃</a></li>			
					<li><a href="productTop.jsp">TOP</a></li>			
					<li><a href="productBottom.jsp">BOTTOM</a></li>			
					<li><a href="productDress.jsp">DRESS</a></li>			
					<li><a href="bbs.jsp">게시판</a></li>			
					<li class="active"><a href="cart.jsp">장바구니</a></li>			
				</ul>
				<ul>
					<li  style="width: 100%; text-align: right;"><%=userID %>님 로그인 중입니다</li>
				</ul>
			</nav>
		</header>
		</div>
		<br />
	<%
		}
	%>
	<br />
	<br />
	
	
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #595959; text-align: center;">구분</th>
						<th style="background-color: #595959; text-align: center;">상세분류</th>
						<th style="background-color: #595959; text-align: center;">상품명</th>
						<th style="background-color: #595959; text-align: center;">가격</th>
						<th style="background-color: #595959; text-align: center;">재고</th>
					</tr>
				</thead>
				<tbody>
				
				
				
					<tr>
						<th></th>
						<th></th>
						<th>총액 : </th>
						<th>원</th>
<%-- 						<th><%=sum %></th> --%>
						<th></th>
					</tr>
				
				</tbody>
			</table>
			
		</div>
	</div>
	
	
	
	
	<%@ include file="footer.jsp"%>
</body>
</html>