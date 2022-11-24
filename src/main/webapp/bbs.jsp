<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.sql.ResultSet"%>
<%@ page import = "java.sql.PreparedStatement"%>
<%@ page import = "bbs.BbsDAO"%>
<%@ page import = "bbs.Bbs"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.util.ArrayList" %>

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
	
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #595959; text-align: center;">구분</th>
						<th style="background-color: #595959; text-align: center;">번호</th>
						<th style="background-color: #595959; text-align: center;">제목</th>
						<th style="background-color: #595959; text-align: center;">작성자</th>
						<th style="background-color: #595959; text-align: center;">작성일자</th>
					</tr>
				</thead>
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						int cnt = bbsDAO.getTotal();							// 전체 게시글 갯수

						int pageNumber = 1;		 								// 기본페이지
						if (request.getParameter("pageNumber") != null ) {
							pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
							}
						
						int currentPage = pageNumber;		
						int pageSize 	= 10; 									// 한 페이지에 보여줄 글 갯수 설정
						int startRow	= (currentPage - 1) * pageSize + 1;		// 10개씩 칼럼을 나눠서 2페이지에서 시작행이 11이 되도록 설정
						int endRow 		= currentPage * pageSize;				// 끝행번호 계산
						
						ArrayList<Bbs> list = bbsDAO.getList(startRow, pageSize*currentPage);
						for (int i=0; i<list.size(); i++) {
					%>
					<tr>
						<td><%=list.get(i).getBbsCate() %></td>
						<td><%=list.get(i).getBbsID() %></td>
						<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
						<td><%=list.get(i).getUserID() %></td>
						<td><%=list.get(i).getBbsDate()%></td>
					</tr>
					<%		
						}
						//--list 반복문 종료
					%>
					<tr>
						<div>&#42;전체 글 갯수 : <%=cnt%> 개</div>
					</tr>	
					
				</tbody>
			</table>
			
				<%
					int pageCount	= cnt/pageSize + (cnt % pageSize == 0 ?0 :1);
					int pageBlock 	= 3; 											// 화면에 보여줄 페이지번호의 갯수(페이지블럭)
					int startPage 	= ((currentPage-1)/pageBlock) * pageBlock + 1;	// 페이지블럭의 시작페이지 번호
					int endPage 	= startPage + pageBlock - 1;					// 페이지블럭의 끝페이지 번호
					// 페이지 이동버튼 만들기
					if (cnt != 0) {
						if (endPage > pageCount) { endPage = pageCount; }
				%>
					<div style="width: 100%; height: auto; text-align: center;">
						<div style="width: 90%; height: auto; float: left;">
							<div id ="pageBlock">
				<%
				// 이전 글자 표시
					if ( startPage > pageBlock ) {
				%>
					<a href="bbs.jsp?pageNumber=<%=startPage - pageBlock%>" style="font-size: 17px; color : #000000; text-decoration: none;">&nbsp;이전&nbsp;</a>
				<%		
					}
				// 숫자 표시
					for (int i=startPage; i<=endPage; i++){
						if (i == currentPage) {
				%>
					<a href ="bbs.jsp?pageNumber=<%=i%>" style="font-size: 20px; color : #ff0000; text-decoration: none;">&nbsp;<%=i%>&nbsp;</a>
				<%
					}
					else {
				%>
					<a href ="bbs.jsp?pageNumber=<%=i%>" style="font-size: 20px; color : #000000; text-decoration: none;">&nbsp;<%=i%>&nbsp;</a>
				<%
						}
					}
				
				// 다음 글자 표시
					if ( endPage < pageCount ) {
				%>
					<a href ="bbs.jsp?pageNumber=<%=startPage + pageBlock%>" style="font-size: 17px; color : #000000; text-decoration: none;">&nbsp;다음&nbsp;</a>
				<%
					}
				%>
						</div>
					</div>
				</div> 
				<%
					} // 페이지 이동버튼 만들기 if문 종료
				%>
				
				
				<div style="width: 10%; height: auto; float:left;">
					<input type="button" onclick="location.href='write.jsp'" class="btn btn-primary form-control" style="margin: 20px auto; padding: 0px 20px; font-size: 17px; display: inline-block;" value="글쓰기">
				</div>
			</div>
		</div>
	
	<%@ include file="footer.jsp"%>
</body>
</html>