var s_user = new Object();

//s_user.url = "/pr/login";
//s_user.authorizeUrl = "/wechat/getCode";
//s_user.homeUrl = "/proj";

s_user.loginData = new Object();

$(function() {
	var ua = navigator.userAgent.toLowerCase();
//	//判断是否是微信浏览器浏览
	if(ua.match(/MicroMessenger/i) == 'micromessenger'){
		//如果是,则执行自动登陆
		s_user.boundUser();
	}else{
		$("#wechat_login_msg").text("请使用微信浏览器,或通过手机验证登陆");
	}
});

// 自动登录的方法
s_user.boundUser = function() {

	s_user.loginData.openid = $("#openid").val();
	s_user.loginData.code = $("#code").val();
	s_user.loginData.state = $("#state").val();
	s_user.loginData.nickname = $("#nickname").val();
	s_user.loginData.sex = $("#sex").val();
	s_user.loginData.city = $("#city").val();
	s_user.loginData.country = $("#country").val();
	s_user.loginData.headimgurl = $("#headimgurl").val();
	
	s_user.doCertify("/wechat/bound", s_user.loginData, s_user.certifyCallBack);
}

s_user.certifyCallBack = function(data) {
//	var coder = data.coder;
//	var msg = data.msg;
	if (data.coder == 200 && data.data==1) {
		document.getElementById("wechat_certify_success_href").href="/proj/buy?projId="+data.msg;
		document.getElementById("wechat_certify_success_href").click();
	}
}

s_user.doCertify = function(url, data, callBack) {
	$.ajax({
		url: url,
		type: 'POST',
		dataType: "json",
		data: data,
		async: true,
		success: function(data) {
			callBack(data);
		},
		error: function() {
			console.log('用户修改出错');
		}
	});
}