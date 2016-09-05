var user = new Object();

$(document).ready(function(){
    $(document).on('click','[data-page-type="button"]',function(){
    	var withProj = $(this).data("button-value");
    	
    	//调用执行页面跳转的方法
    	user.getUserProj(withProj);
        //console.log();
    });  

  //头部样式的点击切换方法
    $('[data-page-button="user-proj-second-type"]').on("click",function(){
    	//清除原有的选中样式
        $(this).parents(".top").first().find('[data-page-button="user-proj-second-type"]').each(function(index,ele){
            $(ele).removeClass('checked');
        });
        //给当前加入新的选中样式
        $(this).addClass('checked');
        
        //设置当前选项下的相关数据类型
        user.setReasonAndType(this);
        //发起ajax请求,获取相关类型的数据并完成填充
        user.refreshUserProj();
    });
    
    //展开修改昵称的输入框
    $(document).on('click','[data-open-input="open"]',function(){
        var hideBoxId = $(this).data('mapping-id');
        $("#"+hideBoxId).removeClass('hide');
        
        var val = $("#user_nickname_show").text();
        $("#user_nickname_hide_value").val(val);
    });
    //关闭修改昵称的输入框
    $(document).on('click','[data-open-input="close"]',function(){
        var val = $("#user_nickname_hide_value").val();
        console.log(val);
        if(val==undefined||val==''){
            imessenger.error("昵称不能为空");
        }else{
            user.chengeNickName();
        }
    });
    
  //图片添加框的点击事件
    $(document).on('click', '#photo_img_a', function() {
//        //获取其对应的显示域的id
//        var mappingIdShow = $(this).data('mapping-id-show');
//        //获取其提交域的id
//        var mappingId = $(this).data('mapping-id');
//
//        create.changeImgShow = mappingIdShow; //把显示域图片id写到全局
//        create.changeImg = mappingId; //把提交域输入框id写到全局
//
//        console.log(create.changeImg);
//        console.log(create.changeImgShow);
//        //        console.log(mappingId);
    	console.log("aaaaa");
    	document.getElementById("upload_img").click(); //触发公用的图片选择框
    });

    //图片主体输入框发生变动的事件
    $(document).on('change', '#upload_img', function() {
        //        var mappingId = $(this).data('mapping-id');
        //        console.log(mappingId);
        //        $("#upload_img").click();
        //        console.log("change");
//        console.log(create.changeImg);
//        console.log(create.changeImgShow);
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
    			$("#photo_img_a").html('<img class="intr-news-img-img" src="'+url+'" alt="">');
    			//把获取到的上传后的路径写到输入框
//    			$("#" + create.changeImg).val(url);
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
    			chengePhoto(url);
    		},
    		error : function(data, status, e) {// 服务器响应失败处理函数
//    			alert(e);
//    			console.log(e);
    			console.log("error");
    		}
    	});
        
        function chengePhoto(url){
        	$.ajax({
    		//      url : '/project/list',
    		      url : '/user/chengePhoto',
    		      dataType:'json',
    		      type : 'POST',
    		      data : {
    				photo: url
    		      },
    		      async : false,
    		      // - cache: false,
    		      // - contentType: false,
    		      // - processData: false,
    		      success : function(data) {	    	  
    		    	  console.log(data);
    		           cb(data);
    		      },
    		      error : function() {
    		          console.log('用户删除角色出错');
    		      }
    		  });
        	
        	function cb(data){
        		console.log(data);
        	}
        }
        
    });
});

user.chengeNickName = function(){
    var nickName = $("#user_nickname_hide_value").val();
    $.ajax({
	//      url : '/project/list',
	      url : '/user/chengeNickName',
	      dataType:'json',
	      type : 'POST',
	      data : {
			nickName: nickName
	      },
	      async : false,
	      // - cache: false,
	      // - contentType: false,
	      // - processData: false,
	      success : function(data) {	    	  
	    	  console.log(data);
	           cb(data);
	      },
	      error : function() {
	          console.log('用户删除角色出错');
	      }
	  });
    function cb(data){
        if(data.code==200&&data.data==1){
            $("#user_nickname_hide_box").addClass("hide");
			$("#user_nickname_show").text(nickName);
        }else{
            imessenger.error('修改昵称出错');
        }
    }
//    $("#user_nickname_hide_box").addClass("hide");
};

