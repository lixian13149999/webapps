var buy = new Object();


//普通输入框对应的总页面点击事件
$(document).on('click', '[data-open-input="open"]', function() {
    //        console.log();
    //获取其对应的输入框的di
    var mappingId = $(this).data('mapping-id');
   // alert("获取的值是："+mappingId);
    //显示输入框
    $("#" + mappingId).removeClass("hide");
});

//输入页面完成按钮的点击事件
$(document).on('click', '[data-open-input="close"]', function() {
    
    //获取输入框的id
    var valueId = $(this).data('value-id');
    //获取输入框中的value值
    var value = $("#"+valueId).val();
    
    //获取显示区域的id
    var showId = $(this).data('show-id');
    //把获取到的输入框中的值设置到显示区域
    $("#"+showId).text(value);
    
    //获取其输入框box的id
    var mappingId = $(this).data('mapping-id');
    //        console.log(mappingId);
    //隐藏输入框
    $("#" + mappingId).addClass("hide");
});

//<!--    地址 省-->
//<div id="hide_addr_province" class="page-input-cont hide"  data-show-id="text_addr_province" data-value-id="value_addr_province" >
//<!--        <input type="text" id="proj_money_value" value="1" class="hide" />-->
//    <dl class="page-input-select-box">
//        <dd data-select-item="item" data-mapping-id="hide_addr_province" data-option-value="1" class="page-input-select-item checked">1万</dd>
//        <dd data-select-item="item" data-mapping-id="hide_addr_province" data-option-value="2" class="page-input-select-item">2万</dd>
//        <dd data-select-item="item" data-mapping-id="hide_addr_province" data-option-value="3" class="page-input-select-item">3万</dd>
//        <dd data-select-item="item" data-mapping-id="hide_addr_province" data-option-value="4" class="page-input-select-item">4万</dd>
//        <dd data-select-item="item" data-mapping-id="hide_addr_province" data-option-value="5" class="page-input-select-item">5万</dd>
//        <dd data-select-item="item" data-mapping-id="hide_addr_province" data-option-value="6" class="page-input-select-item">6万</dd>
//        <dd data-select-item="item" data-mapping-id="hide_addr_province" data-option-value="7" class="page-input-select-item">7万</dd>
//        <dd data-select-item="item" data-mapping-id="hide_addr_province" data-option-value="8" class="page-input-select-item">8万</dd>
//    </dl>
//</div>
//<dd data-select-item="item" data-mapping-id="hide_proj_money" data-option-value="2" class="page-input-select-item">2万</dd>


$(document).on('click', '[data-select-item="province"]', function() {
	console.log("abcd");
    //获取其输入框的id
    var mappingId = "hide_addr_province";
    
    //修改选中样式
    $("#" + mappingId).find('[data-select-item="province"]').each(function(index, ele) {
        $(ele).removeClass("checked");
    });
    $(this).addClass("checked");
    
//    获取选中的值
    var value = $(this).data('option-value');
    //获取选中的值中的code
//    var code
    
    //获取显示标签的id
    var showId = $("#" + mappingId).data('show-id');
    //获取存值标签的id
    var valueId = $("#" + mappingId).data('value-id');
    
    $("#"+showId).text(value);//设置存储值
    $("#"+valueId).val(value);//设置显示值
    
    //隐藏输入框
    $("#" + mappingId).addClass("hide");
    
    
    var code = $(this).data("option-code");
    
    $("#value_addr_province_code").val(code);
    
    console.log(code);
    $.ajax({
        url : "/addr/getCityList",
        type : 'GET',
        data : {
             pCode: code
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
        }
    });
    function cb(data){
        var innerHtml = '';
        if(data.code==200&&data.data==1){
            var cityList = data.msg;
            if(cityList.length>0){
                for(var i = 0;i<cityList.length;i++){
                    var city = cityList[i];
                    innerHtml += '<a data-select-item="city" data-option-value="'+city.name+'" class="page-input-select-item" href="javascript:void(0)" style="display: block;">'+city.name+'</a>';
                }
//                ${address.name}
            }else{
                innerHtml = '<a data-select-item="city" data-option-value="数据出错" class="page-input-select-item" href="javascript:void(0)" style="display: block;">数据出错</a>';
            }
            
            $("#hide_addr_city_box").html(innerHtml);
        }
        console.log(data);
    }
});

