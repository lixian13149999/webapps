<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <!-- <title>My JSP 'user_info.jsp' starting page</title> -->
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--   设置编码-->
    <meta charset="UTF-8">
    <!--    使页面在手机访问的时候自适应-->
    <meta name="viewport" content="initial-scale=1, user-scalable=0, minimal-ui">

    <title>个人资料</title>
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  
    <div class="container-fluid">
        <div id="" class="primary row user-cont">
            <div class="intr-cont un-margin-top">

                <div class="intr-line-box">
                    <a data-open-input="open" data-mapping-id="user_nickname_hide_box" class="link-box" href="javascript:void(0)">
                        <span id="user_nickname_text" class="line-intr-label" for="">
<!--                            <i class="icon icon-xinghao line-intr-emp"></i>-->
                            我的昵称
                        </span>
                        <span class="line-tip">
                           <span id="user_nickname_show">${user.nickname}</span>
                            <i class="icon icon-goto"></i>
    <!--                        少于10%-->
                        </span>
                    </a>
                </div>
                <div class="intr-line-box">
                    <a data-open-input="open" data-mapping-id="hide_proj_repay_explain" class="link-box" href="/user/boundPhone">
                        <span class="line-intr-label" for="">
                            绑定手机号
                    </span>
                        <span class="line-tip">
                           ${user.phone}
                    </span>
                    </a>
                </div>


                <div class="intr-line-box">
                    <a data-open-input="open" data-mapping-id="hide_proj_repay_explain" class="link-box" href="${request.contextPath }/addr/list">
                        <span class="line-intr-label" for="">
<!--                            <i class="icon icon-xinghao line-intr-emp"></i>-->
                            收货地址
                        </span>
                        <span class="line-tip">
<!--                           路人甲-->
                            <i class="icon icon-goto"></i>
    <!--                        少于10%-->
                        </span>
                    </a>
                </div>
            </div>

        </div>

    </div>
    
    <!--    出让股份输入框-->
    <div id="user_nickname_hide_box" class="page-input-cont hide">
        <div class="page-input-box">
            <input value="" id="user_nickname_hide_value" class="page-input-box-cont" placeholder='请输入的昵称' type="text" />
        </div>
        <div class="page-input-button">
            <a data-open-input="close" data-mapping-id="user_nickname_hide_box" href="javascript:void(0)" class="input-button">完成</a>
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

    <!--    引入测试的js文件,此文件仅在开发过程中使用,真实上线时需要删除-->
    <!-- <script type='text/javascript' src="/public/js/util/util.js"></script> -->
    <script type='text/javascript' src="/public/js/user.js"></script>
  </body>
</html>