user.setReasonAndType = function(ele){
	//获取当前页面的项目和当前用户是什么关系
	var reasonWithLoged = $("#hide_reason_value").val();
	//获取项目的类型
	var pageVal = $(ele).data("button-value");
	
	console.log("reasonWithLoged:"+reasonWithLoged);
	console.log("pageVal:"+pageVal);
	
	user.reason = 0;//和项目的关系 1.表示自己发起的项目,2.表示支持(购买)的项目
	user.hasCollect = 0;//是否收藏 1.表示已收藏,2表示未收藏
	user.state = 0;//项目状态1.保存,2.待审核,3.审核通过,4.审核未通过,
	user.type = 0;//项目众筹状态--1.众筹进行中,2.众筹成功,3.众筹失败
	
	user.keepState = 0;
	user.keepType = 0;
	
//        console.log(reason);
	switch (reasonWithLoged) {
	//我发起的
	case "1":
		user.reason = 1;
		break;
		//我支持的
	case "2":
		user.reason = 2;
		break;
		//我收藏的
	case "3":
		user.hasCollect = 1;
		break;
	default:
		break;
	}
	
	//项目状态
	switch (pageVal) {
	//审核中 或者 审核失败
	case "checking":
		user.state = 2;	
		user.keepState = 4;
		break;
		//众筹中
	case "collecting":
		user.state = 3;
		user.type = 1;
		break;
		//已结束
	case "ended":
		//注意,这里需要特殊处理state有可能为4
		user.state = 3;
		
		//众筹成功 或者 众筹失败
		user.type = 2;
		user.keepType = 3;
	
		break;
		//已保存
	case "saved":
		user.state = 1;
		break;
		//成功
	case "seccess":
		user.state = 3;
		user.type = 2;
		break;
		//失败
	case "fail":
		user.state = 3;
		user.type = 3;
		break;
	default:
		break;
	}
};

user.refreshUserProj = function(){
//	user.reason = 0;//和项目的关系 1.表示自己发起的项目,2.表示支持(购买)的项目
//	user.hasCollect = 0;//是否收藏 1.表示已收藏,2表示未收藏
//	user.state = 0;//项目状态1.保存,2.待审核,3.审核通过,4.审核未通过,
//	user.type = 0;//项目众筹状态--1.众筹进行中,2.众筹成功,3.众筹失败
	
//	reason: user.reason,
//	hasCollect:user.hasCollect,
//  	state:user.state,
//  	keepState:user.keepState,
//  	type:user.type,
//  	keepType:user.keepType
	
//  console.log("user.reason:"+user.reason);
//	console.log("user.hasCollect:"+user.hasCollect);
//	console.log("user.state:"+user.state);
//	console.log("user.keepState:"+user.keepState);
//	console.log("user.type:"+user.type);
//	console.log("user.keepType:"+user.keepType);
	
	$.ajax({
	//      url : '/project/list',
	      url : '/user/listProjJson',
	      dataType:'json',
	      type : 'GET',
	      data : {
			reason: user.reason,
			hasCollect:user.hasCollect,
	      	state:user.state,
	      	keepState:user.keepState,
	      	type:user.type,
	      	keepType:user.keepType
	      },
	      async : false,
	      // - cache: false,
	      // - contentType: false,
	      // - processData: false,
	      success : function(data) {	    	  
	    	  console.log(data+"----------------------");
	           cb(data);
	      },
	      error : function() {
	          console.log('用户删除角色出错');
	      }
	  });
	
	function cb(data){
		var projHtml = '';		
		
		if(data.code==200&&data.data==1){
		
			//获取项目的列表数据(json格式)
			var projList = data.msg;			
			//循环所有数据
            for(var i = 0;i<projList.length;i++){
            	//alert("++++++++++++进入到循环体++++++++");
            	
            	//获取其中一个数据
                var proj = projList[i];
                
                var flag='审核不过';
                if(proj.state!=4){
                	flag='剩余'+
                    '<a href="/proj/info?projId='+proj.projectId+'&userId='+proj.userId+'">'+//剩余天数		                       
                    	(30 -proj.day)+		                    	
                    '</a>'+
                    '天';
                }

                var projBox = '<div class="project-box">'+
		                '<div class="proj-top">'+
		                '<div style="background-image: url(\''+proj.photo +'\');" class="proj-user-photo">'+//用户
		                    
		                '</div>'+
		                '<div class="proj-user-name">'+
		                proj.nickname +//用户昵称
		                '</div>'+
		                '<div class="proj-user-create-time">'+
		                 proj.day +'天前'+//开始时间
		                '</div>'+
		                '<div class="proj-user-over-time">'+		                    
		                    flag+
		                '</div>'+
		            '</div>'+
		            '<div class="proj-title">'+
		               '<a href="/proj/info?projId='+proj.projectId+'&userId='+proj.userId+'">'+
		                	proj.name +//项目标题
		               '</a>'+
		            '</div>'+
		            '<div class="proj-bottom-box">'+
		            	'<a class="font-default-color" href="/proj/info?projId='+proj.projectId+'&userId='+proj.userId+'">'+
		                   '<div class="row">'+
		                        '<div class="col-xs-4 proj-bottom-item">'+
		                            '目标'+
		                            '<span class="font-base-color">'+
		                            	proj.targetMoney +//目标金额
		                            '</span>'+
		                            '元'+
		                        '</div>'+
		                        '<div class="col-xs-4 proj-bottom-item">'+
		                            '已筹'+
		                            '<span class="font-base-color">'+
		                            	proj.finishMoney +//完成金额
		                            '</span>'+
		                            '元'+
		                        '</div>'+
		                        '<div class="col-xs-4 proj-bottom-item">'+
		                            '剩余'+
		                            '<span class="font-base-color">'+
		                            	(proj.targetMoney-proj.finishMoney)/proj.unitPrice +//剩余份数
		                            '</span>'+
		                            '份'+
		                        '</div>'+
		                   '</div>'+
		                 '</a>'+
		            '</div>'+
		        '</div>';
                projHtml = projHtml+projBox;
            }
            $("#project_cont").html(projHtml);
		}
	}
};


