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
  <form method="post" action="/news/${news.newsId}/edit/content" class="form-horizontal">
	<c:if test="${!empty host&&! empty msg}">
		<div class="span4 offset2 alert alert-${msgType}">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			${msg}
		</div>
	</c:if>
	<div class="control-group">
		<label class="control-label" for="url">事件链接</label>
		<div class="controls">
			<input class="span5" type="text" id="url" name="url" placeholder="http://" value="${news.url}">
			<span class="help-block">可选，如果不填会被认为是没有正式来源的不靠谱消息</span>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="title">标题</label>
		<div class="controls">
		<input class="span5" type="text" id="title" value="${news.title}" name="title" placeholder="事件标题">
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="newTime">事件时间</label>
		<div class="controls">
			<div class="row">
			&nbsp;&nbsp;&nbsp;<input type="radio" name="datetype" id="dateradia" value="exact" <c:if test="${empty news.newsTimeDesc}">checked</c:if>>精确时间：
			<input type="text" id="newTime" name="day" class="input-medium" placeholder="年月日：2013-12-12" <c:if test="${empty news.newsTimeDesc}">value="${newsTimeStr.split(" ")[0]}"</c:if>>，<input type="text" name="second" class="input-medium" <c:if test="${empty news.newsTimeDesc}">value="${newsTimeStr.split(" ")[1]}"</c:if> placeholder="时分秒:23:59:59"/>
				<span class="help-block">&nbsp;&nbsp;&nbsp;&nbsp;“年月日”必填，请按照输入框内提示的格式填写</span><br>
			</div>
			<div class="row">
			&nbsp;&nbsp;&nbsp;<input type="radio" name="datetype" id="dateradia" value="approximate" <c:if test="${!empty news.newsTimeDesc}">checked</c:if>>大概时间：
			<input type="text" id="newTime" name="datedesc" class="input-large" <c:if test="${!empty news.newsTimeDesc}">value="${news.newsTimeDesc}"</c:if> placeholder="时间描述，如“2013年春季”">
			</div>
			<div>
			时间插入点：<input type="text" id="newTime" name="timepoint" class="input-large" <c:if test="${!empty news.newsTimeDesc}">value="${newsTimeStr}"</c:if> placeholder="格式如2013-12-12 23:59:59">
			<span class="help-block">根据“时间描述”选择一个合适的“时间插入点”，<br>“时间插入点”决定了此事件在时间线上的位置</span>
			</div>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="content">事件摘要</label>
		<div class="controls">
		<textarea class="input-block-level" id="content" name="content" cols="80" rows="10">${news.content}</textarea>
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