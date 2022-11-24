<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>
<%
request.setCharacterEncoding("UTF-8");
%>

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
					<li class="active"><a href="bbs.jsp">게시판</a></li>			
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
					<li><a href="productDress.jsp">DRESS</a></li>			
					<li class="active"><a href="bbs.jsp">게시판</a></li>			
					<li><a href="cart.jsp">장바구니</a></li>			
				</ul>
				<ul>
					<li  style="width: 100%; text-align: right;"><%=userID%>님 로그인 중입니다</li>
				</ul>
			</nav>
		</header>
		</div>
		<br />
	<%
	}
	%>
	
	
	
	<%
				userID = null;
						if (session.getAttribute("userID") != null) {
					userID = (String) session.getAttribute("userID");
						}
						
						if(userID == null) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('로그인을 하세요')");
					script.println("location.href = 'login.jsp'");
					script.println("</script>");
						}
						
						int bbsID = 0;
						if (request.getParameter("bbsID") != null) {
					bbsID = Integer.parseInt(request.getParameter("bbsID"));
						}
						
						if (bbsID == 0) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('유효하지 않은 글입니다')");
					script.println("location.href = 'bbs.jsp'");
					script.println("</script>");
						}
						
						Bbs bbs = new BbsDAO().getBbs(bbsID);
						if (!userID.equals(bbs.getUserID())) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('권한이 없습니다')");
					script.println("location.href = 'bbs.jsp'");
					script.println("</script>");
						}
						
						else {
						
					BbsDAO bbsDAO = new BbsDAO();		
					int result = bbsDAO.delete(bbsID);
					if (result == -1) {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글 삭제에 실패했습니다')");
						script.println("history.back()");
						script.println("</script>");
						}
					else {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("location.href = 'bbs.jsp'");
						script.println("</script>");
					}
						}
				%>

</body>
</html>