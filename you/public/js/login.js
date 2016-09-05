var baseLogin = new Object();

baseLogin.submitOk = false;
//baseLogin.countError = 0;

$(document).ready(function() {
    
    //    输入框获取到焦点后为其加上下划线,用于交互
    $("[data-login-input='border']").on("focus", function() {
        $(this).parent('.input-box').addClass('input_focus');
    });
    //    输入框失去焦点后,取消焦点
    $("[data-login-input='border']").on("blur", function() {
        $(this).parent('.input-box').removeClass('input_focus');
    });
    //    图标类型的复选框点击时效果切换
    $(document).on('click','[data-checkbox-ibox="checkbox"]',function(){
//    	imessenger.error(checkType);
    	
        //获取当前的选择框状态
        var checkType = $(this).data("checkbox-ibox-type");
        //如果是已选中状态
        if(checkType=="uncheck"){
            //console.log(checkType);
//            imessenger.error(checkType);
            $(this).find('i').first().addClass("icon-checkbox-checked").removeClass("icon-checkbox");
            $(this).data("checkbox-ibox-type","checked");
        }else if(checkType="checked"){
            console.log(checkType);
            $(this).find('i').first().addClass("icon-checkbox").removeClass("icon-checkbox-checked");
            $(this).data("checkbox-ibox-type","uncheck");
        }
    });


    //获取验证码按钮点击的方法
    $('[data-login-click="getVerifyCode"]').on('click', function() {
        //baseLogin.checkPhone();
        if (!baseLogin.checkPhone()) {
            imessenger.error("请输入正确的手机号码");
        } else {
        	//隐藏所有的错误提示
            Messenger().hideAll();
            //调用获取验码的方法
            baseLogin.getVerifyCode();
            //执行倒计时
            baseLogin.showSettime(this);
//            baseLogin.getVerifyCode
        }
    });

    //输入框失去焦点事件
    $("#phone").on("blur", function() {
        if (!baseLogin.checkPhone()) {
            imessenger.error("请输入正确的手机号码");
        } else {
            Messenger().hideAll();
        }
    });
    //键盘抬起事件
    $("#phone").on("keyup", function() {
        if (!baseLogin.checkPhone()) {
            imessenger.error("请输入正确的手机号码");
        } else {
            Messenger().hideAll();
        }
    });

    //点击提交按钮事件
    $('[data-login-click="submit"]').on('click', function() {
        var phoneOk = baseLogin.checkPhone();
//        var codeOk = baseLogin.checkCode();
        var provisionOk = baseLogin.checkIsProvision();
        if (!phoneOk) {
            imessenger.error("请输入正确的手机号码1");
        } else if(!provisionOk){
            imessenger.error("请同意友筹注册协议");
        }else{
        	//避免出现重复提交的问题
        	$('[data-login-click="submit"]').first().attr("disabled",'true');
            Messenger().hideAll();
            baseLogin.submit();
        }
    });
    
    $('[data-login-click="subInWechat"]').on('click',function(){
    	window.location.href="/wechat/login";
    });
});


//获取验证码,并把验证码写入到页面隐藏字段中
baseLogin.getVerifyCode = function (){
	var phone = $("#phone").val();
	//通过ajax方式获取验证码
	$.ajax({
		url : '/login/getCode',
		dataType:'json',
		type : 'POST',
		data : {
			"phone": phone
		},
		//async : false,
		// - cache: false,
		// - contentType: false,
		// - processData: false,
		success : function(data) {
			cb(data);
		},
		error : function() {
			console.log('用户删除角色出错');
		}
	});
	
	function cb(data){
		console.log(data);
	}
};

baseLogin.submit = function() {
	var phone = $("#phone").val();
	var code = $("#verify_code").val();
	//alert("点击了登陆");
//	imessenger.error("submit");
    console.log(code);
    $.ajax({
		url : '/login',
		type : 'POST',
		dataType:'json',
		data : {
             phone: phone,
             code: code
		},
		async : false,
		// - cache: false,
		// - contentType: false,
		// - processData: false,
		success : function(data) {
			 cb(data);
		},
		error : function() {
			alert("登陆出错");
			console.log('登录出错');
		}
	});
    function cb(data){
    	//alert(data.code+"==="+data.data);
    	
//    	状态码200,data值1,表示登陆成功
    	if(data.code==200 && data.data==1){
    		//alert("将要跳转");
    		var sourceHref = window.location.href;
    		var isLogin = sourceHref.indexOf("login");
    		
    		if(isLogin<1){
    			var ihref = sourceHref.substring(sourceHref.indexOf("/",7),sourceHref.lenth);
    			document.getElementById("hide_href_a").href = ihref;
    			console.log(ihref);
    			document.getElementById("hide_href_a").click();
    			//window.location.href=sourceHref;
    		}else{
    			document.getElementById("hide_href_a").click();
    			//window.location.href="/proj";
    		}
    	}else{
    		$('[data-login-click="submit"]').first().attr("disabled",false);
    		imessenger.error("验证码错误或已过期");
    	}
    }
}

//检查手机号码合法性的方法
baseLogin.checkPhone = function() {
    var isOk = false;

    var val = $("#phone").val(); //获取手机号码输入框中的内容
    var isNull = verify.isNull(val); //检查内容是否为空
    var isPhone = verify.isPhone(val); //检查内容是否为正确的手机号

    //如果内容不为空
    if (!isNull) {
        //如果是正确的手机号码
        if (isPhone) {
            isOk = true;
        }
    }
    return isOk;
}
//检查验证码
baseLogin.checkCode = function() {
    var isOk = false;
    //获取验证码输入框中的内容
    var code = $("#verify_code").val();
    var isNull = verify.isNull(code); //检查内容是否为空
    //检查是否为空
    if (!isNull) {
        var sourceCode = $("#source_verify_code").val();
        if (code == sourceCode) {
            isOk = true;
        }
    }
    return isOk;
}

//检测checkbox是否已经选中
baseLogin.checkIsProvision = function(){
    var isChecked = $("#provision_checkbox").data("checkbox-ibox-type");
    if(isChecked=="checked"){
        return true;
    }else{
        return false;
    }
//    console.log(isChecked);
}

//显示定时器样式,并隐藏原有按钮
baseLogin.showSettime = function(ele) {
    //     console.log(ele);
    var eleA = $(ele); //获取"获取验证码"的按钮对象
    var eleNext = eleA.next("#settime_button"); //获取显示定时器的对象(用于替换原有标签)
    var lockTime = 59; //设定定时长度

    eleA.addClass("hide"); //隐藏原有a标签
    eleNext.removeClass("hide"); //显示定时器标签

    //加入定时器,使其循环获取时间并显示到页面
    var interval = self.setInterval(function() {
        //如果没有到时间
        if (lockTime > 0) {
            //在倒计时标签中显示相应的信息
            eleNext.text(lockTime + "秒请稍后");
        } else {
            //            如果已经到时间了
            //            隐藏定时标签
            eleNext.addClass("hide");
            //显示原来的按钮
            eleA.removeClass("hide");
            //去除定时器
            window.clearInterval(interval);
            //恢复原有数据值
            eleNext.text(60 + "秒请稍后");
        }
        //每次触发定时器都要依次减少原有时间
        lockTime--;
    }, 1000);
}