<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv=Content-Type content="text/html;charset=utf-8">
<title>合并关键字</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
</head>
<body>
  <%@ include file="header.jsp" %>
  ${msg}<br>
<form method="post" action="/keyword/merge">
关键字：<input type="text" name="keyword"/><br>
合并到：<input type="text" name="target"/><br>
<input type="submit" value="提交">
</form>
</body>
</html>
