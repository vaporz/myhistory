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
				来源：<a target="_blank" href="${news.url}">
			<c:if test="${news.url.length()>50}">${news.url.substring(0,25)}......${news.url.substring(news.url.length()-20,news.url.length())}</c:if>
			<c:if test="${news.url.length()<=50}">${news.url}</c:if>
			</a>
			</div>
		</div>
		<c:if test="${!empty host}">
		<div class="row">
			[<a href="/news/${news.newsId}/edit/content">编辑事件</a>][<a href="/news/${news.newsId}/edit/keyword">编辑关键字</a>]
		</div>
		</c:if>
		<br>
		<div class="row">
			<div class="span2">
				<c:if test="${voted}">
				<a href="#"><i class="icon-thumbs-up"></i> 真实(${news.truth})</a> 
				/ <a href="#"><i class="icon-thumbs-down"></i> 造谣(${news.fake})</a>(已投票)
				</c:if>
				<c:if test="${!voted}">
				<a href="/news/${news.newsId}/vote/truth"><i class="icon-thumbs-up"></i> 真实(${news.truth})</a> 
				/ <a href="/news/${news.newsId}/vote/fake"><i class="icon-thumbs-down"></i> 造谣(${news.fake})</a>
				</c:if>
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
		<h4>评论</h4>
		<c:forEach var="item" items="${comments}" varStatus="status">
			<div>
				<div><strong>${item.userName}</strong> - <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.createTime}" /></div>
				<div>${item.content}</div>
			</div>
	<hr>
		</c:forEach>
		<form method="post" action="/comment">
		<input type="hidden" name="newsId" value="${news.newsId}"/>
		<c:if test="${!empty host}"><input type="hidden" name="userId" value="${host.userId}"/></c:if>
		<c:if test="${!empty host}"><input type="hidden" name="userIcon" value="${host.icon}"/></c:if>
		<div>
			<div>
			
				名字：<c:if test="${!empty host}">${host.name}<input class="input-medium" type="hidden" name="userName" value="${host.name}"/></c:if>
				<c:if test="${empty host}"><input class="input-medium" type="text" name="userName"/></c:if>
			</div>
			<div>
				内容：
				<textarea id="content" name="content" cols="50" rows="5"></textarea>
			</div>
			<div>
				<input class="btn btn-primary" type="submit" value="评论">
			</div>
		</div>
		</form>
	</div>
</div>
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</body>
</html>