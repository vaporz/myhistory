<a href="/news/commit">提交新事件</a>&nbsp;|&nbsp;<a href="/keywords">关键词列表</a>
&nbsp;|&nbsp;<a href="/keyword/merge">合并关键字</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<c:if test="${!empty host}">${host.name}&nbsp;|&nbsp;<a href="/logout">登出</a></c:if>
<c:if test="${empty host}"><a href="/login">登陆</a>&nbsp;|&nbsp;<a href="/register">注册</a></c:if>
<br><br>