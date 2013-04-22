    <div class="container navbar">
    <div class="navbar-inner">
<ul class="nav">
<c:if test="${!empty host}">
<li><a href="/user/${host.userId}/feeds">首页</a></li>
</c:if>
<li <c:if test="${active=='keywords'}">class="active"</c:if>><a href="/keywords">关键词列表</a></li>
<li <c:if test="${active=='commit'}">class="active"</c:if>><a href="/news/commit">提交新事件</a></li>
<li <c:if test="${active=='merge'}">class="active"</c:if>><a href="/keyword/merge">合并关键字</a></li>
<li <c:if test="${active=='message'}">class="active"</c:if>><a href="/message">意见反馈</a></li>
</ul>
<ul class="nav pull-right">
<c:if test="${!empty host}">
<li>
<div class="btn-group">
    <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
	<i class="icon-cog"></i>
	</a>
    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
	    <li><a tabindex="-1" href="/user/${host.userId}/info"><i class="icon-user"></i> 个人设置</a></li>
	    <li class="divider"></li>
	    <li><a href="/logout"><i class="icon-share-alt"></i> 登出</a></li>
    </ul>
    </div>
</li>

</c:if>
<c:if test="${empty host}">
<li <c:if test="${active=='login'}">class="active"</c:if>><a href="/login"><i class="icon-home"></i> 登陆</a></li>
<li <c:if test="${active=='register'}">class="active"</c:if>><a href="/register"><i class="icon-plus"></i> 注册</a></li></c:if>
</ul>
    </div>
    </div>