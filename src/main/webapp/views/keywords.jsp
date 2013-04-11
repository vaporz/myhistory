<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta http-equiv=Content-Type content="text/html;charset=utf-8">
<%@ include file="head.jsp" %>
<title>关键词列表</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
</head>
<body>
  <%@ include file="header.jsp" %>
<div class="container">
<div class="offset1">
<h2>按热度排序</h2>
<ul>
<c:forEach var="item" items="${keywords}" varStatus="status">
<li class="line-height: 24px">
<a href="/keyword/${item.keywordId}/news?newsTime=0&limit=30">${item.keyword}</a>（${item.hot}）
<c:if test="${item.aliasId>0}">
<a href="/keyword/${item.aliasId}/news?newsTime=0&limit=30">已被合并</a>
</c:if>
</li>
</c:forEach>
</ul>
</div>
</div>
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>