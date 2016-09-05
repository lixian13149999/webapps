var bound = new Object();

//获取验证码按钮点击的方法
$(document).on('click','[data-login-click="get_verify_code"]', function() {
    //baseLogin.checkPhone();
    if (!bound.checkPhone()) {
        imessenger.error("请输入正确的手机号码");
    } else {
        //隐藏所有的错误提示
        Messenger().hideAll();
        //调用获取验码的方法
        bound.getVerifyCode();
        //执行倒计时
        bound.showSettime(this);
//            baseLogin.getVerifyCode
    }
});

$(document).on('click','#bound_submit',function(){
    if(bound.checkPhone()&&bound.checkCode()){
        bound.doBound();
    }else{
    	imessenger.error("手机号或验证码错误");
    }
});

bound.doBound = function(){
    var phone = $("#phone").val();
    var code = $("#verify_code").val();
    
    $.ajax({
		url : '/user/boundPhone',
		dataType:'json',
		type : 'POST',
		data : {
			"phone": phone,
            "code":code
		},
		//async : false,
		// - cache: false,
		// - contentType: false,
		// - processData: false,
		success : function(data) {
            if(data.code==200&&data.data==1){
                imessenger.success("绑定号码成功");
            }else{
                imessenger.error(data.msg);
            }
			cb(data);
		},
		error : function() {
			console.log('绑定手机号出错');
		}
	});
    function cb(){
    	document.getElementById("bound_success_href").click();
    }
}

//获取验证码,并把验证码写入到页面隐藏字段中
bound.getVerifyCode = function (){
	var phone = $("#phone").val();
    
//    var data = new Object();
//    data.code == 200;
//    data.data == 1;
//    data.msg == 123123;
//    
//    cb(data);
//	//通过ajax方式获取验证码
	$.ajax({
		url : '/user/getCode2',
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
			bound.removeSettime($("#get_verify_code_button"));
		}
	});
	
	function cb(data){
        if(data.code==200&&data.data==1){
            $("#source_verify_code").val(data.msg);
        }else if(data.code==200&&data.data==2){
            imessenger.error(data.msg);
            bound.removeSettime($("#get_verify_code_button"));
        }else{
            imessenger.error("获取验证码出错");
            bound.removeSettime($("#get_verify_code_button"));
        }
		console.log(data);
	}
};

//检查手机号码合法性的方法
bound.checkPhone = function() {
    var isOk = false;

    var val = $("#phone").val(); //获取手机号码输入框中的内容
    console.log(val);
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
bound.checkCode = function() {
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

//显示定时器样式,并隐藏原有按钮
bound.showSettime = function(ele) {
    //     console.log(ele);
    var eleA = $(ele); //获取"获取验证码"的按钮对象
    var eleNext = eleA.next("#settime_button"); //获取显示定时器的对象(用于替换原有标签)
    var lockTime = 59; //设定定时长度

    eleA.addClass("hide"); //隐藏原有a标签
    eleNext.removeClass("hide"); //显示定时器标签

    //加入定时器,使其循环获取时间并显示到页面
    bound.interval = self.setInterval(function() {
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
bound.removeSettime = function(ele){
	console.log(ele);
	var eleA = $(ele); //获取"获取验证码"的按钮对象
    var eleNext = eleA.next("#settime_button"); //获取显示定时器的对象(用于替换原有标签)
    
	eleNext.addClass("hide");
    //显示原来的按钮
    eleA.removeClass("hide");
    //去除定时器
    window.clearInterval(bound.interval);
}