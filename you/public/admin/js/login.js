var adminLogin = new Object();

adminLogin.getCode = function(ele){
    console.log(ele);
    $(ele).addClass("disabled");
    
    var userName = $("#username").val();
    if(userName!=""&&userName!=undefined){
        $.ajax({
            url : "/admin/getCode",
            type : 'POST',
            data : {
                 userName: userName
            },
            async : false,
            // - cache: false,
            // - contentType: false,
            // - processData: false,
            success : function(data) {
                 cb(data);
            },
            error : function() {
                console.log('登录出错');
                imessenger.error("系统错误");
                $(ele).removeClass("disabled");
            }
        });
        function cb(data){
            if(data.code==200&&data.data==1){
                imessenger.success("验证码已发送,请稍后");
            }else{
                imessenger.error("用户名错误或用户名不存在");
                $(ele).removeClass("disabled");
            }
            console.log(data);
        }
    }else{
        imessenger.error("用户名不能为空");
        $(ele).removeClass("disabled");
    }
//    console.log("getCode");
}

adminLogin.login = function(ele){
	$(ele).addClass("disabled");
	
	var userName = $("#username").val();
	var code = $("#code").val();
	if(userName==undefined||userName==""||code==undefined||code==""){
		imessenger.error("用户名或验证码错误");
		$(ele).removeClass("disabled");
	}else{
		$.ajax({
            url : "/admin/login",
            type : 'POST',
            data : {
                 userName: userName,
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
                console.log('登录出错');
                imessenger.error("系统错误");
                $(ele).removeClass("disabled");
            }
        });
        function cb(data){
            if(data.code==200&&data.data==1){
                imessenger.success("登录成功");
                window.location.href="/admin"
            }else{
                imessenger.error("用户名和验证码不符或验证码过期(5分钟内有效)");
                $(ele).removeClass("disabled");
            }
            console.log(data);
        }
	}
    console.log("login");
}