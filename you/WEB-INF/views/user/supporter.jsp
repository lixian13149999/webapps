<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<meta charset="UTF-8">
    <title>我的支持者</title>
    <!--    使页面在手机访问的时候自适应-->
    <meta name="viewport" content="initial-scale=1, user-scalable=0, minimal-ui">

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
    <div id="project_cont" class="primary row">
    
 <c:if test="${orderList!=null}">
 
   	<c:forEach var="order" items="${orderList}">
   		  <div class="project-box">
            <div class="proj-top">
                <div style="background-image: url(' ${order.photo}');" class="proj-user-photo"><!--显示该用户的头像  -->
<!--                        <img class="proj-photo-img-item" src="/public/imgs/user.png" alt="">-->
                </div>
                <div class="proj-user-name">
<!--                       <h4>-->
             ${order.addrRealName}<!--显示订单上的名称  -->
<!--                       </h4>-->
                </div>
<!--
                <div class="proj-user-create-time">
                    1周前
                </div>
-->
                <div class="proj-user-over-time">
                    共
                    <a href="javascript:void(0)"> ${order.moneyCount}</a><!-- 显示支持 的钱数 -->
                    元
                </div>
               <div class="proj-user-over-time" style="margin-right: 20px;"><!-- 显示支持 的份数 -->
                    支持
                    <a href="javascript:void(0)">${order.prodCount}</a>
                    份
                </div>
            </div>
            <div class="proj-info">
               <div class="supporter-phone">
                   <i class="icon icon-phone" style="color: #337ab7;">
                   </i>
                   <span class="supporter-phone-number">${order.addrPhone}</span><!-- 显示订单上的号码 -->
               </div>
                <div class="supporter-addr" style="padding-left: 20px;">
                    <span class="supporter-addr-info">${order.addrAddr}</span><!-- 显示订单上的收货地址 -->
                </div>
            </div>
        </div>
   	
   	</c:forEach>
 </c:if>
      
      
    </div>

    
    
    <!--jquery的js文件-->
    <script type="text/javascript" src="/public/lib/jquery/jquery.min.js"></script>
    <!--    jquery-cookie文件引入-->
    <!--     <script type="text/javascript" src="/public/lib/jquery-cookie/jquery.cookie.js"></script>-->

    <!--    bootstrap基础文件引入-->
<!--    <script type="text/javascript" src="/public/lib/bootstrap/bootstrap.min.js"></script>-->
    <!--    less文件引入-->
    <!-- <script type="text/javascript" src="/public/lib/less/less.min.js"></script> -->

    <!--    引入测试的js文件,此文件仅在开发过程中使用,真实上线时需要删除-->
<!--
    <script type='text/javascript' src="/public/js/util/util.js"></script>
    <script type='text/javascript' src="/public/js/index.js"></script>
    -->
  </body>
</html>
