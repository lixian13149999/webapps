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
	
	<!--   设置编码-->
    <meta charset="UTF-8">
    <!--    使页面在手机访问的时候自适应-->
    <meta name="viewport" content="initial-scale=1, user-scalable=0, minimal-ui">

    <title>收货地址</title>
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
      
      
      <c:if test="${addrList!=null }">
         <div class="primary row buy-cont">
         	 <c:forEach var="addr" items="${addrList}">
			       <div class="addr-box">
			           <div class="addr-title">
			               <div class="username">${addr.realName }</div>
			               <div class="phone">${addr.phone }</div>
			           </div>
			           <div class="addr-info">
			               <a href="/addr/edit?addrId=${addr.id }" class="to-check-addr-a">    	
			                ${addr.province }${addr.city }${addr.county }${addr.infoAddr } <!--   这是一个比较长的地址,一般会大于一行,但是也可能有例外的情况.到时看具体情况而定 -->
			               </a>
			           </div>
			           <div class="addr-bottom">
			              <a href="javascript:void(0)" data-hide-addr-id="${addr.id}" data-checkbox-ibox="checkbox" data-checkbox-ibox-type="${addr.isDefault==1 ? 'checked' :'uncheck' }">
			                  
			               <i class="icon ${addr.isDefault==1 ? 'icon-checkbox-checked' :'icon-checkbox' }"></i>
			               默认当前地址
			              </a>
			              
			           </div>
			       </div>
          	</c:forEach>
      	</div>
      
      </c:if>
        <div class="page-input-button">
            <a href="/addr/add" class="input-button">添加地址</a>
        </div>
    <!--jquery的js文件-->
    <script type="text/javascript" src="/public/lib/jquery/jquery.min.js"></script>
    <!--    jquery-cookie文件引入-->
    <!--     <script type="text/javascript" src="/public/lib/jquery-cookie/jquery.cookie.js"></script>-->

    <!--    bootstrap基础文件引入-->
    <script type="text/javascript" src="/public/lib/bootstrap/bootstrap.min.js"></script>
    <!--    less文件引入-->
    <!-- <script type="text/javascript" src="/public/lib/less/less.min.js"></script> -->

    <!--    引入测试的js文件,此文件仅在开发过程中使用,真实上线时需要删除-->
    <script type='text/javascript' src="/public/js/buy.js"></script>
  </body>
</html>
