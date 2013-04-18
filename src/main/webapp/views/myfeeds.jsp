<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta http-equiv=Content-Type content="text/html;charset=utf-8">
<%@ include file="head.jsp" %>
<title>我关注的关键字</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
</head>
<body>
  <%@ include file="header.jsp" %>
<div class="container">
<div class="offset1">
<h3>我关注的关键字：</h3>
<ul>
<c:forEach var="item" items="${keywords}" varStatus="status">
<li class="line-height: 24px">
<c:if test="${item.notRead>0}">
<span class="badge badge-warning">${item.notRead}</span> 
</c:if>
<a href="/keyword/${item.keywordId}/news?newsTime=0&limit=30&userId=${host.userId}">${item.keyword}</a>
</li>
</c:forEach>
</ul>
</div>
</div>
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</body>
</html>