<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <!-- <title>login</title> -->
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<meta charset="UTF-8">
    <title>管理员登陆页面</title>
    
    <link rel="stylesheet" href="/public/lib/bootstrap/bootstrap.min.css">
    <!--    bootstrap中button的样式-->
    <link href="/public/lib/button/buttons.css" rel="stylesheet" type="text/css">

    <!--    提示框的样式文件-->
    <link href="/public/lib/messenger/css/messenger.css" rel="stylesheet" type="text/css">
    <link href="/public/lib/messenger/css/messenger-theme-air.css" rel="stylesheet" type="text/css">
    <link style="text/css" rel="stylesheet" href="/public/admin/css/login.css">
  </head>
  
  <body>
  <div class="input-count">
        <div class="login-title-box">
            <h2>友筹管理平台登录</h2>
        </div>
        
        <div class="form-horizontal">
            <div class="form-group">
                <label class="col-sm-2 control-label" for="">用户名</label>
                <div class="col-sm-7">
                    <input id="username" type="text" placeholder="请输入用户名" class="form-control" />
                </div>
                <a href="javascript:void(0)" class="button button-action button-small" onclick="adminLogin.getCode(this)">获取验证码</a>
<!--                <input type="button" value="获取验证码">-->
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label" for="">验证码</label>
                <div class="col-sm-7">
                    <input id="code" type="text" placeholder="请输入验证码" class="form-control" />
                </div>
<!--                <input type="button" value="登陆">-->
                <a href="javascript:void(0)" class="button button-primary button-small" onclick="adminLogin.login(this)">登陆</a>
            </div>
        </div>
    </div>
    
    <!--    jquery框架js文件引入-->
    <script type="text/javascript" src="/public/lib/jquery/jquery.min.js"></script>
    <!--    bootstrap框架js文件引入-->
    <script type="text/javascript" src="/public/lib/bootstrap/bootstrap.min.js"></script>
    
    <!--    警告框的js文件-->
    <script type="text/javascript" src="/public/lib/messenger/js/messenger.min.js"></script>
    <script type="text/javascript" src="/public/js/util/imessenger.js"></script>
    
    <script type="text/javascript" src="/public/admin/js/login.js"></script>
    <!-- <script src="/public/lib/less/less.min.js"></script> -->
  </body>
</html>
