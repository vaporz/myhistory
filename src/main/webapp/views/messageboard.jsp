<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html>
<head>
<meta http-equiv=Content-Type content="text/html;charset=utf-8">
<%@ include file="head.jsp" %>
<title>留言板-意见反馈或者纯吐槽,说什么都行</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
</head>
<body>
  <%@ include file="header.jsp" %>
<div class="container">
	<div>
		<form method="post" action="/message" class="form-horizontal">
			<c:if test="${!empty msg}">
				<div class="alert alert-${msgType}">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					${msg}
				</div>
			</c:if>
			<c:if test="${!empty host}">
			<input type="hidden" name="userId" value="${host.userId}"/>
			</c:if>
			<div class="control-group">
				<label class="control-label" for="url">姓名</label>
				<div class="controls">
					<input class="span5" type="text" id="url" name="name" placeholder="尊姓大名" 
					<c:if test="${!empty host}"> value="${host.name}"</c:if>/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="url">留言</label>
				<div class="controls">
					<input class="span5" type="text" id="url" name="content" placeholder="有什么想法或者建议？（界面很丑，这个我知道。。）">
				</div>
			</div>
			<div class="row-fluid">
				<div class="span4 offset6">
				<button class="btn btmn-large btn-primary" type="submit">提交</button>
				</div>
			</div>
		</form>
	</div>
	<div>
		<c:forEach var="item" items="${messages}" varStatus="status">
	<hr>
		<div>
			<h4>${item.userName}</h4>
			${item.content}
		</div>
		</c:forEach>
	</div>
</div>
</body>
</html>