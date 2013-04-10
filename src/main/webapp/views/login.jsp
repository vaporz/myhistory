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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/css/bootstrap.min.css" rel="stylesheet" media="screen">
</head>
<body>
  <%@ include file="header.jsp" %>
<div class="container row-fluid">
<div class="span3 offset4">
      <div class="alert alert-${msgType}">
      <button type="button" class="close" data-dismiss="alert">&times;</button>
  ${msg}
    </div>
<form method="post" action="/login" class="form-signin">
<h2 class="form-signin-heading"><c:if test="${empty msg}">请登录</c:if></h2>
<input type="text" name="name"  class="input-block-level" placeholder="用户名"/>
<input type="password" name="pwd"  class="input-block-level" placeholder="密码"/>
<div class="row">
<div class="span3 offset9"><button class="btn btn-primary" type="submit">登录</button></div>
</div>
</form>
</div>
</div>
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>