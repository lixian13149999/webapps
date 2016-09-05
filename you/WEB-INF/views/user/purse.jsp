<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta charset="UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <title>钱包</title>
    <!--    使页面在手机访问的时候自适应-->
    <meta name="viewport" content="initial-scale=1, user-scalable=0, minimal-ui">

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
  	<input id="balance_value" class="hide" value="${holdMoney }" />
    <div class="container-fluid">
        <div id="" class="primary row purse-cont">
            <div class="purse-number-box">
                <span class="number-title">余额/元</span>
                <span class="number-no">${holdMoney }</span>
            </div>

            <div class="intr-line-box">
                <a class="link-box" href="javascript:user.openGetCashBox()">
                    <span class="line-intr-label" for="">
                        <i class="icon icon-withdraw-cash line-intr-emp"></i>
                        提现
                    </span>
                    <span class="line-tip">
                        <i class="icon icon-goto"></i>
    <!--                        少于10%-->
                    </span>
                </a>
            </div>

            <div class="intr-line-box">
                <a class="link-box" href="/fund/fundList">
                    <span class="line-intr-label" for="">
                        <i class="icon icon-money-info line-intr-emp"></i>
                        明细
                    </span>
                    <span class="line-tip">
                        <i class="icon icon-goto"></i>
    <!--                        少于10%-->
                    </span>
                </a>
            </div>
        </div>

    </div>

    <div id="get_cash_box" class="page-input-cont hide">
        <div class="page-input-box">
            <input id="get_cash_value" class="page-input-box-cont" placeholder='请输入提现金额' type="number" />
        </div>
        <div class="page-input-button">
            <a href="javascript:user.getCash(this)" class="input-button">完成</a>
        </div>
    </div>

    <!--jquery的js文件-->
    <script type="text/javascript" src="/public/lib/jquery/jquery.min.js"></script>

    <!--    bootstrap基础文件引入-->
    <script type="text/javascript" src="/public/lib/bootstrap/bootstrap.min.js"></script>
    
    <!--    警告提示框的js源文件-->
    <script type="text/javascript" src="/public/lib/messenger/js/messenger.min.js"></script>
    
    <!--    警告提示的js文件-->
    <script type="text/javascript" src="/public/js/util/imessenger.js"></script>
    
    <!--    less文件引入-->
    <!-- <script type="text/javascript" src="/public/lib/less/less.min.js"></script> -->

    <!--    引入测试的js文件,此文件仅在开发过程中使用,真实上线时需要删除-->
    <script type='text/javascript' src="/public/js/util/util.js"></script>
    <script type='text/javascript' src="/public/js/user.js"></script>
  </body>
</html>
