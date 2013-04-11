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
	<div class="jumbotron">
		<h3>${news.title}</h3>
		<div class="row">
			<div class="span2">
				<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${news.newsTime}" />
			</div>
			<div class="span6">
				来源：<a target="_blank" href="${news.url}">${news.url}</a>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="span2">
				<a href="/news/${news.newsId}/vote/truth"><i class="icon-thumbs-up"></i> 真实(${news.truth})</a> 
				/ <a href="/news/${news.newsId}/vote/fake"><i class="icon-thumbs-down"></i> 造谣(${news.fake})</a>
			</div>
			<div class="span6">
				关键字：
				<c:forEach var="item" items="${keywords}" varStatus="status">
				<a href="/keyword/${item.keywordId}/news?newsTime=0&limit=30">${item.keyword}</a>,
				</c:forEach>
			</div>
		</div>
	</div>
	<hr>
	<div>
		<div class="row">
			<div class="span8">
				<h4>事件简述</h4>
				<p>${news.content}</p>
			</div>
		</div>
	<hr>
		<form method="post" action="/news/${news.newsId}/keywords">
		<div class="row">
			<div class="span2">
				<input class="input-medium" type="text" name="keywords" />
			</div>
			<div class="span2">
				<input class="btn btn-primary" type="submit" value="添加关键字">
			</div>
		</div>
		</form>
	</div>
</div>
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>