//选中地址后的处理方式
$(document).on('click', '[data-select-item="city"]', function() {
    //获取其输入框的id
    var mappingId = 'hide_addr_city';
    
    //修改选中样式
    $("#" + mappingId).find('[data-select-item="city"]').each(function(index, ele) {
        $(ele).removeClass("checked");
    });
    $(this).addClass("checked");
    
    var value = $(this).data('option-value');
    
    var showId = $("#" + mappingId).data('show-id');
    var valueId = $("#" + mappingId).data('value-id');
    
    $("#"+showId).text(value);
    $("#"+valueId).val(value);
    
    //        console.log(mappingId);
    //隐藏输入框
    $("#" + mappingId).addClass("hide");
});


////输入页面完成按钮的点击事件
//$(document).on('click', '[data-open-input="select"]', function() {
//    console.log("select click");
//    console.log(document.getElementById("select_id"));
//    document.getElementById("select_id").click;
////    //获取其输入框的id
////    var mappingId = $(this).data('mapping-id');
////    //        console.log(mappingId);
////    //隐藏输入框
////    $("#" + mappingId).addClass("hide");
//});



//    图标类型的复选框点击时效果切换
$(document).on('click', '[data-checkbox-ibox="checkbox"]', function() {
    //    	imessenger.error(checkType);
    //获取当前的选择框状态
    var checkType = $(this).data("checkbox-ibox-type");
    //如果当前是未选中状态
    if (checkType == "uncheck") {
//        console.log(checkType);
        //循环所有的选择框的对象
        $('[data-checkbox-ibox="checkbox"]').each(function(index,ele){
        	var eleCheckType = $(ele).data("checkbox-ibox-type");
        	//如果循环中有被选中的,置为未选中状态
        	if(eleCheckType=="checked"){
        		//调用后台设置成未选中状态
        		buy.addrToUncheck(ele);
        	}
        });
        //把当前的标签置为已选中状态
        buy.addrToChecked(this);
    //如果当前就是选中状态
    } else if (checkType = "checked") {
    	//直接把当前项目设置成未选中状态
    	buy.addrToUncheck(this);
//        console.log(checkType);
//        $(this).find('i').first().addClass("icon-checkbox").removeClass("icon-checkbox-checked");
//        $(this).data("checkbox-ibox-type", "uncheck");
    }
});

buy.addrToUncheck = function(ele){
	var checkedAddrId = $(ele).data("hide-addr-id");
	
	$.ajax({
        url : "/addr/toUndefault",
        type : 'POST',
        data : {
        	addrId:checkedAddrId
        },
        async : false,
        // - cache: false,
        // - contentType: false,
        // - processData: false,
        success : function(data) {
             cb(data);
        },
        error : function() {
            console.log('添加地址出错');
        }
    });
	function cb(data){
		if(data.code==200&&data.data==1){
			$(ele).find('i').first().addClass("icon-checkbox").removeClass("icon-checkbox-checked");
			$(ele).data("checkbox-ibox-type", "uncheck");
		}
	}
};

buy.addrToChecked = function(ele){
	var checkedAddrId = $(ele).data("hide-addr-id");
	
	$.ajax({
        url : "/addr/toDefault",
        type : 'POST',
        data : {
        	addrId:checkedAddrId
        },
        async : false,
        // - cache: false,
        // - contentType: false,
        // - processData: false,
        success : function(data) {
             cb(data);
        },
        error : function() {
            console.log('添加地址出错');
        }
    });
	function cb(data){
		if(data.code==200&&data.data==1){
			$(ele).find('i').first().addClass("icon-checkbox-checked").removeClass("icon-checkbox");
			$(ele).data("checkbox-ibox-type", "checked");
		}
	}
//  imessenger.error(checkType);
};
//<!--        产品的剩余量-->
//<input id="hide_count_stock_prod" type="text" class=""  />
//<!--        购买的产品数量,用于向后台传值的字段-->
//<input id="hide_count_buy_prod" type="text" class=""  />
//<label id="count_buy_prod_text" for="" class="buy-num-label">2</label>

