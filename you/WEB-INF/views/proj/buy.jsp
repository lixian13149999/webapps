<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

    <title>购买</title>
    <!--    页面的标签栏处的小图标-->
    <link rel='shortcut icon' href='/public/imgs/logo32.png'>

    <!--    bootstrap基础样式引入-->
    <link rel="stylesheet" type="text/css" href="/public/lib/bootstrap/bootstrap.min.css">
    <!--    警告提示框的样式文件-->
    <link rel="stylesheet" type="text/css" href="/public/lib/messenger/css/messenger.css">
    <link rel="stylesheet" type="text/css" href="/public/lib/messenger/css/messenger-theme-air.css">
    <!--    button样式引入-->
    <link rel="stylesheet" type="text/css" href="/public/lib/button/buttons.css">
    <!--    字体标签库引入-->
    <link rel="stylesheet" type="text/css" href="/public/lib/iconfont/iconfont.css">

    <!--   自定义样式总和引入-->
    <link rel="stylesheet" type="text/css" href="/public/css/index.css">

  </head>
  
  <body>
  	<div class="primary row buy-cont">
        <div class="project-box">
            <div class="proj-top">
                <div style="background-image: url('/public/imgs/user.png');" class="proj-user-photo">

                </div>
                <div class="proj-user-name">
                    <!--                       <h4>-->
                    ${userProject.nickname }
                    <!--                       </h4>-->
                </div>
                <div class="proj-user-create-time">
                    ${userProject.day}天前
                </div>
                <div class="proj-user-over-time">
                    剩余
                    <a href="javascript:void(0)">${30-userProject.day}</a>
                    天
                </div>
            </div>
            <div class="proj-title">
                <a>
                ${userProject.name}
               </a>
            </div>

            <div class="proj-bottom-box">
                <div class="row">
                    <div class="col-xs-4 proj-bottom-item">
                        共
                        <a href="javascript:void(0)"> ${userProject.countProduct}</a>
                        份
                    </div>
                    <div class="col-xs-4 proj-bottom-item">
                        余
                        <a href="javascript:void(0)">
                    	  <fmt:parseNumber value="${(userProject.targetMoney-userProject.finishMoney)/userProject.unitPrice }" integerOnly="true"></fmt:parseNumber>
                        </a>
                        份
                    </div>
                    <div class="col-xs-4 proj-bottom-item">

                        <a href="javascript:void(0)">${userProject.unitPrice}</a>
                        元/份
                    </div>
                </div>
            </div>
        </div>

        <!--        产品的剩余量-->
        <input id="hide_count_stock_prod" type="text" class="hide" value="10" />
        <!--        购买的产品数量,用于向后台传值的字段-->
        <input id="hide_count_buy_prod" type="text" class="hide" value="${wantBuy==0?1:wantBuy}" />
        <!--        隐藏的,用于存储订单总价的字段-->
        <input type="text" id="hide_all_price" class="hide" value="${wantBuy==0?1000:wantBuy*1000}" />
        <!--        隐藏的,用于存储项目id的字段-->
        <input type="text" id="hide_project_id" class="hide" value="${userProject.projectId}" />
        <!--        隐藏的,此用户已经用户已经购买的产品数量-->
        <input type="text" id="hide_coutn_keeped_prod" class="hide" value="${countKeepedProd}" />
        <%-- <input type="text" id="hide_coutn_keeped_prod" class="hide" value="${countKeepedProd}" /> --%>
        

        <div class="buy-num-line-box">
            <div class="link-label-box" href="javascript:void(0)">
                <label class="line-primary-label" for="">支持数量</label>
            </div>
            <div class="line-controller-box">
                <a id="a_button_sub" data-buy-num="sub" class="icon-button-tip" href="javascript:void(0)">
                	<i class="icon icon-subtract"></i>
                </a>
                <label id="count_buy_prod_text" for="" class="buy-num-label">${wantBuy==0?1:wantBuy}</label>
                <a id="a_button_add" data-buy-num="add" class="icon-button-tip" href="javascript:void(0)">
                	<i class="icon icon-jiahao"></i>
                </a>
            </div>
        </div>
    <c:if test="${addr!=null }">
        <div class="addr-box ">
            <div class="addr-title">
                <div id="buy_addr_username" class="username">${addr.realName }</div>
                <div id="buy_addr_phone" class="phone">${addr.phone }</div>
            </div>
            <div id="buy_addr_addrinfo" class="addr-info">${addr.province }${addr.city }${addr.county }${addr.infoAddr }</div>
            <div class="addr-bottom">
                <a id="buy_addr_to_default" href="javascript:void(0)" data-page-button="to_default_base_addr" data-hide-addr-id="这里设值的是地址的Id" data-checkbox-ibox="checkbox" data-checkbox-ibox-type="uncheck">
                    ${addr.isDefault==1 ? "默认地址" : "收货地址" }
                </a>

            </div>
        </div>
        
      </c:if>
       <c:if test="${addr==null }"><!-- 如果没有默认值就选择添加地址 -->
        <div class="primary-line-box">
            <a class="link-box" href="/addr/add">

                <label class="line-primary-label" for="">请先添加地址</label>
                <span class="line-tip">
                    <i class="icon icon-goto"></i>
                </span>
            </a>
        </div>
 		</c:if>
        <div class="primary-line-box">
