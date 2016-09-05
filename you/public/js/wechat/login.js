var s_user = new Object();

s_user.url = "/wechat/login";
s_user.authorizeUrl = "/wechat/getCode";
s_user.homeUrl = "/proj";

s_user.loginData = new Object();

$(function() {
	/* 添加cookie,并设置其有效期为30天 */
	// $.cookie("the_cookie","the_value", { expires: 30});
	// console.log($.cookie("openid"));
	
	var ua = navigator.userAgent.toLowerCase();
//	//判断是否是微信浏览器浏览
	if(ua.match(/MicroMessenger/i) == 'micromessenger'){
		//如果是,则执行自动登陆
		s_user.autoLogin();
	}else{
		$("#wechat_login_msg").text("请使用微信浏览器,或通过手机验证登陆");
	}
	
	//s_user.autoLogin();

});

// 自动登录的方法
s_user.autoLogin = function() {

	// 从cookie中获取openid
	var openid = $.cookie("openid");

	//检查openid是否存在
	// 如果不存在
	if (openid == undefined || openid == NaN || openid == "") {
		console.log("openid不存在");
		//说明cookie中没有openid,再试着从页面中获取openid
		openid = $("#openid").val(); //从页面输入框查看是否有openid
		// 检查页面中输入框中是否有openid
		// 如果不存
		if (openid == undefined || openid == NaN || openid == "") {
			// 如果openid依旧不存在,则跳转到授权页面进行授权
			window.location.replace(s_user.authorizeUrl);
			
		}else{
			s_user.loginData.openid = $("#openid").val();
			s_user.loginData.code = $("#code").val();
			s_user.loginData.state = $("#state").val();
			s_user.loginData.nickname = $("#nickname").val();
			s_user.loginData.sex = $("#sex").val();
			s_user.loginData.city = $("#city").val();
			s_user.loginData.country = $("#country").val();
			s_user.loginData.headimgurl = $("#headimgurl").val();
			
			s_user.doLogin(s_user.url, s_user.loginData, s_user.loginCallBack);
		}
	} else {
		console.log("cookie存在,即将进行登录操作");
		//存在cookie说明之前成功登录过
		s_user.loginData.openid = $.cookie("openid");
		
		s_user.doLogin(s_user.url, s_user.loginData, s_user.loginCallBack);
		
//		console.log("ok即将进登陆操作");
//		// 如果cookie中存在openid
//		var username = $.cookie("username"); //从cookie中获取username
//		var pwd = $.cookie("pwd"); //从cookie中获取pwd
//		// 如果cookie中不存在user
//		if (username == null || username == NaN || username == "") {
//
//		} else {
////			如果cookie中存在username
//			s_user.loginData.username = username;
//			s_user.loginData.pwd = pwd;
//			s_user.loginData.openid = openid;
//			
//			//如果用户名和密码都存在
//			s_user.doLogin(s_user.url, s_user.loginData, s_user.loginCallBack);
//		}
	}
}

// 点击登陆的方法
//s_user.login = function() {
//	var openid = $("#openid").val();
//	var username = $("#username").val();
//	var pwd = $("#pwd").val();
//	s_user.loginData.username = username;
//	s_user.loginData.pwd = pwd;
//	s_user.loginData.openid = openid;
//
//	s_user.doLogin(s_user.url, s_user.loginData, s_user.loginCallBack);
//}

s_user.loginCallBack = function(data) {
	var coder = data.coder;
	var msg = data.msg;
	if (coder == 0 && msg == "success") {
		//把相关的信息写入cookie
		$.cookie("openid", s_user.loginData.openid, {
			expires: 20
		});
		$.cookie("code", s_user.loginData.code, {
			expires: 20
		});
		$.cookie("state", s_user.loginData.state, {
			expires: 20
		});
		$.cookie("nickname", s_user.loginData.nickname, {
			expires: 20
		});
		$.cookie("sex", s_user.loginData.sex, {
			expires: 20
		});
		$.cookie("city", s_user.loginData.city, {
			expires: 20
		});
		$.cookie("country", s_user.loginData.country, {
			expires: 20
		});
		$.cookie("headimgurl", s_user.loginData.headimgurl, {
			expires: 20
		});
		window.location.replace(s_user.homeUrl);
	}
}

s_user.doLogin = function(url, data, callBack) {
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