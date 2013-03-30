<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta http-equiv=Content-Type content="text/html;charset=utf-8">
<title>关键词列表</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
</head>
<body>
  <%@ include file="header.jsp" %>
<c:forEach var="item" items="${keywords}" varStatus="status">
<a href="/keyword/${item.keywordId}/news?newsTime=0&limit=30">${item.keyword}</a>
<c:if test="${item.aliasId>0}">
<a href="/keyword/${item.aliasId}/news?newsTime=0&limit=30">Alias</a>
</c:if><br>
</c:forEach>
</body>
</html>