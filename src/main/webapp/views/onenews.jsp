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
标题：${news.title}<br>
投票：<a href="/news/${news.newsId}/vote/truth">这是真的</a>（${news.truth}）/<a href="/news/${news.newsId}/vote/fake">这是造谣</a>（${news.fake}）<br>
事件时间：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${news.newsTime}" /><br>
来源：<a target="_blank" href="${news.url}">${news.url}</a><br>
相关关键字：
<c:forEach var="item" items="${keywords}" varStatus="status">
<a href="/keyword/${item.keywordId}/news?newsTime=0&limit=30">${item.keyword}</a>,
</c:forEach>
<br>
<form method="post" action="/news/${news.newsId}/keywords">
添加关键字：<input type="text" name="keywords" /><input type="submit" value="添加"><br>
</form>
内容：<br>
<textarea name="content" cols="60" rows="10">${news.content}</textarea>
</div>
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>