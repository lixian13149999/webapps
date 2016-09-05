var index = new Object();
$(function(){
    //头部样式的点击切换方法
    $('[data-page-button="proj-type"]').on("click",function(){
        $(this).parents(".top").first().find('[data-page-button="proj-type"]').each(function(index,ele){
            $(ele).removeClass('checked');
        });
        
        $(this).addClass('checked');
        
        var pageVal = $(this).data("page-value");
        

      //<input id="last_refresh_time" type="text" class="" value="123" />
      //<input id="page_number" type="text" class="" value="1" />
      //<input id="proj_type" type="text" class="" value="1" />
        index.addOrReplace = 2;
        
        if(pageVal=="doing"){
        	
        	$("#page_number").val(0);
        	$("#proj_type").val(1);
        	
        	index.refreshProj();
        }else if(pageVal == "success"){
        	
        	$("#page_number").val(0);
        	$("#proj_type").val(2);
        	
        	index.refreshProj();
        }
        console.log(pageVal);
        
    });
    
//    //    图标类型的复选框点击时效果切换
//    $(document).on('click','[data-checkbox-ibox="checkbox"]',function(){
////    	imessenger.error(checkType);
//    	
//        //获取当前的选择框状态
//        var checkType = $(this).data("checkbox-ibox-type");
//        //如果是已选中状态
//        if(checkType=="uncheck"){
//            console.log(checkType);
////            imessenger.error(checkType);
//            $(this).find('i').first().addClass("icon-checkbox-checked").removeClass("icon-checkbox");
//            $(this).data("checkbox-ibox-type","checked");
//        }else if(checkType="checked"){
//            console.log(checkType);
//            $(this).find('i').first().addClass("icon-checkbox").removeClass("icon-checkbox-checked");
//            $(this).data("checkbox-ibox-type","uncheck");
//        }
//    });
    
    //对页面滑动事件的检测
    $(window).on('scroll',function(){
//        console.log("getScrollHeight==(总高度)-->"+util.getScrollHeight());
//        console.log("getScrollTop==(滚动距离)-->"+util.getScrollTop());
//        console.log("getWindowHeight==(浏览器高度)-->"+util.getWindowHeight());
        if((util.getScrollTop()+util.getWindowHeight()+100)>util.getScrollHeight()){
        	//执行相关填充操作
        	index.addOrReplace = 1;
            index.refreshProj();
        }
    });
});

//var nextPage = parseInt($("#page_number").val())+1;//获取将要刷新的页码
//var projType = parseInt($("#proj_type").val());//获取项目类型1.众筹中,2.众筹成功


//获取新的项目信息的方法
index.refreshProj = function(){
    var thisTime = new Date().getTime();//获取当前时间毫秒数
    var lastRefreshTime = parseInt($("#last_refresh_time").val());//获取最后一次刷新的时间
    var nextPage = parseInt($("#page_number").val())+1;//获取将要刷新的页码
    var projType = parseInt($("#proj_type").val());//获取项目类型1.众筹中,2.众筹成功
    
    //如果上次刷新的时间和当前时间的时差大于2秒
    //做这个限制主要是防止消息加载的过程中,再进行刷新
    if(thisTime-lastRefreshTime>500){
//        $("#project_cont").css("padding-bottom","600px");
        //通过ajax方式获取项目的相关数据
//    	String stateString = request.getParameter("state");
//		String typeString = request.getParameter("type");
//		String pageString = request.getParameter("page");
//		String pageSizeString = request.getParameter("pageSize");
    	console.log(nextPage);
        $.ajax({
//            url : '/project/list',
            url : '/proj/listJson',
            dataType:'json',
            type : 'POST',
            data : {
            	state:3,
            	type:projType,
            	page: nextPage,
            	pageSize:10
            },
            async : false,
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
            var projHtml = '';
            
        	//如果请求值正确并且msg中有数据
        	if(data.code==200&&data.data==1&&data.msg.length>0){
                var projList = data.msg;
                for(var i = 0;i<projList.length;i++){
                    var proj = projList[i];
                    var a_desImg = projList[i].a_desImg;//项目图片是数组
                    console.log(proj);
                    
                    var projBox = '<div class="project-box">'+
                        '<div class="proj-top">'+
                            '<div style="background-image: url(\''+proj.photo+'\');" class="proj-user-photo">'+

                            '</div>'+
                            '<div class="proj-user-name">'+
                               proj.nickname+
                            '</div>'+
                            '<div class="proj-user-create-time">'+
                                proj.day+'周前'+
                            '</div>'+
                            '<div class="proj-user-over-time">'+
                                '剩余'+
                                '<a href="javascript:void(0)">'+
                                    (30-proj.day)+
                                '</a>'+
                                '天'+
                            '</div>'+
                        '</div>'+
                        '<div class="proj-title">'+
                           '<a href="/proj/info?projId='+proj.projectId+'&userId='+proj.userId+'">'+
                            	proj.name+
                           '</a>'+
                        '</div>'+
                        '<div class="proj-img">'+   
                        	'<img class="proj-img-item" src="'+a_desImg[0]+'" alt=""> '+
                            '<img class="proj-img-item" src="'+a_desImg[1]+'" alt=""> '+
                            '<img class="proj-img-item" src="'+a_desImg[2]+'" alt=""> '+                      
                            '<img class="proj-img-item" src="'+a_desImg[3]+'" alt=""> '+
                        '</div>'+
                        '<div class="proj-info">'+
                        '<a href="/proj/info?projId='+proj.projectId+'&userId='+proj.userId+'">'+

                           proj.projDescribe+
                            '</a>'+
                        '</div>'+
                        '<div class="proj-bottom-box">'+
                          '<a class="font-default-color" href="/proj/info?projId='+proj.projectId+'&userId='+proj.userId+'">'+

                               '<div class="row">'+
                                    '<div class="col-xs-4 proj-bottom-item">'+
                                        '目标'+
                                        '<span class="font-base-color">'+
                                        proj.targetMoney+
                                        '</span>'+
                                        '元'+
                                    '</div>'+
                                    '<div class="col-xs-4 proj-bottom-item">'+
                                        '已筹'+
                                        '<span class="font-base-color">'+
                                        proj.finishMoney+
                                        '</span>'+
                                        '元'+
                                    '</div>'+
                                    '<div class="col-xs-4 proj-bottom-item">'+
                                        '剩余'+
                                        '<span class="font-base-color">'+
                                        	parseInt((proj.targetMoney-proj.finishMoney)/proj.unitPrice)+
                                        '</span>'+
                                        '份'+
                                    '</div>'+
                               '</div>'+
                          '</a>'+
                        '</div>'+
                    '</div>';
                    
                    
                    
                    projHtml = projHtml+projBox;
                }
            }
            
        	if(index.addOrReplace==2){
        		$("#project_cont").html(projHtml);
        	}else if(index.addOrReplace==1){
        		$("#project_cont").append(projHtml);
        	}
        }
    
        $("#last_refresh_time").val(thisTime);//把当前时间设置成最后刷新时间
        $("#page_number").val(nextPage);//把此次刷新的页码写入页码存储
    }
}
//window.onscroll = function(){
//    console.log("getScrollHeight"+util.getScrollHeight())
//    console.log("getScrollTop"+util.getScrollTop())
//    console.log("getWindowHeight"+util.getWindowHeight())
////      if(getScrollTop() + getWindowHeight() == getScrollHeight()){
////        alert("you are in the bottom!");
////      }
//};