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
    <title>登陆</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<meta name="viewport" content="initial-scale=1, user-scalable=0, minimal-ui">
    <meta charset="UTF-8">

	<link rel='shortcut icon' href='${ctx}/public/imgs/logo32.png'>
	
    <!--    引入bootstrap框架-->
    <link rel="stylesheet" type="text/css" href="${ctx}/public/lib/bootstrap/bootstrap.min.css">
    <!--    引入button框架-->
    <link rel="stylesheet" type="text/css" href="${ctx}/public/lib/button/buttons.css">
    <!--    警告提示框的样式文件-->
    <link rel="stylesheet" type="text/css" href="${ctx}/public/lib/messenger/css/messenger.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/public/lib/messenger/css/messenger-theme-air.css">

    <!--    引入图标样式-->
    <link rel="stylesheet" type="text/css" href="${ctx}/public/lib/iconfont/iconfont.css">

    <!--引入自定义的样式-->
    <link rel="stylesheet" type="text/css" href="${ctx}/public/css/login.css">

  </head>
  
  <body>
  	<div class="logo-cont">
        <div class="logo-box">
            <a class="logo-a" href="javascript:void(0)">
                <img src="/public/imgs/logo.png" alt="logo" />
            </a>
        </div>
    </div>
    <div class="input-cont">
        <div class="input-box row">
            <input id="phone" name="phone" data-login-input='border' class="input-input" type="number" placeholder='请输入手机号' />
            <!--            <label class="hide error" for="username"></label>-->
            <a id="get_verify_code_button" data-login-click="getVerifyCode" class="input-label-after hover-primary">获取验证码</a>
            <a id="settime_button" href="javascript:void(0)" class="input-label-after hide disabled">60秒请稍后</a>
        </div>
        <div class="input-box row">
            <input id="verify_code" name="verifyCode" data-login-input='border' class="input-input" type="number" placeholder='请输入验证码' />
            <input id="source_verify_code" class="input-input hide" type="text" />
        </div>
        <div class="agreement-box row">
			<!-- <a id="provision_checkbox" class="agreement-checkbox" data-checkbox-ibox="checkbox" data-checkbox-ibox-type="uncheck">
			    什么情况
			</a> -->
			<a id="provision_checkbox" class="hover-primary" href="javascript:void(0)" data-checkbox-ibox="checkbox" data-checkbox-ibox-type="uncheck">
				<i class="icon icon-checkbox"></i>
			</a>
            <!-- <input type="checkbox" /> -->
            <span class="agreement-span">我已阅读并同意
                <a class="hover-primary" href="javascript:void(0)">
                    《友筹用户注册协议》
                </a>
            </span>
        </div>
    </div>
    
    <a id="hide_href_a" class="hide" href="/proj">自动跳转的隐藏字段</a>
    <div class="button-cont">
        <div class="ibutton-box">
            <input data-login-click="submit" type="button" class="button button-rounded button-primary" value="登录">
        </div>
        <div class="ibutton-box">
            <button data-login-click="subInWechat" class="button button-rounded button-action">
                <i class="icon icon-wechat button-inner-icon"></i> 微信登陆
            </button>
        </div>
    </div>
    <!--    </form>-->

    <!--    引入jquery框架-->
    <script type="text/javascript" src="${ctx}/public/lib/jquery/jquery.min.js"></script>
    <!--    引入bootstrap的框架-->
    <script type="text/javascript" src="${ctx}/public/lib/bootstrap/bootstrap.min.js"></script>
    <!--    警告提示框的js源文件-->
    <script type="text/javascript" src="${ctx}/public/lib/messenger/js/messenger.min.js"></script>

    <!--    警告提示的js文件-->
    <script type="text/javascript" src="${ctx}/public/js/util/imessenger.js"></script>
    <!--    用于验证的js文件-->
        <script type="text/javascript" src="${ctx}/public/js/util/verify.js"></script>

    <!--    登陆界面的js文件-->
    <script type="text/javascript" src="${ctx}/public/js/login.js"></script>
  </body>
</html>
