<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>微信登录</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="viewport" content="initial-scale=1, user-scalable=0, minimal-ui">

<link rel='shortcut icon' href='/public/imgs/logo32.png' >

<%-- 
<link rel="stylesheet" type="text/css" href="${ctx}/public/lib/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/public/lib/button/buttons.css">
<link rel="stylesheet" type="text/css" href="${ctx}/public/lib/iconfont/iconfont.css">

<link rel="stylesheet/less" type="text/css" href="${ctx}/public/css/index.less">

<link rel="stylesheet/less" type="text/css" href="${ctx}/public/css/wechat/login.less">
 --%>

</head>


<body>
	<div id="wechat_login_msg">
		正在自动登录...
	</div>
	
	<input class="hide" type="hidden" id="openid" value="${openid}" />
	<input class="hide" type="hidden" id="code" value="${code}" />
	<input class="hide" type="hidden" id="state" value="${state}" />
	<input class="hide" type="hidden" id="nickname" value="${nickname}" />
	<input class="hide" type="hidden" id="sex" value="${sex}" />
	<input class="hide" type="hidden" id="city" value="${city}" />
	<input class="hide" type="hidden" id="country" value="${country}" />
	<input class="hide" type="hidden" id="headimgurl" value="${headimgurl}" />

	<!-- <script type="text/javascript">var ctx = "${ctx}";</script> -->
	<!-- 引入jquery包 -->
	<script type="text/javascript" src="/public/lib/jquery/jquery.min.js"></script>
	<!-- 引入cookie包 -->
	<script type="text/javascript" src="/public/lib/jquery-cookie/jquery.cookie.js"></script>
	<%-- <script type="text/javascript" src="${ctx}/public/lib/bootstrap/bootstrap.min.js"></script> --%>
	<!-- <script type="text/javascript" src="/public/lib/less/less.min.js"></script> -->
	<!-- 引入自己的js文件 -->
	<script type="text/javascript" src="/public/js/wechat/login.js"></script>
</body>

</html>