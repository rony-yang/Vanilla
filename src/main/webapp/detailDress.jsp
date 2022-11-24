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
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}

		int productCode = 0;
		if (request.getParameter("productCode") != null) {
			productCode = Integer.parseInt(request.getParameter("productCode"));
		} 
		
	
		if (productCode == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('상품이 존재하지 않습니다')");
			script.println("location.href = 'productTop.jsp'");
			script.println("</script>");
		}
	
	
		Product product = new ProductDAO().getProduct(productCode);
		
		
	%>
		<div id="features-wrapper">
		<div class="container">
			<div style="width: 100%; height: auto;">
				<div style="width: 40%; height: auto; float: left;">
					<a href="#" class="image featured"><img src="./resources/images/dress/<%=product.getProductCode()%>.jpg" alt=""/></a>
				</div>
				<div style="width: 60%; height: auto; float: right;">
				<table style="text-align: center;" >
				<tr>
					<br />
					<br />
					<td>구분</td>
						<td><%=product.getProductGroup() %></td>
				</tr>
				<tr>
					<td>상세분류</td>
						<td><%=product.getProductSection() %></td>
				</tr>
				<tr>
					<td>상품명</td>
						<td><%=product.getProductName() %></td>
				</tr>
				<tr>
					<td>가격</td>
						<td><b><%=product.getProductPrice() %></b></td>
				</tr>
				<tr>
					<td>재고</td>
						<td><%=product.getProductStock() %></td>
				</tr>
				</table>
				</div>
			</div>
		</div>
		</div>
		
			<div style="text-align: center;">
				<a onclick="return confirm('장바구니에 넣으시겠습니까?')" href="cart.jsp" class="button small icon solid fa-arrow-circle-right" style="margin: 20px auto; padding: 0px 20px; font-size: 17px; justify-content: center;">장바구니 넣기</a>
				<a href="productDress.jsp" class="button small icon solid fa-arrow-circle-right" style="margin: 20px auto; padding: 0px 20px; font-size: 17px; justify-content: center;">목록으로 돌아가기</a>
			</div>


</body>
</html>