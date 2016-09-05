var create = new Object();

$(function() {
    //普通输入框对应的总页面点击事件
    $(document).on('click', '[data-open-input="open"]', function() {
        //        console.log();
        //获取其对应的输入框的di
        var mappingId = $(this).data('mapping-id');
        //显示输入框
        $("#" + mappingId).removeClass("hide");
    });

    //输入页面完成按钮的点击事件
    $(document).on('click', '[data-open-input="close"]', function() {
        //获取其输入框的id
        var mappingId = $(this).data('mapping-id');
        //        console.log(mappingId);
        //隐藏输入框
        $("#" + mappingId).addClass("hide");
    });

    //图片添加框的点击事件
    $(document).on('click', '[data-img-input="open"]', function() {
        //获取其对应的显示域的id
        var mappingIdShow = $(this).data('mapping-id-show');
        //获取其提交域的id
        var mappingId = $(this).data('mapping-id');

        create.changeImgShow = mappingIdShow; //把显示域图片id写到全局
        create.changeImg = mappingId; //把提交域输入框id写到全局

        console.log(create.changeImg);
        console.log(create.changeImgShow);
        //        console.log(mappingId);
        $("#upload_img").click(); //触发公用的图片选择框
    });

    //图片主体输入框发生变动的事件
    $(document).on('change', '#upload_img', function() {
        //        var mappingId = $(this).data('mapping-id');
        //        console.log(mappingId);
        //        $("#upload_img").click();
        //        console.log("change");
        console.log(create.changeImg);
        console.log(create.changeImgShow);
//        upload_img
        
        $.ajaxFileUpload({
    		url : '/upload/img?uname=cutImg', // 用于文件上传的服务器端请求地址
    		secureuri : false, // 一般设置为false(是否锁定这个接口)
    		async : false,
    		fileElementId : $("input#upload_img").attr("id"), // 文件上传控件的id属性 <input
    		// type="file" id="file"
    		// name="file" />
    		// 注意，这里一定要有name值
    		// $("form").serialize(),表单序列化。指把所有元素的ID，NAME 等全部发过去
//    		type:'POST',
    		dataType : 'json',// 返回值类型 一般设置为json
    		complete : function() {// 只要完成即执行，最后执行
    		},
    		success : function(data, status) {// 服务器成功响应处理函数
    			console.log(data);
    			console.log(status);
    			var url = data.msg;
    			//把获取到的图片上传后的路径显示到桌面上
    			$("#" + create.changeImgShow).html('<img class="intr-news-img-img" src="'+url+'" alt="">');
    			//把获取到的上传后的路径写到输入框
    			$("#" + create.changeImg).val(url);
//    			if (typeof (data.error) != 'undefined') {
//    				if (data.error != '') {
//    					if (data.error == "1001") {// 这个error（错误码）是由自己定义的，根据后台返回的json对象的键值而判断
//    					} else if (data.error == "1002") {
//    					}
//    					alert(data.msg);// 同error
//    					return;
//    				} else {
//    					alert(data.msg);
//    				}
//    			} /* * 这里就是做一些其他操作，比如把图片显示到某控件中去之类的。 */
    		},
    		error : function(data, status, e) {// 服务器响应失败处理函数
//    			alert(e);
//    			console.log(e);
    			console.log("error");
    		}
    	});
        
    });


    //    下拉列表的样式
    $(document).on('click', '[data-select-item="item"]', function() {
        //        console.log(mappingId);
        var mappingId = $(this).data('mapping-id'); //获取需要隐藏的div的id

        //修改选中样式
        $("#" + mappingId).find('[data-select-item="item"]').each(function(index, ele) {
            $(ele).removeClass("checked");
        });
        $(this).addClass("checked");

        //写入页面上的显示
        var optionText = $(this).text();
        $("#proj_momey_text").text(optionText);

        //写入需要传到后台的值
        var optionValue = $(this).data('option-value');
        $("#proj_money_value").val(optionValue);

        $("#" + mappingId).addClass("hide"); //隐藏对应的id

        if(optionValue==10){
    		$("#hide_proj_sell_stock_value").val(5);
    		$("#hide_proj_count_product_value").val(100);
    		
    		$("#hide_proj_sell_stock_text").html("5%");
    		$("#hide_proj_count_product_text").html("100份");
    	}else if(optionValue==20){
    		$("#hide_proj_sell_stock_value").val(10);
    		$("#hide_proj_count_product_value").val(200);
    		
    		$("#hide_proj_sell_stock_text").html("10%");
    		$("#hide_proj_count_product_text").html("200份");
    	}

        console.log($("#proj_money_value").val());
    });
    
//    $(document).on('change', '#proj_money_value', function() {
//    	console.log($("#proj_money_value").val());
//    	var money = $(this).val();
//    	if(money==10){
//    		$("#hide_proj_sell_stock_value").val(5);
//    		$("#hide_proj_count_product_value").val(100);
//    		
//    		$("#hide_proj_sell_stock_text").html("5%");
//    		$("#hide_proj_count_product_value").html("100份");
//    	}else if(money==20){
//    		$("#hide_proj_sell_stock_value").val(10);
//    		$("#hide_proj_count_product_value").val(200);
//    		
//    		$("#hide_proj_sell_stock_text").html("10%");
//    		$("#hide_proj_count_product_value").html("200份");
//    	}
////    	众筹金额发生变动的时候
////    	hide_proj_sell_stock_value
////    	hide_proj_count_product_value
//    	
////    	hide_proj_sell_stock_text
////    	hide_proj_count_product_text
//    });


    //保存按钮点击事件
    $(document).on('click', '[data-page-button="save"]', function() {
            //传入数值2,表示这是准备保存的项目
//        console.log("点击保存")
        if(create.checkProjName()&&create.checkProjMoney()&&create.checkProjSellStock()&&create.checkProjCountProduct()&&create.checkProjDesImg()&&create.checkProjDescribe()&&create.checkProjFounderImg()&&create.checkProjFounderDes()&&create.checkProjRepayExplain()&&create.checkProjIdCard()&&create.checkProjWechatDimen()){
//             console.log("执行保存");
             create.submit(2);
        }
    });
    //提交按钮点击事件
    $(document).on('click', '[data-page-button="submit"]', function() {
       //如果验证都能通过
        if(create.checkProjName()&&create.checkProjMoney()&&create.checkProjSellStock()&&create.checkProjCountProduct()&&create.checkProjDesImg()&&create.checkProjDescribe()&&create.checkProjFounderImg()&&create.checkProjFounderDes()&&create.checkProjRepayExplain()&&create.checkProjIdCard()&&create.checkProjWechatDimen()){
            //这里执行相关的提交处理
            //传入数值1,表示这是将要提交到审核的项目
        	create.submit(1);
        }
    });
    //    
    //    $(document).on('click','#hide_proj_money',function(){
    //        console.log("abc");
    ////        var mappingId = $(this).data('mapping-id');
    ////        console.log(mappingId);
    ////        $("#"+mappingId).click();
    //    });
});

