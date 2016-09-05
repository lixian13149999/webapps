var ivalid = new Object();


ivalid.base = function(eleId, submitFun, showErrors) {
    $("#" + eleId).validate({
        submitHandler: submitFun,
        //        success:success,
        //        errorPlacement:showErrorMsg,
        showErrors: showErrors,
        rules: {
            firstname: "required",
            phone: {
                required: true,
//                rangelength: [11, 11],
                isphone:true
            },
            lastname: "required",
            username: {
                required: true,
                minlength: 2
            },
            password: {
                required: true,
                minlength: 6
            },
            confirm_password: {
                required: true,
                minlength: 5,
                equalTo: "#password"
            },
            email: {
                required: true,
                email: true
            },
            topic: {
                required: "#newsletter:checked",
                minlength: 2
            },
            agree: "required"
        },
        messages: {
            firstname: "请输入您的名字",
            phone: {
                required: "手机号码不能为空",
//                rangelength: "请输入正确的手机号码",
                isphone:"请输入正确的手机号码"
            },
            lastname: "请输入您的姓氏",
            username: {
                required: "请输入用户名",
                minlength: "用户名必需由两个字母组成"
            },
            password: {
                required: "请输入密码",
                minlength: "密码长度不能小于 6 个字母"
            },
            confirm_password: {
                required: "请输入密码",
                minlength: "密码长度不能小于 5 个字母",
                equalTo: "两次密码输入不一致"
            },
            email: "请输入一个正确的邮箱",
            agree: "请接受我们的声明",
            topic: "请选择两个主题"
        }
    });
}



jQuery.validator.addMethod("isphone", function(value, element) {

    var reg0 = /^[1][3-8]\d{9}$/;

    var my = false;

    if (reg0.test(value)) my = true;

    if (value != '') {
        if (!my) {
            return false;
        }
    };

    return true;

}, " 请输入有效的手机号码");