//产品数量,点击减少时的处理
$(document).on('click','[data-buy-num="sub"]',function(){
    //获取产品的剩余量
    var countStock = parseInt($("#hide_count_stock_prod").val());
    //获取项目的购买量
    var countBuy = parseInt($("#hide_count_buy_prod").val());
    
    if(countBuy<=1){
        buy.keepProj(1);
    }else{
        buy.subProd(countBuy);
        
        $("#a_button_add").removeClass('disabled');
    }
    
    //获取当前的购买值
    var nowCountBuy = parseInt($("#hide_count_buy_prod").val());
    //把增加按钮设置成不可点击的样式
    if(nowCountBuy<=1){
        $(this).addClass('disabled');
    }
});

//产品数量点击添加按钮时的处理
$(document).on('click','[data-buy-num="add"]',function(){
    //获取产品的剩余量
    var countStock = parseInt($("#hide_count_stock_prod").val());
    //获取项目的购买量
    var countBuy = parseInt($("#hide_count_buy_prod").val());
    
    //用户已经购买的数量
    var keeped = parseInt($("#hide_coutn_keeped_prod").val());
    
    console.log(countStock);
    console.log(countBuy);
    console.log(keeped);
    
    //如果购买数量大于等于剩余数量
    if(countBuy>=countStock){
        buy.keepProj(countStock);
    }else if(countBuy+keeped>=5){
    	buy.keepProj(5-keeped);
    	$(this).addClass('disabled');
    	imessenger.error("一个用户最多可以支持5份");
    }else{
        buy.addProd(countBuy);
        $("#a_button_sub").removeClass('disabled');
    }
    
    //获取当前的购买值
    var nowCountBuy = parseInt($("#hide_count_buy_prod").val());
    //把增加按钮设置成不可点击的样式
    if(nowCountBuy>=countStock){
        $(this).addClass('disabled');
    }
});

//<input type="text" id="hide_all_price" value="1000" />
//buy_all_price
//添加购买的产品数量
buy.addProd = function(countBuy){
    $("#hide_count_buy_prod").val(countBuy+1);//把购买数量+1
    $("#count_buy_prod_text").text(countBuy+1);//设置前台的text值
    
    $("#hide_all_price").val((countBuy+1)*1000);
    $("#buy_all_price").text((countBuy+1)*1000);
    
    buy.chengeAddrHref(countBuy+1);
}
//减少购买的产品数量
buy.subProd = function(countBuy){
    $("#hide_count_buy_prod").val(countBuy-1);//把购买数量+1
    $("#count_buy_prod_text").text(countBuy-1);//设置前台的text值
    
    $("#hide_all_price").val((countBuy-1)*1000);
    $("#buy_all_price").text((countBuy-1)*1000);
    
    buy.chengeAddrHref(countBuy-1);
}
//保持现在的购买产品数量
buy.keepProj = function(countStock){
    $("#hide_count_buy_prod").val(countStock);//把购买数量设置成剩余数量
    $("#count_buy_prod_text").text(countStock);//设置前台显示的text值
}

buy.chengeAddrHref = function(wantBuy){
//	<a id="chenge_addr_a" class="link-box" href="/addr/listBuy?projId=${projId}&wantBuy=1">
	//$("#")
//	document.href = 
	var projId = $("#hide_project_id").val();
//	var wantBuy = 
	document.getElementById("chenge_addr_a").href ="/addr/listBuy?projId="+projId+"&wantBuy="+wantBuy;
}