create.submit = function(subType){
    var name = $("#hide_proj_name_value").val();//项目名称
    var money = $("#proj_money_value").val();//融资金额
    var sellStock = $("#hide_proj_sell_stock_value").val();//出让股份
    var countProduct = $("#hide_proj_count_product_value").val();//发售数量
    var desImg = '';
    var describe = $("#hide_proj_describe_value").val();//项目描述
    var founderDesImg = '';
    var founderDes = $("#hide_proj_founder_des_value").val();//创始人介绍
    var repayExplain = $("#hide_proj_repay_explain_value").val();//回报说明
    var idCard = $("#id_card").val();//身份证验证图片
    var wechatDimen = $("#wechat_dimen").val();//微信二维码照片
    var warning = $("#hide_proj_warning_value").val();//注意事项
    
    for (var i = 1; i <= 6; i++) {
        var val = $("#proj_des_img_" + i).val();
        var isNull = verify.isNull(val);
        if (!isNull) {
            if(verify.isNull(desImg)){
                desImg=desImg+val;
            }else{
                desImg=desImg+";"+val;
            }
        }
    }
    for (var i = 1; i <= 6; i++) {
        var val = $("#proj_founder_img_" + i).val();
        var isNull = verify.isNull(val);
        if (!isNull) {
            if(verify.isNull(founderDesImg)){
                founderDesImg=founderDesImg+val;
            }else{
                founderDesImg=founderDesImg+";"+val;
            }
        }
    }
    
    console.log("subType:"+subType);
    console.log("name:"+name);
    console.log("money:"+money);
    console.log("sellStock:"+sellStock);
    console.log("countProduct:"+countProduct);
    console.log("desImg:"+desImg);
    console.log("describe:"+describe);
    console.log("founderImg:"+founderDesImg);
    console.log("founderDes:"+founderDes);
    console.log("repayExplain:"+repayExplain);
    console.log("idCard:"+idCard);
    console.log("wechatDimen:"+wechatDimen);
    console.log("warning:"+warning);
    console.log(name);
    
//    var sellStockInt = parseInt(sellStock);
//    var countProductInt = parseInt(countProduct);
    $.ajax({
//            url : '/project/list',
        url : '/proj/create',
        dataType : 'json',
        type : 'POST',
        data : {
            "subType":subType,
            
            "name":name,
            "targetMoney":money,
            "sellStock":sellStock,
            "countProduct":countProduct,
            "desImg":desImg,
            "projDescribe":describe,
            "founderImg":founderDesImg,
            "founderDes":founderDes,
            "repayExplain":repayExplain,
            "idCard":idCard,
            "wechatDimen":wechatDimen,
            "warning":warning
        },
//        async : true,
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
//    <a id="hide_save_back_a" href="/user/proj?reason=1&hasCollect=0&state=1&type=0"></a>
//	<a id="hide_submit_back_a" href="/user/proj?reason=1&hasCollect=0&state=2&type=0"></a>
    function cb(data){
    	if(data.code==200&&data.data==1){
    		if(subType==1){
    			document.getElementById("hide_submit_back_a").click();
    		}else if(subType==2){
    			document.getElementById("hide_save_back_a").click();
    		}
    	}
    	console.log(data);
    }
}

//检查项目名称
create.checkProjName = function() {
    var isOk = false;
    var val = $("#hide_proj_name_value").val();
    var isNull = verify.isNull(val);
    var shorterThan = verify.shorterThan(val, 5);

    if (!isNull) {
        if (!shorterThan) {
            isOk = true;
        } else {
            imessenger.error("项目名称不能小于5位");
        }
    } else {
        imessenger.error("项目名称不能为空");
    }
    console.log(val);
    return isOk;
}
//检查众筹金额
create.checkProjMoney = function() {
    var isOk = false;
    var val = $("#proj_money_value").val();
    var isNull = verify.isNull(val);
    var isNumber = verify.isNumber(val);

    if (!isNull) {
        if (isNumber) {
            isOk = true;
        } else {
            imessenger.error("请选择正确的金额");
        }
    } else {
        imessenger.error("众筹金额不能为空");
    }

    console.log(val);
    return isOk;
}
//检查出让股份
create.checkProjSellStock = function() {
    var val = $("#hide_proj_sell_stock_value").val();
    var isOk = false;
    //    var val = $("#proj_money_value").val();
    var isNull = verify.isNull(val);
    var isNumber = verify.isNumber(val);

    if (!isNull) {
        if (isNumber) {
            if (val <= 10) {
                isOk = true;
            } else {
                imessenger.error("出让股份不能大于10%");
            }
        } else {
            imessenger.error("出让股份为数值");
        }
    } else {
        imessenger.error("出让股份不能为空");
    }
    console.log(val);
    return isOk;
}
//检查发售数量
create.checkProjCountProduct = function() {
    var val = $("#hide_proj_count_product_value").val();
    var isOk = false;
    //    var val = $("#proj_money_value").val();
    var isNull = verify.isNull(val);
    var isNumber = verify.isNumber(val);

    if (!isNull) {
        if (isNumber) {
            if (val <= 200) {
                isOk = true;
            } else {
                imessenger.error("发售数量不能大于200份");
            }
        } else {
            imessenger.error("发售数量为数值");
        }
    } else {
        imessenger.error("发售数量不能为空");
    }
    console.log(val);
    return isOk;
}
//检查项目图片
create.checkProjDesImg = function() {
    var isOk = false;

    //var allNull = true;
    var countImgs = 0;
    for (var i = 1; i <= 6; i++) {
        var val = $("#proj_des_img_" + i).val();
        var isNull = verify.isNull(val);
        //如果当前项目地址不为空
        if (!isNull) {
        	countImgs+=1;
            //allNull = false;
        }
    }
    if (countImgs>=4) {
        isOk = true;
    } else {
        imessenger.error("请上传至少四张项目图片");
    }
    return isOk;
}
//检查项目描述
create.checkProjDescribe = function() {
    var val = $("#hide_proj_describe_value").val();
    var isOk = false;
    //    var val = $("#hide_proj_name_value").val();
    var isNull = verify.isNull(val);
    var shorterThan = verify.shorterThan(val, 5);

    if (!isNull) {
        if (!shorterThan) {
            isOk = true;
        } else {
            imessenger.error("项目描述不能少于15个字");
        }
    } else {
        imessenger.error("项目描述不能为空");
    }
    console.log(val);
    return isOk;
    //    console.log(val);
}

//检查创始人图片
create.checkProjFounderImg = function() {
    var isOk = false;

    //var allNull = true;
    var contImgs = 0;
    for (var i = 1; i <= 6; i++) {
        var val = $("#proj_founder_img_" + i).val();
        var isNull = verify.isNull(val);
        if (!isNull) {
        	contImgs+=1;
            //allNull = false;
        }
    }
    if (contImgs>=4) {
        isOk = true;
    } else {
        imessenger.error("请上传至少四张创始人照片");
    }
    return isOk;
}

//检查创始人描述
create.checkProjFounderDes = function() {

    var val = $("#hide_proj_founder_des_value").val();
    var isOk = false;
    //    var val = $("#hide_proj_name_value").val();
    var isNull = verify.isNull(val);
    var shorterThan = verify.shorterThan(val, 5);

    if (!isNull) {
        if (!shorterThan) {
            isOk = true;
        } else {
            imessenger.error("创始人描述不能少于15个字");
        }
    } else {
        imessenger.error("创始人描述不能为空");
    }
    console.log(val);
    return isOk;
    //    console.log(val);
}
//检查回报说明
create.checkProjRepayExplain = function() {
    var val = $("#hide_proj_repay_explain_value").val();
    var isOk = false;
    //    var val = $("#hide_proj_name_value").val();
    var isNull = verify.isNull(val);
    var shorterThan = verify.shorterThan(val, 5);

    if (!isNull) {
        if (!shorterThan) {
            isOk = true;
        } else {
            imessenger.error("回报说明不能少于15个字");
        }
    } else {
        imessenger.error("回报说明不能为空");
    }
    console.log(val);
    return isOk;
    //    console.log(val);
}
//检查身份证认证信息
create.checkProjIdCard = function() {
    var val = $("#id_card").val();
    var isOk = false;
    var isNull = verify.isNull(val);

    if (!isNull) {
        isOk = true;
    } else {
        imessenger.error("请上传身份认证信息");
    }
    console.log(val);
    return isOk;
}
//检查二维码图片
create.checkProjWechatDimen = function() {
    var val = $("#wechat_dimen").val();
    //    console.log(val);
    var isOk = false;
    var isNull = verify.isNull(val);

    if (!isNull) {
        isOk = true;
    } else {
        imessenger.error("请上传微信二维码");
    }
    console.log(val);
    return isOk;
}
//检查注意事项
create.checkProjWarning = function() {
    var val = $("#hide_proj_warning_value").val();
    //    console.log(val);
    var isOk = false;
    //    var val = $("#hide_proj_name_value").val();
    var isNull = verify.isNull(val);
    var shorterThan = verify.shorterThan(val, 5);

    if (!isNull) {
        if (!shorterThan) {
            isOk = true;
        } else {
            imessenger.error("注意事项不能少于15个字");
        }
    } else {
        imessenger.error("注意事项不能为空");
    }
    console.log(val);
    return isOk;
}