<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html>
<head>
<meta http-equiv=Content-Type content="text/html;charset=utf-8">
<title>事件列表</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
</head>
<body>
  <%@ include file="header.jsp" %>
关键字：${keyword.keyword}<br>
事件时间&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;标题<br>
<c:forEach var="item" items="${news}" varStatus="status">
<fmt:formatDate pattern="yyyy/MM/dd hh:mm:ss" value="${item.newsTime}" />&nbsp;&nbsp;&nbsp;<a href="/news/${item.newsId}">${item.title}</a><br>
</c:forEach>
</body>
</html>