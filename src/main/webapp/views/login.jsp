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
<%@ include file="head.jsp" %>
</head>
<body>
  <%@ include file="header.jsp" %>
<div class="container row">
<div class="span4 offset3">
<div class="alert alert-${msgType}">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	${msg}
</div>
<form method="post" action="/login" class="form-signin">
用户名：
<input type="text" name="name"  class="input-block-level"/>
密码：
<input type="password" name="pwd"  class="input-block-level"/>
<div class="pull-right">
<button class="btn btmn-large btn-primary" type="submit">登录</button>
</div>
</form>
</div>
</div>
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>