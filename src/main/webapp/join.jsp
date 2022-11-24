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
input[type='radio']{-webkit-appearance:radio;}

</style>
<title>Vanilla Shopping Mall</title>
</head>
<body>
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
					<li><a href="cart.jsp">장바구니</a></li>			
				</ul>
			</nav>
		</header>
	</div>
	
	<div id="banner-wrapper">
		<div id="banner" class="box container">
			<div class="row">
				<div class="col-2 col-12-medium"></div>
				<div class="col-8 col-12-medium">
					<div class="jumbotron" style="padding-top: 20px;">
					<form method="post" action="joinAction.jsp">
						<h3 style="text-align: center;">회원가입을 해주세요</h3>
							<table>
								<tr>
									<td style="text-align: center;">아이디</td>
									<td><input type="text" class="form-control" name="userID" maxlength="20"></td>
								</tr>
								<tr>
									<td style="text-align: center;">비밀번호</td>
									<td><input type="password" class="form-control" name="userPassword" maxlength="20"></td>
								</tr>	
								<tr>
									<td style="text-align: center;">이름</td>
									<td><input type="text" class="form-control" name="userName" maxlength="20"></td>
								</tr>	
								<tr>
									<td style="text-align: center;">성별</td>
									<td><input type="radio" style="margin-right: 10px;" name="userGender" autocomplete="off" value="남자" checked>남자
										<input type="radio" style="margin-right: 10px;" name="userGender" autocomplete="off" value="여자" checked>여자</td>
								</tr>
								<tr>
									<td style="text-align: center;">이메일</td>
									<td><input type="email" class="form-control" name="userEmail" maxlength="20"></td>
								</tr>	
							</table>
								<input type="submit" class="btn btn-primary form-control" style="margin: 20px auto; padding: 0px 20px; font-size: 17px;" value="회원가입">
					</form>
					</div>
				</div>
				<div class="col-2 col-12-medium"></div>
			</div>
		</div>
	</div>

<%@ include file="footer.jsp"%>
</body>
</html>