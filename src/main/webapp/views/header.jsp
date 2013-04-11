    <div class="container navbar">
    <div class="navbar-inner">
<ul class="nav">
<li <c:if test="${active=='keywords'}">class="active"</c:if>><a href="/keywords">关键词列表</a></li>
<li <c:if test="${active=='commit'}">class="active"</c:if>><a href="/news/commit">提交新事件</a></li>
<li <c:if test="${active=='merge'}">class="active"</c:if>><a href="/keyword/merge">合并关键字</a></li>
</ul>
<ul class="nav pull-right">
<c:if test="${!empty host}"><li><a href="#"><i class="icon-user"></i> ${host.name}</a></li><li><a href="/logout"><i class="icon-share-alt"></i> 登出</a></li></c:if>
<c:if test="${empty host}">
<li <c:if test="${active=='login'}">class="active"</c:if>><a href="/login"><i class="icon-home"></i> 登陆</a></li>
<li <c:if test="${active=='register'}">class="active"</c:if>><a href="/register"><i class="icon-plus"></i> 注册</a></li></c:if>
</ul>
    </div>
    </div>
