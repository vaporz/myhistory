<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta http-equiv=Content-Type content="text/html;charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>合并关键字</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="/css/bootstrap.min.css" rel="stylesheet" media="screen">
</head>
<body>
  <%@ include file="header.jsp" %>
<div class="container">
  ${msg}<br>
<form method="post" action="/keyword/merge">
关键字：<input type="text" name="keyword"/><br>
合并到：<input type="text" name="target"/><br>
<input type="submit" value="提交">
</form>
</div>
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
