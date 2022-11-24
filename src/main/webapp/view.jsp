<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="java.io.PrintWriter" %>
<%@ page import ="bbs.Bbs" %>
<%@ page import ="bbs.BbsDAO" %>
<%@ page import ="java.util.Date" %>
<%@ page import ="java.text.SimpleDateFormat" %>

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
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
				<thead>
					<tr>
						<th colspan="5" style="background-color: #595959; text-align: center;">게시판 글 보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>구분</td>
						<td><%=bbs.getBbsCate() %></td>
					</tr>
					<tr>
						<td>글 제목</td>
						<td><%=bbs.getBbsTitle() %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><%=bbs.getUserID() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td><%=bbs.getBbsDate() %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td style="min-height: 200px;">
						<%=bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
<!-- 						replaceAll을 사용하여 html 특수문자로 치환하여 사용 (이 코드를 써줘야 특수문자가 깨지지 않는다  -->
					</tr>
				</tbody>
			</table>
			<div style="width: 100%; height: auto;">
				
				<div style="width: 20%; height: auto; float: left;">
					<a href="bbs.jsp" class="button small icon solid fa-arrow-circle-right" style="margin: 20px auto; padding: 0px 20px; font-size: 17px; justify-content: center;">목록</a>
				</div>
				
				<%
					if (userID != null && userID.equals(bbs.getUserID())) {
				%>
				<div style="width: 80%; height: auto; float: left;">
						<a href="update.jsp?bbsID=<%=bbsID%>" class="button small icon solid fa-arrow-circle-right" style="margin: 20px auto; padding: 0px 20px; font-size: 17px; justify-content: center;">수정</a>
						<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%=bbsID%>" class="button small icon solid fa-arrow-circle-right" style="margin: 20px auto; padding: 0px 20px; font-size: 17px; justify-content: center;">삭제</a>
				</div>
				<%
					}
				%>
				
<!-- 			<input type="submit" class="btn btn-primary pull-right" style="margin: 20px auto; padding: 0px 20px; font-size: 17px;" value="글쓰기"> -->
		</div>
	</div>
	
	<%@ include file="footer.jsp"%>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>