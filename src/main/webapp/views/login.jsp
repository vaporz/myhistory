<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html>
<head>
<meta http-equiv=Content-Type content="text/html;charset=utf-8">
<title>登陆</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
</head>
<body>
  <%@ include file="header.jsp" %>
${msg}<br>
<form method="post" action="/login">
用户名：<input type="text" name="name" /><br>
密码：<input type="text" name="pwd" /><br>
<input type="submit" value="登陆">
</form>
</body>
</html>