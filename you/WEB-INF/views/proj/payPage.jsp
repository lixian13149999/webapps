<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head lang="en">
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>微信支付</title>

<meta name="keywords" content="HTML,ASP,PHP,SQL">
<meta name="description" content="友筹众筹支付">
<meta name="viewport" content="initial-scale=1, user-scalable=0, minimal-ui">

<link rel='shortcut icon' href='/public/imgs/logo32.png' >
	<!--    bootstrap基础样式引入-->
    <link rel="stylesheet" type="text/css" href="/public/lib/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/public/lib/button/buttons.css">
    <!--    警告提示框的样式文件-->
    <link rel="stylesheet" type="text/css" href="/public/lib/messenger/css/messenger.css">
    <link rel="stylesheet" type="text/css" href="/public/lib/messenger/css/messenger-theme-air.css">
    
</head>


<body>
	<!-- <div id="wechat_login_msg">
		将要
	</div> -->
	<input class="hide" type="hidden" id="app_id" value="${appId}" />
	<input class="hide" type="hidden" id="time_stamp" value="${timeStamp}" />
	<input class="hide" type="hidden" id="nonce_str" value="${nonceStr}" />
	<input class="hide" type="hidden" id="ipackage" value="${ipackage}" />
	<input class="hide" type="hidden" id="sign_type" value="${signType}" />
	<input class="hide" type="hidden" id="pay_sign" value="${paySign}" />
	
	<c:if test="${overTime!=2 }">
		支付超时,请返回<a href="/proj">项目列表</a>重新购买
	</c:if>
	<c:if test="${overTime==2 }">
		
		<div style="text-align: center;">
			<div style="padding:30px 0px;">将要确认支付,若长时间不弹出支付框请</div>
			<a id="wechat_certify_success_href" class="button button-primary button-small" href="javascript:pay()">确认支付</a>
		</div>
	</c:if>
	<!-- <input type="button" onclick="pay()" value="点击支付"  /> -->

	<!-- <script type="text/javascript">var ctx = "${ctx}";</script> -->
	<!-- 引入jquery包 -->
	<script type="text/javascript" src="/public/lib/jquery/jquery.min.js"></script>
    <!--    警告提示框的js源文件-->
    <script type="text/javascript" src="/public/lib/messenger/js/messenger.min.js"></script>

    <!--    警告提示的js文件-->
    <script type="text/javascript" src="/public/js/util/imessenger.js"></script>
	<!-- 引入cookie包 -->
	<!-- 引入自己的js文件 -->
	<script>
		function pay(){
			var appId = $("#app_id").val();
			var timeStamp = $("#time_stamp").val();
			var nonceStr = $("#nonce_str").val();
			var ipackage = $("#ipackage").val();
			var signType = $("#sign_type").val();
			var paySign = $("#pay_sign").val();
			/* alert(appId);
			alert("WeixinJSBridge"+WeixinJSBridge); */
			
			WeixinJSBridge.invoke('getBrandWCPayRequest', {
				"appId" : appId, //公众号名称，由商户传入     
				"timeStamp" : timeStamp, //时间戳，自1970年以来的秒数     
				"nonceStr" : nonceStr, //随机串     
				"package" : ipackage,//统一支付接口返回的prepay_id 参数值，提交格式如：prepay_id=***
				"signType" : signType, //微信签名方式：     
				"paySign" : paySign //微信签名 
			}, function(res) {
				/* alert(res.err_code + res.err_desc);
				alert(res.err_msg); */
				if (res.err_msg == "get_brand_wcpay_request:ok") {
					imessenger.success("付款成功");
				} else if (res.err_msg === 'get_brand_wcpay_request:cancel') {
					imessenger.success("取消支付");
				}
			});
		}
		/* $(function(){
			pay();
		}); */
	</script>
	
</body>

</html>