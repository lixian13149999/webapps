<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta charset="UTF-8">
    <!--    使页面在手机访问的时候自适应-->
    <meta name="viewport" content="initial-scale=1, user-scalable=0, minimal-ui">
    <title>绑定手机号</title>
    <!--    页面的标签栏处的小图标-->
    <link rel='shortcut icon' href='/public/imgs/logo32.png'>

    <!--    bootstrap基础样式引入-->
    <link rel="stylesheet" type="text/css" href="/public/lib/bootstrap/bootstrap.min.css">
    <!--    button样式引入-->
    <link rel="stylesheet" type="text/css" href="/public/lib/button/buttons.css">
    <!--    警告提示框的样式文件-->
    <link rel="stylesheet" type="text/css" href="/public/lib/messenger/css/messenger.css">
    <link rel="stylesheet" type="text/css" href="/public/lib/messenger/css/messenger-theme-air.css">
    <!--    字体标签库引入-->
    <link rel="stylesheet" type="text/css" href="/public/lib/iconfont/iconfont.css">

    <!--   自定义样式总和引入-->
    <link rel="stylesheet" type="text/css" href="/public/css/index.css">
  </head>
	 <body>
	    <div id="hide_proj_sell_stock" class="page-input-cont">
		   <input type="text" id="bound_phone_error_msg_value" value="${errorMsg}" class="hide" />
		   <input type="text" id="source_verify_code" class="hide" />
	        <div class="page-input-box">
	            <input id="phone" class="page-input-box-cont" placeholder='请输入手机号' type="number" />
	        </div>
	        <div class="page-input-box">
	            <input id="verify_code" class="page-input-box-cont" placeholder='请输入验证码' type="number" style="width: 60%;" />
	<!--            <a href="javascript:void(0)">获取验证码</a>-->
	            <a id="get_verify_code_button" data-login-click="get_verify_code" class="bound_phone_get_code input-label-after hover-primary" href="javascript:void(0)">获取验证码</a>
	            <a id="settime_button" href="javascript:void(0)" class="input-label-after hide disabled">60秒请稍后</a>
	        </div>
	        <div class="page-input-button">
	            <a id="bound_submit" href="javascript:void(0)" class="input-button">完成</a>
	        </div>
	    </div>
	    
	    <a id="bound_success_href" href="/user/info" class="hide">绑定成功,返回到个人详情</a>
	    
	    <!--jquery的js文件-->
	    <script type="text/javascript" src="/public/lib/jquery/jquery.min.js"></script>
	
	    <!--    bootstrap基础文件引入-->
	    <script type="text/javascript" src="/public/lib/bootstrap/bootstrap.min.js"></script>
	    <!--    警告提示框的js源文件-->
	    <script type="text/javascript" src="/public/lib/messenger/js/messenger.min.js"></script>
	    
	    <!--    警告提示的js文件-->
	    <script type="text/javascript" src="/public/js/util/imessenger.js"></script>
	    <!--    用于验证的js文件-->
	    <script type="text/javascript" src="/public/js/util/verify.js"></script>
	    
	    
	    <!--    less文件引入-->
	    <!-- <script type="text/javascript" src="/public/lib/less/less.min.js"></script> -->
	    <script type="text/javascript" src="/public/js/bound_phone.js"></script>
	</body>
  </body>
</html>
