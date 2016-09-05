<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head lang="en">
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>用户不一致</title>

<meta name="keywords" content="HTML,ASP,PHP,SQL">
<meta name="description" content="用户不一致">
<meta name="viewport" content="initial-scale=1, user-scalable=0, minimal-ui">

<link rel='shortcut icon' href='/public/imgs/logo32.png' >

</head>


<body>
	当前微信账户和被其他用户绑定,请<a href="/login/logoff">重新登录</a>
</body>

</html>