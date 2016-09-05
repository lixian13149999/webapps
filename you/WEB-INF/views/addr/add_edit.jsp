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

    <title>${addrOrEdit==2 ? '修改地址' : '添加地址'}</title>
    <!--    页面的标签栏处的小图标-->
    <link rel='shortcut icon' href='/public/imgs/logo32.png'>

    <!--    bootstrap基础样式引入-->
    <link rel="stylesheet" type="text/css" href="/public/lib/bootstrap/bootstrap.min.css">
    
    <!--    引入提示框的样式-->
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
  <a id="addr_add_or_edit_success_href" href="/addr/list" class="hide">地址编辑/添加成功后的跳转页面</a>
    <!--   用来判断是添加页面还是编辑页面的字段-->
    <input id="add_or_edit" type="hidden" value="${addrOrEdit}" />
<!--    如果是编辑页面,用来出存储地址id的位置-->
    <input id="addr_id" type="hidden" value="${addrOrEdit==2 ? addr.id : 0}" />
    
<!--   地址中省份的值的位置-->
    <input type="hidden" id="value_addr_province" value="${addrOrEdit==2 ? addr.province : ''}" />
    <input type="hidden" id="value_addr_province_code" value="${addrOrEdit==2 ? addr.provinceCode : 0}" />
<!--    地址中市的值的的位置-->
    <input type="hidden" id="value_addr_city" value="${addrOrEdit==2 ? addr.city : ''}" />


<!-- request.setAttribute("addrOrEdit", addrOrEdit);
		request.setAttribute("addr", addr);
		request.setAttribute("addressList", addressList); -->
    <div class="container-fluid">
        <div id="" class="primary row user-cont">
            <div class="intr-cont un-margin-top">

                <div class="intr-line-box">
                    <a data-open-input="open" data-mapping-id="hide_addr_name" class="link-box" href="javascript:void(0)">
                        <span class="addr-line-intr-label" for="">
                            收件人
                        </span>
                        <span id="text_addr_name" class="addr-line-intr-label" for="">
                            ${addrOrEdit==2 ? addr.realName : '用户姓名'}
                        </span>
                        <span class="addr-line-tip">
                            <i class="icon icon-goto"></i>
                        </span>
                    </a>
                </div>
                <div class="intr-line-box">
                    <a data-open-input="open" data-mapping-id="hide_addr_phone" class="link-box" href="javascript:void(0)">
                        <span class="addr-line-intr-label" for="">
                            联系电话
                        </span>
                        <span id="text_addr_phone" class="addr-line-intr-label" for="">
                            ${addrOrEdit==2 ? addr.phone : '请输入联系电话'}
                        </span>
                        <span class="addr-line-tip">
                            <i class="icon icon-goto"></i>
                        </span>
                    </a>
                </div>
                <div class="intr-line-box">
                    <a data-open-input="open" data-mapping-id="hide_addr_province" class="link-box" href="javascript:void(0)">
                        <span class="addr-line-intr-label" for="">
                            省份
                        </span>
                        <span id="text_addr_province" class="addr-line-intr-label" for="">
                            ${addrOrEdit==2 ? addr.province : '请选择'}
                        </span>
                        <span class="addr-line-tip">
                            <i class="icon icon-goto"></i>
                        </span>
                    </a>
                </div>
                <div class="intr-line-box">
                    <a data-open-input="open" data-mapping-id="hide_addr_city" class="link-box" href="javascript:void(0)">
                        <span class="addr-line-intr-label" for="">
                            城市
                        </span>
                        <span id="text_addr_city" class="addr-line-intr-label" for="">
                            ${addrOrEdit==2 ? addr.city : '请选择'}
                        </span>
                        <span class="addr-line-tip">
                            <i class="icon icon-goto"></i>
                        </span>
                    </a>
                </div>
                <div class="page-input-box">
                    <textarea id="hide_addr_info_value" name="abc" class="page-input-box-cont" rows="3" placeholder='请输入详细地址...'>${addrOrEdit==2 ? addr.infoAddr : ''}</textarea>
                    <!--           <span class="right-bottom-corner-tip">280字</span>-->
                </div>
                
                <div class="page-input-button">
                    <a data-page-button="save" href="javascript:void(0)" class="input-button">保存</a>
                </div>
            </div>

        </div>

    </div>
    
    <!--    收件人姓名输入框-->
    <div id="hide_addr_name" class="page-input-cont hide">
        <div class="page-input-box">
            <input value="${addrOrEdit==2 ? addr.realName : ''}" id="hide_addr_name_value" class="page-input-box-cont" placeholder='请输入收件人姓名' type="text" />
        </div>
        <div class="page-input-button">
            <a data-open-input="close" data-mapping-id="hide_addr_name" data-value-id="hide_addr_name_value" data-show-id="text_addr_name" href="javascript:void(0)" class="input-button">完成</a>
        </div>
    </div>
    <!--    联系电话输入框-->
    <div id="hide_addr_phone" class="page-input-cont hide">
        <div class="page-input-box">
            <input value="${addrOrEdit==2 ? addr.phone : ''}" id="hide_addr_phone_value" class="page-input-box-cont" placeholder='请输入联系电话' type="text" />
        </div>
        <div class="page-input-button">
            <a data-open-input="close" data-mapping-id="hide_addr_phone" data-value-id="hide_addr_phone_value" data-show-id="text_addr_phone" href="javascript:void(0)" class="input-button">完成</a>
        </div>
    </div>
    
    <!--    地址 省-->
    <div id="hide_addr_province" class="page-input-cont hide"  data-show-id="text_addr_province" data-value-id="value_addr_province" >
