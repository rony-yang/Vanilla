<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "bbs.BbsDAO" %>

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
	input[type='radio']{-webkit-appearance:radio;}
	.table {table-layout:fixed;}
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
			
			if (userID == null) {
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
	%>
	
	<div class="container">
		<div class="row">
			<form method="post" action="updateAction.jsp?bbsID=<%=bbsID %>">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<colgroup>
    				<col style="width: 10%" />
    				<col style="width: 90%" />
 				</colgroup> 
				<thead>
					<tr>
						<th colspan="3" style="background-color: #595959; text-align: center;">게시판 글 수정 양식</th>
						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="text-align: center;">구분</td>
						<td><input type="radio" style="margin-right: 10px;" name="bbsCate" autocomplete="off" value="후기" checked>후기
							<input type="radio" style="margin-right: 10px;" name="bbsCate" autocomplete="off" value="문의" checked>문의
							<input type="radio" style="margin-right: 10px;" name="bbsCate" autocomplete="off" value="자유글" checked>자유글</td>
					</tr>
					<tr>
						<td style="text-align: center;">제목</td>
						<td><input type="text" class="form-control" name="bbsTitle" 
						maxlength="50" value="<%=bbs.getBbsTitle()%>"></td>
					</tr>
					<tr>
						<td style="text-align: center;">내용</td>
						<td><textarea class="form-control" name="bbsContent" 
						maxlength="2048"><%=bbs.getBbsContent()%></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" style="margin: 20px auto; padding: 0px 20px; font-size: 17px;" value="수정완료">
			</form>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>