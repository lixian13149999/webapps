//$(function(){
//    $('[data-page-button="bottom"]').on("click",function(){
//        $(this).parents(".bottom-button-box").first().find('[data-page-button="bottom"]').each(function(index,ele){
//            $(ele).removeClass('checked');
//        });
//        
//        $(this).addClass('checked');
//    });
//})

//data-page-button="bottom" data-page-button-todo="complain"

//complain
//share
//collect
//support
//supporter

var info = new Object();

$(function(){
	info.setWechatJSAPI();
	
    //底部按钮点击事件的监听
	$('[data-page-button="bottom"]').on('click',function(){
        //获取点击事件需要处理的事情
		var buttonData = $(this).data('page-button-todo');
		switch(buttonData){
			case("complain"):
//				console.log("complain");
                info.complain(this);
				break;
                
			case("share"):
//				console.log("share");
                info.share(this);
				break;
                
			case("collect"):
//				console.log("collect");
                info.collect(this);
				break;
                
			case("unCollect"):
//				console.log("unCollect");
                info.unCollect(this);
				break;
                
			case("support"):
//				console.log("support");
                info.support(this);
				break;
                
			case("supporter"):
//				console.log("supporter");
                info.supporter(this);
				break;
                
			default:
				console.log("default");
		}
		//console.log()
	});
	//<a data-back-img="open" data-back-img-mapping="back_img_box" href="javascript:void(0)">
	$(document).on('click','[data-back-img="open"]',function(){
		var mappingId = $(this).data('back-img-mapping');
		
		$("#"+mappingId).removeClass('hide');
	});
//	 data-back-img="close" data-back-img-mapping="back_img_box"
	$(document).on('click','[data-back-img="close"]',function(){
		var mappingId = $(this).data('back-img-mapping');
		
		$("#"+mappingId).addClass('hide');
	});
	
	$(document).on('click','[data-open-input="close_complain"]',function(){
		info.submitComplain();
	});
});

info.setWechatJSAPI = function(){
	var url = window.location.href;
	$.ajax({
	//          url : '/project/list',
	      url : '/wechat/getJSSignature',
	      dataType : 'json',
	      type : 'POST',
	      data : {
	          "url":url
	      },
	//      async : true,
	      // - cache: false,
	      // - contentType: false,
	      // - processData: false,
	      success : function(data) {
	           cb(data);
	      },
	      error : function() {
	          imessenger.error("系统出错");
	      }
	  });
	
	
	function cb(data){
		console.log(data);
		var timestamp = data.data.timestamp;
		var nonceStr = data.data.noncestr;
		var signature = data.data.signature;
		wx.config({
			debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
			appId: 'wx0090f4dd2513d64f', // 必填，公众号的唯一标识
			timestamp:timestamp, // 必填，生成签名的时间戳
			nonceStr: nonceStr, // 必填，生成签名的随机串
			signature: signature,// 必填，签名，见附录1
			jsApiList: ["onMenuShareTimeline","onMenuShareAppMessage"] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});
		
		wx.ready(function(){
			// config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
			console.log("ready");
			wx.onMenuShareTimeline({
			    title: '', // 分享标题
			    link: '', // 分享链接
			    imgUrl: '', // 分享图标
			    success: function () { 
			        // 用户确认分享后执行的回调函数
			    },
			    cancel: function () { 
			        // 用户取消分享后执行的回调函数
			    }
			});
			wx.onMenuShareAppMessage({
			    title: '', // 分享标题
			    link: '', // 分享链接
			    imgUrl: '', // 分享图标
			    success: function () { 
			        // 用户确认分享后执行的回调函数
			    },
			    cancel: function () { 
			        // 用户取消分享后执行的回调函数
			    }
			});
		});
		
		wx.error(function(res){
			// config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
			console.log("error");
		});
	}
}
//<!--    项目名称输入框-->
//<div id="hide_proj_complain_msg" class="page-input-cont hide">
//    <div class="page-input-box">
//        <textarea id="hide_proj_name_value" name="" class="page-input-box-cont" rows="4" placeholder='请输入投诉信息'></textarea>
//        <!-- <span class="right-bottom-corner-tip">50字</span> -->
//    </div>
//    <div class="page-input-button">
//        <a data-open-input="close_complain" data-mapping-id="hide_proj_complain_msg" href="javascript:void(0)" class="input-button">完成</a>
//    </div>
//</div>
//投诉的处理
info.complain = function(ele){
	$("#hide_proj_complain_msg").removeClass('hide');
}

info.submitComplain = function(){
	var complainVal = $("#hide_proj_complain_msg_value").val();
	console.log(complainVal)
	if(complainVal==undefined||complainVal==""){
		$("#hide_proj_complain_msg").addClass("hide");
		imessenger.success("取消投诉");
	}else{
		var projId = $("#hide_page_data_project_id").val();
		
		$.ajax({
	//          url : '/project/list',
	      url : '/message/addComplain',
	      dataType : 'json',
	      type : 'POST',
	      data : {
	          "projId":projId,
	          "complainVal":complainVal
	      },
	//      async : true,
	      // - cache: false,
	      // - contentType: false,
	      // - processData: false,
	      success : function(data) {
	           cb(data);
	      },
	      error : function() {
	          imessenger.error("系统出错");
	      }
	  });
		
//		var data = new Object();
//		data.code = 200;
//		data.data = 1;
//		data.msg = "投诉信息已提交";
//		cb(data);
		
		function cb(data){
			$("#hide_proj_complain_msg").addClass("hide");
			if(data.code==200&&data.data==1){
				imessenger.success(data.msg);
			}else{
				imessenger.error(data.msg);
			}
		}
	}
}

//分享的处理
info.share = function(ele){
	
	console.log(ele);
}
//收藏的处理
info.collect = function(ele){
    //var userId = $("#hide_page_data_user_id").val();
    var projectId = $("#hide_page_data_project_id").val();
    
    $.ajax({
//            url : '/project/list',
        url : '/proj/collect',
        dataType : 'json',
        type : 'POST',
        data : {
            //"userId":userId,
            "projectId":projectId
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
    
    function cb(data){
//    	console.log(data);
        if(data.code==200&&data.data==1){
            $(ele).children("i").first().addClass("icon-collected").removeClass("icon-collect");
            $(ele).data('page-button-todo','unCollect');
        }
    }
    
//	console.log(ele);
}
//取消收藏的处理
info.unCollect = function(ele){
	var projectId = $("#hide_page_data_project_id").val();
    
    $.ajax({
//            url : '/project/list',
        url : '/proj/unCollect',
        dataType : 'json',
        type : 'POST',
        data : {
            //"userId":userId,
            "projectId":projectId
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
    
    function cb(data){
//    	console.log(data);
        if(data.code==200&&data.data==1){
            $(ele).children("i").first().addClass("icon-collect").removeClass("icon-collected");
            $(ele).data('page-button-todo','collect');
        }
    }
//	console.log(ele);
};

//支持的处理
info.support = function(ele){
	console.log(ele);
};

//查看支持者的处理
info.supporter = function(ele){
	console.log(ele);
};


