<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta http-equiv=Content-Type content="text/html;charset=utf-8">
<%@ include file="head.jsp" %>
<title>提交事件</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
</head>
<body>
  <%@ include file="header.jsp" %>
<div class="container row-fliud">
  <div class="span8 offset1">
  <form method="post" action="/news/commit" class="form-horizontal">
	<c:if test="${!empty msg}">
		<div class="span4 offset2 alert alert-${msgType}">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			${msg}
		</div>
	</c:if>
	<div class="control-group">
		<label class="control-label" for="url">事件链接</label>
		<div class="controls">
			<input class="span5" type="text" id="url" name="name" placeholder="http://">
			<span class="help-block">可选，如果不填会被认为是没有正式来源的不靠谱消息</span>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="title">标题</label>
		<div class="controls">
		<input class="span5" type="text" id="title" name="title" placeholder="事件标题">
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="newTime">事件时间</label>
		<div class="controls">
		<input type="text" id="newTime" name="newTime" placeholder="事件发生的时间">
			<span class="help-block">格式如2010-12-12 23:59:59</span>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="keywords">关键字</label>
		<div class="controls">
		<input type="text" id="keywords" name="keywords" placeholder="">
			<span class="help-block">用英文逗号间隔</span>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="content">文本内容</label>
		<div class="controls">
		<textarea class="input-block-level" id="content" name="content" cols="80" rows="10"></textarea>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span4 offset6">
		<button class="btn btmn-large btn-primary" type="submit">提交</button>
		</div>
	</div>
  </form>
  </div>
</div>
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</body>
</html>