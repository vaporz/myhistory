<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html>
<head>
<meta http-equiv=Content-Type content="text/html;charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/css/bootstrap.min.css" rel="stylesheet" media="screen">
<title>注册</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
</head>
<body>
  <%@ include file="header.jsp" %>
<div class="container">
${msg}<br>
<form method="post" action="/register">
*必填<br>
*用户名：<input type="text" name="name" /><br>
*密码：<input type="text" name="pwd" /><br>
*重复密码：<input type="text" name="pwd2" /><br>
邮箱：<input type="text" name="email" /><br>
<input type="submit" value="注册">
</form>
</div>
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>