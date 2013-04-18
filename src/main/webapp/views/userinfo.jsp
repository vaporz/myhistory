<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html>
<head>
<meta http-equiv=Content-Type content="text/html;charset=utf-8">
<%@ include file="head.jsp" %>
<title>事件</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
</head>
<body>
  <%@ include file="header.jsp" %>
<div class="container">
ID:${host.userId}<br>
用户名：${host.name}<br>
注册时间：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${host.createTime}" /><br>
注册邮箱：${host.email}<br>
语言：${host.locale}<br>
信用积分：${host.credit}<br>
</div>
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</body>
</html>