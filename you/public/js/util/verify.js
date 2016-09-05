var verify = new Object();

//输入框验证js开始

/**
 * 验证输入框中内容是否为空
 * @param inputId输入框的id(当前输入框)
 * @return boolean 当可以提交的时候返回true,不可提交的时候返回false
 */
//.trim()
verify.isNull = function(val) {
    var reg = new RegExp("/^\s*$/g");
//    var thisData = $("#" + inputId).val();
    if (val == "" || reg.test(val)) {
        return true;
    }
    return false;
}

//jQuery.validator.addMethod("isphone", function(value, element) {
//
//    var reg0 = /^[1][3-8]\d{9}$/;
//
//    var my = false;
//
//    if (reg0.test(value)) my = true;
//
//    if (value != '') {
//        if (!my) {
//            return false;
//        }
//    };
//
//    return true;
//
//}, " 请输入有效的手机号码");
verify.isPhone = function(val){
    var reg = /^[1][3-8]\d{9}$/;
    
    if(reg.test(val)){
        return true;
    }
    return false;
}

/**
 * 验证其中是否有中文
 * @param inputId输入框的id(当前输入框)
 * @return boolean 有中文的时候返回true 没有中文的时候返回false
 */
function hasChain(inputId) {
    var reg = new RegExp("[\u4e00-\u9fa5]");
    /*var reg = "^[\u4e00-\u9fa5]{0,}$";*/
    //.trim()
    var thisData = $("#" + inputId).val();
//    console.log("调用了trim");
    if (reg.test(thisData)) {
        return true;
    }
    return false;
}

/**
 * 验证文本的长度
 * @param inputId输入框的id(当前输入框)
 * @param size输入对应的监测长度
 * @return boolean 如果大于传入的长度返回true 否则返回fals
 */
//.trim()
verify.longThan = function(thisData, size) {
//    var thisData = $("#" + inputId).val();
    /*console.log(thisData.length);*/
	if(thisData!=undefined&&thisData!=""){
	    if (thisData.length > size) {
	        return true;
	    }else{
	    	return false;
	    }
	}
    return false;
}

/**
 * 验证文本的长度
 * @param inputId输入框的id(当前输入框)
 * @param size输入对应的监测长度
 * @return boolean 如果小传入的长度返回true 否则返回fals
 */
//.trim()
verify.shorterThan = function(thisData, size) {
//    var thisData = $("#" + inputId).val();
	if(thisData!=undefined&&thisData!=""){
		if (thisData.length < size) {
			return true;
		}else{
			return false;
		}
	}
    return true;
}


/**
 * 验证其中是否有极为特殊字符(除键盘上看到的以外)
 * @param inputId输入框的id(当前输入框)
 * @return boolean 有特殊字符的时候返回true 没有中文的时候返回false
 *
 * 注:此验证对[]\这三个字符不通过
 */
//.trim()
function hasSpecialCharacters(inputId) {
    //创建验证规则:找出除了a-zA-Z还有键盘上能见到的特殊字符(不包括[]\)以外,的特殊字符
    var reg = new RegExp("[^a-zA-Z0-9`~!@#$%^&*()\-=_+\{\};:\'\"|/*,.<>?]");
    var thisData = $("#" + inputId).val();
    if(reg.test(thisData)){
        return true;
    }
    return false;
}

//传入的两个id对应的输入框值是否相等
function isSame(eleId1,eleId2){
    var value1 = $("#"+eleId1).val();
    var value2 = $("#"+eleId2).val();
    if(value1 == value2){
        return true;
    }else{
        return false;
    }
}

/**
 * 验证其中是否是中文
 * @param inputId输入框的对象
 * @return boolean 是数字的时候返回true 不是数字的时候返回false
 */
verify.isNumber = function(val){
    var reg = new RegExp("^[0-9]+([.]{1}[0-9]+){0,1}$");
//    var val = $("#"+inputId).val();
    //console.log(val);
    if(reg.test(val)){
        return true;
    }
    return false;
}

//定义错误提示/成功后消除提示的js
function toError(divId,labelId,msg){
	$("#"+divId).addClass("has-error");
	$("#"+labelId).css("display","block").text(msg);
}
function toSuccess(divId,labelId){
	$("#"+divId).removeClass("has-error");
	$("#"+labelId).css("display","none");
}
function toError2(divId,labelId,msg){
	$("#"+divId).addClass("has-error");
	$("#"+labelId).css("display","inline-block").text(msg);
}

//检查输入框中的值是否为空,如果为空返回false,并且给出相应的提示
function checkIsNotNull(inputId,divId,labelId,msg){
	//如果输入框中的值为空
	if(isNull(inputId)){
		toError(divId,labelId,msg);
		return false;
	}else{
		toSuccess(divId,labelId);
		return true;
	}
}


/**
 * 定义执行检测的总控制器
 * @param todoFunction要执行的检测方法
 * @param trueOrFalse检测方法的返回值是否需要逆转
 * (方法的返回值为true的时候是错误还是false的时候是错误)
 * 简单说,就是想要的值是否和方法返回值一致
 * @param divId外层div的id
 * @param labelId提示框的id
 * @param msg提示语音
 * @return boolean 是数字的时候返回true 不是数字的时候返回false
 */
function checkSome(todoFunction,trueOrFalse,divId,labelId,msg){
	//通过eval解析并解析传入的需要执行的检测方法,并获取返回值
	var isThis = eval(todoFunction);
	//如果为false时则不需要逆转
	if(!trueOrFalse){
		//如果解析值为true,表示有问题,则显示错误样式,并提示
		if(isThis){
			toError(divId,labelId,msg);
			return false;
		}else{
			//如果解析值为false,表示没有问题
			toSuccess(divId,labelId);
			return true;
		}
	//如果为true时则需要逆转
	}else if(trueOrFalse){
		//如果解析值为false,表示有问题,则显示错误样式,并提示
		if(!isThis){
			toError(divId,labelId,msg);
			return false;
		}else{
			//如果解析值为true,表示没有问题
			toSuccess(divId,labelId);
			//console.log("12323");
			return true;
		}
	}
}
function checkSome2(todoFunction,trueOrFalse,divId,labelId,msg){
	//通过eval解析并解析传入的需要执行的检测方法,并获取返回值
	var isThis = eval(todoFunction);
	//如果为false时则不需要逆转
	if(!trueOrFalse){
		//如果解析值为true,表示有问题,则显示错误样式,并提示
		if(isThis){
			toError2(divId,labelId,msg);
			return false;
		}else{
			//如果解析值为false,表示没有问题
			toSuccess(divId,labelId);
			return true;
		}
	//如果为true时则需要逆转
	}else if(trueOrFalse){
		//如果解析值为false,表示有问题,则显示错误样式,并提示
		if(!isThis){
			toError2(divId,labelId,msg);
			return false;
		}else{
			//如果解析值为true,表示没有问题
			toSuccess(divId,labelId);
			return true;
		}
	}
}

//对上一个封装方法进行简化
function easyCheck(todoFun,inputId,isSame,msg){
	var todoFunction = todoFun+"('"+inputId+"')";
	var trueOrFalse = isSame;
	var divId = inputId+"_div";
	var labelId = inputId+"_label";
	return checkSome(todoFunction,trueOrFalse,divId,labelId,msg);
}