<!--             <a class="link-box" data-page-button="change_addr" href="javascript:void(0)"> -->
            <a id="chenge_addr_a" class="link-box" href="/addr/listBuy?projId=${projId}&wantBuy=1">

                <label class="line-primary-label" for="">更换收货地址</label>
                <span class="line-tip">
                    <i class="icon icon-goto"></i>
                </span>
            </a>
        </div>
    </div>
    
    <a id="wechat_pay_href" class="hide" href="javascript:void(0)">微信支付的隐藏连接</a>
    <div class="bottom-info bottom-box container-fluid">
       <div class="row bottom-button-box">

            <a data-page-button="bottom" href="javascript:void(0)" class="bottom-icon-box bottom-buttom-money-item icol-xs-6">
<!--                <i class="icon icon-warning bottom-icon-i"></i>-->
<!--                <label for="" class="bottom-icon-label">警告</label>-->
                需支付: 
                <span id="buy_all_price" class="buy_count_money">${wantBuy==0?1000:wantBuy*1000}</span>
            </a>
            <a id="button_pay_default" data-page-button="buy" href="javascript:void(0)" class="bottom-icon-box icol-xs-4 bottom-buttom-a-item">
                微信支付
            </a>
            <a id="button_pay_substitute" href="javascript:void(0)" class="bottom-icon-box icol-xs-4 bottom-buttom-a-item hide" style="background-color:#ccc; color:#999 ">
                微信支付
            </a> 
       </div>
    </div>
   
   
    <!--jquery的js文件-->
    <script type="text/javascript" src="/public/lib/jquery/jquery.min.js"></script>
    <!--    jquery-cookie文件引入-->
    <!--     <script type="text/javascript" src="/public/lib/jquery-cookie/jquery.cookie.js"></script>-->

    <!--    bootstrap基础文件引入-->
    <script type="text/javascript" src="/public/lib/bootstrap/bootstrap.min.js"></script>
    <!--    警告提示框的js源文件-->
    <script type="text/javascript" src="/public/lib/messenger/js/messenger.min.js"></script>

    <!--    警告提示的js文件-->
    <script type="text/javascript" src="/public/js/util/imessenger.js"></script>
    <!--    less文件引入-->
    <!-- <script type="text/javascript" src="/public/lib/less/less.min.js"></script> -->

    <!--    引入测试的js文件,此文件仅在开发过程中使用,真实上线时需要删除-->
    <script type='text/javascript' src="/public/js/buy.js"></script>
  </body>
</html>
