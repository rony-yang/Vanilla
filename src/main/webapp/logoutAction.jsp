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
	session.invalidate();
	%>
	<script>
		location.href = "main.jsp";
	</script>
</body>
</html>