$(document).on('click','[data-page-button="save"]',function(){
    var addOrEdit = $("#add_or_edit").val();
    var addrId = $("#addr_id").val();
    
    var addrName = '';
    var addrPhone = '';
    var addrProvince = '';
    var addrProvinceCode = '';
    var addrCity = '';
    var addrInfo = '';
    if(buy.checkAddrName()&&buy.checkAddrPhone()&&buy.checkAddrProvince()&&buy.checkAddrCity()&&buy.checkAddrInfo()){
        addrName = $("#hide_addr_name_value").val();
        addrPhone = $("#hide_addr_phone_value").val();
        addrProvince = $("#value_addr_province").val();
        addrCity = $("#value_addr_city").val();
        addrInfo = $("#hide_addr_info_value").val();
        addrProvinceCode = $("#value_addr_province_code").val();
        
        var url = '/addr/save';
//        if(addOrEdit==1||addOrEdit=="1"){
//            url = "/addr/add";
//        }else{
//            url = "/addr/edit";
//        }
        $.ajax({
            url : url,
            type : 'POST',
            data : {
            	 addOrEdit:addOrEdit,
                 addrId: addrId,
                
                 addrName: addrName,
                 addrPhone: addrPhone,
                 addrProvince: addrProvince,
                 addrProvinceCode: addrProvinceCode,
                 addrCity: addrCity,
                 addrInfo: addrInfo
            },
            async : false,
            // - cache: false,
            // - contentType: false,
            // - processData: false,
            success : function(data) {
                 cb(data);
            },
            error : function() {
                console.log('添加地址出错');
            }
        });
    
        function cb(data){
        	document.getElementById("addr_add_or_edit_success_href").click();
        }
    }
    
//    buy.showAddrs();
//    console.log('aaa');
});

//
////<a href="javascript:void(0)" data-page-button="to_default_addr" data-hide-addr-id="这里设值的是地址的Id" data-checkbox-ibox="checkbox" data-checkbox-ibox-type="uncheck">
//
//$(document).on('click','[data-page-button="to_default_addr"]',function(){
//	
//});

//显示地址列表
$(document).on('click','[data-page-button="change_addr"]',function(){
    buy.showAddrs();
//    console.log('aaa');
});
//选中某地址的处理
$(document).on('click','[data-page-button="check_addr"]',function(){
    buy.chooseAddr(this);
//    console.log('aaa');
});

$(function(){
    //获取产品的剩余量
    var countStock = parseInt($("#hide_count_stock_prod").val());
    //获取项目的购买量
    var countBuy = parseInt($("#hide_count_buy_prod").val());
    
    if(countBuy==1){
        $("#a_button_sub").addClass('disabled');
    }else if(countBuy>=countStock){
        $("#a_button_add").addClass('disabled');
    }
});
//显示地址列表(内联页面)
buy.showAddrs = function(){
    //显示地址选择的模块
    $("#hide_addr_box").removeClass("hide");
    
}

//choose
//选中某地址时的处理方式
buy.chooseAddr = function(ele){
    var addId = $(ele).data('hide-addr-id');
//    console.l
    
    var checkedUsername = $("#buy_addr_username_"+addId).text();
    var checkedPhone = $("#buy_addr_phone_"+addId).text();
    var checkedAddr = $("#buy_addr_addrinfo_"+addId).text();
    var checkedIsDefault = $("#buy_addr_to_default_"+addId).data('checkbox-ibox-type');
    
    
    $("#buy_addr_username").text(checkedUsername);
    $("#buy_addr_phone").text(checkedPhone);
    $("#buy_addr_addrinfo").text(checkedAddr);
    
    if(checkedIsDefault=="checked"){
        $("#buy_addr_to_default").text("默认地址");
    }else{
        $("#buy_addr_to_default").text("收货地址");
    }
    
    $("#hide_addr_box").addClass("hide");
}

