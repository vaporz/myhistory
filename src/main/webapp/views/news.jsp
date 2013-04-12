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
	<h1>${keyword.keyword} <i class="icon-fire">&nbsp;<span class="label label-important">${keyword.hot}</span></i>  </h1>
	<p>
	<c:if test="${!voted}"><a class="btn btn-warning" href="/keyword/${keyword.keywordId}/vote/hot"><strong>关注</strong></a></c:if>
	<c:if test="${voted}"><a class="btn btn-warning" href="#"><strong>已关注</strong></a></c:if>
	<c:if test="${!empty keyword.wikiUrl}"><a class="btn btn-info" target='_blank' href="${keyword.wikiUrl}"><strong>WIKI</strong></a><br><br></c:if>
	<c:if test="${empty keyword.wikiUrl}"><a id="example" data-original-title="test" data-content="a<a href='http://www.baidu.com'>s</a>dfsf" rel="popover" class="btn btn-default" href="#"><strong>WIKI</strong></a><br><br></c:if>
	</p>
	<table class="table table-striped">
		<tr>
			<th>事件时间</th>
			<th>标题</th>
			<th><span class="label label-success">真实</span> vs <span class="label label-important">谣传</span></th>
		</tr>
		<c:forEach var="item" items="${news}" varStatus="status">
		<tr>
			<td style="padding-top:15px">
			<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.newsTime}" />
			</td>
			<td style="padding-top:15px">
			<a href="/news/${item.newsId}">
			<c:if test="${item.title.length()>25}">${item.title.substring(0,25)}...</c:if>
			<c:if test="${item.title.length()<=25}">${item.title}</c:if>
			</a>
			</td>
			<td>
			<c:if test="${(item.truth+item.fake)!=0}">
				<div class="progress" style="margin-bottom:0px">
    				<div class="bar bar-success" style="width: ${100*item.truth/(item.truth+item.fake)}%;"></div>
    				<div class="bar bar-danger" style="width: ${100*item.fake/(item.truth+item.fake)}%;"></div>
    			</div>
    			<div style="display:inline-block;line-height:15px;font-size:13px"><i class="icon-thumbs-up"></i> ${item.truth}</div>
    			<div style="float:right;display:inline-block;line-height:15px;font-size:13px">${item.fake} <i class="icon-thumbs-down"></i></div>
			</c:if>
			<c:if test="${(item.truth+item.fake)==0}">
				<div class="progress" style="margin-bottom:2px">
    				<div class="bar bar-success" style="width: 0%;"></div>
    			</div>
    			<div style="display:inline-block;line-height:15px;font-size:13px"><i class="icon-thumbs-up"></i> 0</div>
    			<div style="float:right;display:inline-block;line-height:15px;font-size:13px">0 <i class="icon-thumbs-down"></i></div>
			</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
</div>
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script>
	$(function (){
	 $("#example").popover();
	});
	</script>
</body>
</html>