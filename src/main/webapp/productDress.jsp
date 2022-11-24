<%@page import="oracle.jdbc.Const"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "product.Product" %>
<%@ page import = "product.ProductDAO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.sql.ResultSet"%>
<%@ page import = "java.sql.PreparedStatement"%>

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
	.threesteps {
		float: left; width: 25%;
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
					<li class="active"><a href="productDress.jsp">DRESS</a></li>			
					<li><a href="bbs.jsp">게시판</a></li>			
					<li><a href="cart.jsp">장바구니</a></li>			
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
					<li class="active"><a href="productDress.jsp">DRESS</a></li>			
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
	<%
		}
	%>
	
	<%
	
		final int DRESS_NUM=24; 
		
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1; // 기본페이지
		if (request.getParameter("pageNumber") != null ) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	
	
		<%
			ProductDAO productDAO = new ProductDAO();
			ArrayList<Product> list = productDAO.getList(pageNumber, "dress");
			for (int i=0; i<list.size(); i+=4) {
		%>
		
		<div id="features-wrapper">
		<div class="container">
			<div class="row">
				
				<div class="threesteps" >
				<!-- Box -->
				<div class="box feature">
				<a href="#" class="image featured"><img src="./resources/images/dress/<%=Integer.toString(i+1+DRESS_NUM)%>.jpg" alt=""/></a>
						<div class="inner">
							<p><%=list.get(i).getProductName() %></p>
							<p><%=list.get(i).getProductPrice()%></p>
							<br>
							<p><a href="detailDress.jsp?productCode=<%=list.get(i).getProductCode()%>" class="button small icon solid fa-arrow-circle-right" style="margin: 20px auto; padding: 0px 20px; font-size: 17px; display: flex; justify-content: center;">상세정보</a></p>
						</div>
				</div>
				</div>
				
				<div class="threesteps" >
				<!-- Box -->
				<div class="box feature">
				<a href="#" class="image featured"><img src="./resources/images/dress/<%=Integer.toString(i+2+DRESS_NUM)%>.jpg" alt=""/></a>
						<div class="inner">
							<p><%=list.get(i+1).getProductName() %></p>
							<p><%=list.get(i+1).getProductPrice()%></p>
							<br>
							<p><a href="detailDress.jsp?productCode=<%=list.get(i+1).getProductCode()%>" class="button small icon solid fa-arrow-circle-right" style="margin: 20px auto; padding: 0px 20px; font-size: 17px; display: flex; justify-content: center;">상세정보</a></p>
						</div>
				</div>
				</div>
				
				<div class="threesteps" >
				<!-- Box -->
				<div class="box feature">
				<a href="#" class="image featured"><img src="./resources/images/dress/<%=Integer.toString(i+3+DRESS_NUM)%>.jpg" alt=""/></a>
						<div class="inner">
							<p><%=list.get(i+2).getProductName() %></p>
							<p><%=list.get(i+2).getProductPrice()%></p>
							<br>
							<p><a href="detailDress.jsp?productCode=<%=list.get(i+2).getProductCode()%>" class="button small icon solid fa-arrow-circle-right" style="margin: 20px auto; padding: 0px 20px; font-size: 17px; display: flex; justify-content: center;">상세정보</a></p>
						</div>
				</div>
				</div>
				
				<div class="threesteps" >
				<!-- Box -->
				<div class="box feature">
				<a href="#" class="image featured"><img src="./resources/images/dress/<%=Integer.toString(i+4+DRESS_NUM)%>.jpg" alt=""/></a>
						<div class="inner">
							<p><%=list.get(i+3).getProductName() %></p>
							<p><%=list.get(i+3).getProductPrice()%></p>
							<br>
							<p><a href="detailDress.jsp?productCode=<%=list.get(i+3).getProductCode()%>" class="button small icon solid fa-arrow-circle-right" style="margin: 20px auto; padding: 0px 20px; font-size: 17px; display: flex; justify-content: center;">상세정보</a></p>
						</div>
				</div>
				</div>
				
				
			</div>
			
			<%
				}
			%>
			<%-- 
			
			
			<%
				if (pageNumber != 1) {
			%>
				<a href="productTop.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arrow-left">이전</a>
			<%		
				} if (productDAO.nextPage(pageNumber+1)) {
			%>
				<a href="productTop.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arrow-left">다음</a>
			<% 
				} 
			%>
			--%>
			
		</div>
		</div>
	
	
	<%@ include file="footer.jsp"%>
</body>
</html>