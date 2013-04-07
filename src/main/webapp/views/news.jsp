<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html>
<head>
<meta http-equiv=Content-Type content="text/html;charset=utf-8">
<title>${keyword.keyword}-事件列表</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
</head>
<body>
  <%@ include file="header.jsp" %>
关键字：${keyword.keyword}&nbsp;&nbsp;|&nbsp;&nbsp;热度：${keyword.hot}&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/keyword/${keyword.keywordId}/vote/hot">点击关注</a><br>
<c:if test="${!empty keyword.wikiUrl}">相关wiki：<a target='_blank' href="${keyword.wikiUrl}">${keyword.wikiUrl}</a><br></c:if>
事件时间&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;标题<br>
<c:forEach var="item" items="${news}" varStatus="status">
<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.newsTime}" />&nbsp;&nbsp;&nbsp;<a href="/news/${item.newsId}">${item.title}</a>（${item.truth}/${item.fake}）<br>
</c:forEach>
</body>
</html>