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
	<!--   设置编码-->
    <meta charset="UTF-8">
    <!--    使页面在手机访问的时候自适应-->
    <meta name="viewport" content="initial-scale=1, user-scalable=0, minimal-ui">

    <title>我</title>
    <!--    页面的标签栏处的小图标-->
    <link rel='shortcut icon' href='/public/imgs/logo32.png'>

    <!--    bootstrap基础样式引入-->
    <link rel="stylesheet" type="text/css" href="/public/lib/bootstrap/bootstrap.min.css">
    <!--    button样式引入-->
    <link rel="stylesheet" type="text/css" href="/public/lib/button/buttons.css">
    <!--    字体标签库引入-->
    <link rel="stylesheet" type="text/css" href="/public/lib/iconfont/iconfont.css">

    <!--   自定义样式总和引入-->
    <link rel="stylesheet" type="text/css" href="/public/css/index.css">

  </head>
  
  <body>
  <input class="hide" type="file" id="upload_img" name="myfiles" accept="image/png,image/jpe,image/jpg,image/jpeg" />
  	<a id="hide_goto_user_proj" href="" class="hide">跳转到用户和项目关系页面的隐藏字段</a>
    <div class="container-fluid">
        <div id="" class="primary row user-cont">
            <div class="user-box">
                <div class="user-box-top">
                    <div class="user-img">
                    	<a id="photo_img_a" href="javascript:void(0)" style="display: inline-block;">
	                        <img src="${user.photo }" alt="用户头像">
                    	</a>
                    </div>
                    <a href="/user/info?userId=${user.id }">
                        <div class="user-intr">
                            <p>${user.nickname }</p>
                            <!-- <p>微信: 123123123</p> -->
                        </div>
                        <span class="line-tip">
                            <i class="icon icon-goto"></i>
                        </span>
                    </a>
                </div>
                <div class="proj-bottom-box">
                    <div class="row">
                        <div class="col-xs-4 proj-bottom-item">
                            <a data-page-type="button" data-button-value="support" href="javascript:void(0)">我的支持</a>
                        </div>
                        <div class="col-xs-4 proj-bottom-item">
                            <a data-page-type="button" data-button-value="start" href="javascript:void(0)">我的发起</a>
                        </div>
                        <div class="col-xs-4 proj-bottom-item">
                            <a data-page-type="button" data-button-value="collect" href="javascript:void(0)">我的收藏</a>
                        </div>
                    </div>
                </div>
            </div>
            
            
            <div class="intr-cont">

                <div class="intr-line-box">
                    <a class="link-box" href="/user/purse">
                        <span class="line-intr-label" for="">
                            <i class="icon icon-wallet line-intr-emp"></i>
                            我的钱包
                        </span>
                        <span class="line-tip">
                            <i class="icon icon-goto"></i>
    <!--                        少于10%-->
                        </span>
                    </a>
                </div>
            </div>
            <div class="intr-cont">

                <div class="intr-line-box">
                    <a data-open-input="open" data-mapping-id="hide_proj_repay_explain" class="link-box" href="${request.contextPath }/message/list">
                        <span class="line-intr-label" for="">
                            <i class="icon icon-message line-intr-emp"></i>
                            消息
                        </span>
                        <span class="line-tip">
                            <i class="icon icon-goto"></i>
    <!--                        少于10%-->
                        </span>
                    </a>
                </div>
                <!-- <div class="intr-line-box">
                    <a data-open-input="open" data-mapping-id="hide_proj_repay_explain" class="link-box" href="javascript:void(0)">
                        <span class="line-intr-label" for="">
                            <i class="icon icon-customer-service line-intr-emp"></i>
                            客服
                        </span>
                        <span class="line-tip">
                            <i class="icon icon-goto"></i>
                        </span>
                    </a>
                </div> -->
            </div>
            <div class="intr-cont">

                <div class="intr-line-box">
                    <a data-open-input="open" data-mapping-id="hide_proj_repay_explain" class="link-box" href="javascript:void(0)">
                        <span class="line-intr-label" for="">
                            <i class="line-intr-emp">
                            	<img src="/public/imgs/yclogo.png" alt="" style="width:16px" />
                            </i>
                            关于友筹
                        </span>
                        <span class="line-tip">
                            <i class="icon icon-goto"></i>
    <!--                        少于10%-->
                        </span>
                    </a>
                </div>
            </div>
            
            <div class="intr-cont user-logout">

                <div class="intr-line-box">
                    <a data-open-input="open" data-mapping-id="hide_proj_repay_explain" class="link-box" href="${ctx }/login/logoff">
                        退出登录
<!--
                        <span class="line-intr-label" for="">
                            <i class="icon icon-xinghao line-intr-emp"></i>
                            关于友筹
                        </span>
                        <span class="line-tip">
                            <i class="icon icon-goto"></i>
                        </span>
-->
                    </a>
                </div>
            </div>
        </div>

        <div class="bottom bottom-box container-fluid">
            <div class="row bottom-button-box">

                <a data-page-button="bottom" data-button-href="find" href="javascript:void(0)" class="bottom-icon-box col-xs-4">
                    <i class="icon icon-find bottom-icon-i"></i>
                    <label for="" class="bottom-icon-label">发现</label>
                </a>
                <a data-page-button="bottom" data-button-href="create" href="javascript:void(0)" class="bottom-icon-box col-xs-4">
                    <i class="icon icon-edit bottom-icon-i"></i>
                    <label for="" class="bottom-icon-label">发起</label>
                </a>
                <a data-page-button="bottom" data-button-href="user" href="javascript:void(0)" class="bottom-icon-box col-xs-4 checked">
                    <i class="icon icon-user bottom-icon-i"></i>
                    <label for="" class="bottom-icon-label">我</label>
                </a>
            </div>
<!--
            <input id="last_refresh_time" type="text" class="hide" value="123" />
            <input id="page_number" type="text" class="hide" value="1" />
            <input id="proj_type" type="text" class="hide" value="1" />
-->
        </div>
    </div>


    <!--jquery的js文件-->
    <script type="text/javascript" src="/public/lib/jquery/jquery.min.js"></script>
    <!-- ajax上传文件的js包 -->
    <script type="text/javascript" src="/public/lib/file/ajaxfileupload.js"></script>

    <!--    bootstrap基础文件引入-->
    <script type="text/javascript" src="/public/lib/bootstrap/bootstrap.min.js"></script>

    <!--    引入测试的js文件,此文件仅在开发过程中使用,真实上线时需要删除-->
    <script type='text/javascript' src="/public/js/util/util.js"></script>
    <script type='text/javascript' src="/public/js/user.js"></script>
  </body>
</html>
