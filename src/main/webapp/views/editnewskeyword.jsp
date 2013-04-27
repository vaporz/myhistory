<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta http-equiv=Content-Type content="text/html;charset=utf-8">
<%@ include file="head.jsp" %>
<title>编辑事件</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
</head>
<body>
  <%@ include file="header.jsp" %>
<div class="container row-fliud">
  <div class="span8 offset1">
	<c:forEach var="item" items="${keywords}" varStatus="status">
	${item.keyword}  <a href="/news/${newsId}/edit/keyword/${item.keywordId}/delete">删除</a><br>
	</c:forEach>
	<form method="post" action="/news/${newsId}/keywords">
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
    <script src="/js/bootstrap.min.js"></script>
</body>
</html>