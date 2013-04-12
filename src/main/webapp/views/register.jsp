<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html>
<head>
<meta http-equiv=Content-Type content="text/html;charset=utf-8">
<%@ include file="head.jsp" %>
<title>注册</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
</head>
<body>
  <%@ include file="header.jsp" %>
<div class="container">
<div class="span4 offset3">
<c:if test="${!empty msg}">
	<div class="alert alert-${msgType}">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		${msg}
	</div>
</c:if>
<form method="post" action="/register" class="form-signin">
<i class="icon-ok"></i> 必填<br>
<i class="icon-ok"></i> 用户名：<input type="text" name="name" class="input-block-level"/>
<i class="icon-ok"></i> 密码：<input type="text" name="pwd" class="input-block-level"/>
<i class="icon-ok"></i> 重复密码：<input type="text" name="pwd2" class="input-block-level"/>
邮箱：<input type="text" name="email" class="input-block-level"/>
<div class="pull-right">
<button class="btn btmn-large btn-primary" type="submit">提交</button>
</div>
</form>
</div>
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</body>
</html>