<!--        <input type="text" id="proj_money_value" value="1" class="hide" />-->
        <dl class="page-input-select-box">
	        <c:forEach var="address" items="${addressList}">
	        	<a data-select-item="province" data-option-value="${address.name}" data-option-code="${address.code}" class="page-input-select-item" href="javascript:void(0)" style="display: block;">${address.name}</a>
	        </c:forEach>
        </dl>
    </div>
    <!--    地址 市-->
    <div id="hide_addr_city" class="page-input-cont hide" data-show-id="text_addr_city" data-value-id="value_addr_city">
<!--        <input type="text" id="proj_money_value" value="1" class="hide"  />-->
        <dl id="hide_addr_city_box" class="page-input-select-box">
        	<c:if test="${addrOrEdit==1}">
	            <a data-select-item="city" data-option-value="请先选择省份" class="page-input-select-item" href="javascript:void(0)" style="display: block;">请先选择省份</a>
        	</c:if>
        	<c:if test="${addrOrEdit==2}">
	        	<c:forEach var="addressCity" items="${addressListCity}">
		        	<a data-select-item="city" data-option-value="${addressCity.name}" class="page-input-select-item" href="javascript:void(0)" style="display: block;">${addressCity.name}</a>
		        </c:forEach>
	            <!-- <dd data-select-item="city" data-option-value="请先选择省份" class="page-input-select-item">请先选择省份</dd> -->
        	</c:if>
        </dl>
    </div>


    <!--jquery的js文件-->
    <script type="text/javascript" src="/public/lib/jquery/jquery.min.js"></script>

    <!--    bootstrap基础文件引入-->
    <script type="text/javascript" src="/public/lib/bootstrap/bootstrap.min.js"></script>
    
<!--    引入提示框的js文件-->
    <script type="text/javascript" src="/public/lib/messenger/js/messenger.min.js"></script>
    <script type="text/javascript" src="/public/js/util/imessenger.js"></script>
    
<!--    引入用于验证的js文件-->
    <script type="text/javascript" src="/public/js/util/verify.js"></script>
    
    
    <!--    less文件引入-->
    <!-- <script type="text/javascript" src="/public/lib/less/less.min.js"></script> -->

    <!--    引入测试的js文件,此文件仅在开发过程中使用,真实上线时需要删除-->
<!--    <script type='text/javascript' src="/public/js/util/util.js"></script>-->
    <script type='text/javascript' src="/public/js/buy.js"></script>
  </body>
</html>