//检验地址名称的字段
buy.checkAddrName = function(){
    var isOk = false;
    var val = $("#hide_addr_name_value").val();
    var isNull = verify.isNull(val);
//    var shorterThan = verify.shorterThan(val, 5);

    if (!isNull) {
        isOk = true;
//        if (!shorterThan) {
//        } else {
//            imessenger.error("项目名称不能小于5位");
//        }
    } else {
        imessenger.error("姓名不能为空");
    }
    console.log(val);
    return isOk;
}
//检验地址中联系电话的方法
buy.checkAddrPhone = function(){
    var isOk = false;

    var val = $("#hide_addr_phone_value").val(); //获取手机号码输入框中的内容
    var isNull = verify.isNull(val); //检查内容是否为空
    var isPhone = verify.isPhone(val); //检查内容是否为正确的手机号

    //如果内容不为空
    if (!isNull) {
        //如果是正确的手机号码
        if (isPhone) {
            isOk = true;
        }else{
            imessenger.error("请输入正确的手机号");
        }
    }else{
        imessenger.error("手机号码不能为空");
    }
    return isOk;
}
//检验地址中选中省份的方法
buy.checkAddrProvince = function(){
    var isOk = false;

    var val = $("#value_addr_province").val(); //获取手机号码输入框中的内容
    var isNull = verify.isNull(val); //检查内容是否为空

    //如果内容不为空
    if (!isNull) {
        isOk = true;
    }else{
        imessenger.error("请选择省份");
    }
    return isOk;
}
//检验地址中选中城市的方法
buy.checkAddrCity = function(){
    var isOk = false;

    var val = $("#value_addr_city").val(); //获取手机号码输入框中的内容
    var isNull = verify.isNull(val); //检查内容是否为空

    //如果内容不为空
    if (!isNull) {
        isOk = true;
    }else{
        imessenger.error("请选择城市");
    }
    return isOk;
}
//检验地址中详细地址的方法
buy.checkAddrInfo = function(){
    var isOk = false;
    var val = $("#hide_addr_info_value").val();
    var isNull = verify.isNull(val);
    var shorterThan = verify.shorterThan(val, 2);

    if (!isNull) {
        if (!shorterThan) {
            isOk = true;
        } else {
            imessenger.error("详细地址过于简单了");
        }
    } else {
        imessenger.error("详细地址不能为空");
    }
    console.log(val);
    return isOk;
}
//<!--        产品的剩余量-->
//<input id="hide_count_stock_prod" type="text" class="hide" value="10" />
//<!--        购买的产品数量,用于向后台传值的字段-->
//<input id="hide_count_buy_prod" type="text" class="hide" value="${wantBuy==0?1:wantBuy}" />
//<!--        隐藏的,用于存储订单总价的字段-->
//<input type="text" id="hide_all_price" class="hide" value="${wantBuy==0?1000:wantBuy*1000}" />
//<!--        隐藏的,用于存储项目id的字段-->
//<input type="text" id="hide_project_id" class="hide" value="${userProject.projectId}" />
//<!--        隐藏的,此用户已经用户已经购买的产品数量-->
//<input type="text" id="hide_coutn_keeped_prod" class="hide" value="${countKeepedProd}" />
$(document).on('click','[data-page-button="buy"]',function(){
	var projId = parseInt($("#hide_project_id").val());
	var keepedProd = parseInt($("#hide_coutn_keeped_prod").val());
	var wantBuy = parseInt($("#hide_count_buy_prod").val());
	var needPay = parseInt($("#hide_all_price").val());
	
	var realName = $("#buy_addr_username").text();
	var phone = $("#buy_addr_phone").text();
	var addrInfo = $("#buy_addr_addrinfo").text();
	
	console.log(projId);
	console.log(keepedProd);
	console.log(wantBuy);
	console.log(needPay);
	
	$(this).addClass("hide");
	$("#button_pay_substitute").removeClass("hide");
	
	if(projId==''||projId==0||wantBuy*1000!=needPay){
		imessenger.error("系统错误,请重新发起购买");
	}else if(realName==""||realName==undefined){
		imessenger.error("收件人不能为空");
	}else if(phone==""||phone==undefined){
		imessenger.error("收件电话不能为空");
	}else if(addrInfo==""||addrInfo==undefined){
		imessenger.error("收件地址不能为空");
	}else if((wantBuy+keepedProd)>5){
		imessenger.error("支持数量不得大于5份");
		$(this).removeClass("hide");
		$("#button_pay_substitute").addClass("hide");
	}else{
		$.ajax({
            url : "/proj/buy",
            type : 'POST',
            dataType:'json',
            data : {
            	realName:realName,
            	phone:phone,
            	addrInfo:addrInfo,
            	projId:projId,
            	wantBuy: wantBuy,
                
            	needPay: needPay,
            	keepedProd: keepedProd
            },
            async : false,
            // - cache: false,
            // - contentType: false,
            // - processData: false,
            success : function(data) {
                 cb(data);
            },
            error : function() {
                console.log('添加地址出错');
            }
        });
		function cb(data){
			orderNo = data.msg;
			document.getElementById("wechat_pay_href").href="/proj/pay?orderNo="+orderNo;
			document.getElementById("wechat_pay_href").click();
		}
	}
});
