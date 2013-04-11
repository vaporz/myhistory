<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html>
<head>
<meta http-equiv=Content-Type content="text/html;charset=utf-8">
<%@ include file="head.jsp" %>
<title>${keyword.keyword}-事件列表</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
</head>
<body>
  <%@ include file="header.jsp" %>
<div class="container">
	<h1>${keyword.keyword}</h1>
	<i class="icon-fire"></i> ${keyword.hot} 
	<c:if test="${!voted}"><a class="btn btn-warning" href="/keyword/${keyword.keywordId}/vote/hot">关注</a></c:if>
	<c:if test="${voted}"><a class="btn btn-warning" href="#">已关注</a></c:if><br><br>
	<c:if test="${!empty keyword.wikiUrl}"><span class="label label-info">相关wiki</span><a target='_blank' href="${keyword.wikiUrl}">${keyword.wikiUrl}</a><br><br></c:if>
	<table class="table table-striped">
		<tr>
			<th>事件时间</th>
			<th>标题</th>
			<th>真实</th>
			<th>谣传</th>
		</tr>
		<c:forEach var="item" items="${news}" varStatus="status">
		<tr>
			<td>
			<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.newsTime}" />
			</td>
			<td>
			<a href="/news/${item.newsId}">${item.title}</a>
			</td>
			<td>
			${item.truth}
			</td>
			<td>
			${item.fake}
			</td>
		</tr>
		</c:forEach>
	</table>
</div>
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>