user.getUserProj = function(withProj){
	var reason = 0;//和项目的关系 1.表示自己发起的项目,2.表示支持(购买)的项目
	var hasCollect = 0;//是否收藏 1.表示已收藏,2表示未收藏
	var state = 0;//项目状态1.保存,2.待审核,3.审核通过,4.审核未通过,
	var type = 0;//项目众筹状态--1.众筹进行中,2.众筹成功,3.众筹失败
	var keepState=0;//第二种情况
	switch (withProj) {
		//点击我支持的
		case "support":
			reason = 2;
			//state = 3;
			type = 1;
			break;
		//点击我发起的
		case "start":
			reason = 1;
			state = 2;
			keepState=4;
			break;
		//点击我收藏的
		case "collect":
			hasCollect = 1;
			type = 1;
			break;
	
		default:
			break;
	}
	
	var url = "/user/proj?reason="+reason+"&hasCollect="+hasCollect+"&state="+state+"&keepState="+keepState+"&type="+type;
	console.log(url);
	document.getElementById("hide_goto_user_proj").href = url;
	document.getElementById("hide_goto_user_proj").click();
//	$("#hide_goto_user_proj")
};


//<div id="get_cash_box" class="page-input-cont hide">
//    <div class="page-input-box">
//        <input id="get_cash_value" class="page-input-box-cont" placeholder='请输入提现金额' type="text" />
//    </div>
//    <div class="page-input-button">
//        <a data-open-input="close" data-mapping-id="get_cash_box" href="javascript:void(0)" class="input-button">完成</a>
//    </div>
//</div>
user.openGetCashBox = function(){
    $("#get_cash_box").removeClass('hide');
    
    var balance = $("#balance_value").val();
//    
    $("#get_cash_box").attr('placeholder','最多可提现'+balance+'元');
    
};

user.getCash = function(ele){
    $(ele).addClass("hide");
    var balance = parseInt($("#balance_value").val());
    
    var wantGet = parseInt($("#get_cash_value").val());
    if(wantGet==undefined||wantGet==''||isNaN(wantGet)){
        imessenger.success("取消申请");
        $("#get_cash_box").addClass('hide');
    }else if(balance==undefined||balance==''||isNaN(balance)){
        imessenger.error("余额信息有误,请刷新页面");
        $("#get_cash_box").addClass('hide');
    }else if(wantGet>balance){
        imessenger.error("最多可提现"+balance+"元");
        $(ele).removeClass("hide");
    }else{
        $.ajax({
	//      url : '/project/list',
	      url : '/cash/getCash',
	      dataType:'json',
	      type : 'POST',
	      data : {
			wantGet: wantGet
	      },
	      async : false,
	      // - cache: false,
	      // - contentType: false,
	      // - processData: false,
	      success : function(data) {	    	  
//	    	  console.log(data);
	           cb(data);
	      },
	      error : function() {
              imessenger.error("系统出错");
	      }
	  });
        function cb(data){
            if(data.code==200&&data.data==1){
                imessenger.success("提现申请成功");
                setTimeout('$("#get_cash_box").addClass(\'hide\');', 2000);
            }else{
                imessenger.error(data.msg);
            }
        }
//        imessenger.success("提现申请成功");
//        $("#get_cash_box").addClass('hide');
        //setTimeout('$("#get_cash_box").addClass(\'hide\');', 2000);
    }
};
