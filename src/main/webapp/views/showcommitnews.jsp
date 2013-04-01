<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta http-equiv=Content-Type content="text/html;charset=utf-8">
<title>提交事件</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
</head>
<body>
  <%@ include file="header.jsp" %>
  ${msg}<br>
<form method="post" action="/news/commit">
新闻URL：<input type="text" name="url"/>(可选，如果不填会被认为是没有正式来源的不靠谱消息)<br>
标题：<input type="text" name="title"/><br>
事件时间：<input type="text" name="newTime"/><br>
文本内容：<textarea name="content" cols="40" rows="10"></textarea><br>
关键字：<input type="text" name="keywords"/>(用英文逗号间隔)<br>
<input type="submit" value="提交">
</form>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>