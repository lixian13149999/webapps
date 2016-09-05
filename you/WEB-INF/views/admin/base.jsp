<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>友筹后台管理系统</title>

    <!--    bootstrap框架的样式-->
    <link href="/public/lib/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
    <!--    bootstrap时间选择器插件的样式-->
    <link href="/public/lib/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css">
    <!--    bootstrap中button的样式-->
    <link href="/public/lib/button/buttons.css" rel="stylesheet" type="text/css">

    <!--    提示框的样式文件-->
    <link href="/public/lib/messenger/css/messenger.css" rel="stylesheet" type="text/css">
    <link href="/public/lib/messenger/css/messenger-theme-air.css" rel="stylesheet" type="text/css">

    <!--    阿里不图标的css文件引入-->
    <link href="/public/admin/iconfont/iconfont.css" rel="stylesheet" type="text/css">

    <!--    base页面的样式-->
    <link href="/public/admin/css/base.css" rel="stylesheet" type="text/css">

</head>

<body>
    <!--   头部样式开始-->
    <div class="top">
        <div class="top-container col-md-11">
            <div class="logo">
                <a href="javascript:void(0)" class="logo-a">
                    <i class="icon icon-logo1 logo-i"></i>
                    友筹后台管理系统
                </a>
            </div>
            <!-- <div class="users">
                <div class="top-user-lable">
                    <p>用户名:</p>
                    <p>登陆时间:</p>
                </div>
                <div class="top-user-info">
                    <p class="user-name">张铁锤</p>
                    <p class="login-time">
                        2016-04-28 32:12:12
                    </p>
                </div>
            </div> -->
        </div>
    </div>
    <!--    =============== top end ===============-->

    <!--    中间部分样式开始-->
    <div class="body col-md-11">
        <!--       中间,左侧菜单样式-->
        <div class="menus col-md-2">
            <dl class="items">
                <dd class="item">
                    <a href="javascript:void(0)" class="item-a checked-menu" data-refresh-page="">
<!--                        <i class="icon icon-xiaoshou item-icon"></i>-->
                        用户管理
                    </a>
                </dd>
                <dd class="item">
                    <a href="javascript:void(0)" onclick="fUserList(1,10)" class="item-a item-second" data-refresh-page="user_created">
<!--                        <i class="icon icon-xiaoshou item-icon"></i>-->
                        发起过众筹
                    </a>
                </dd>
                <dd class="item">
                    <a href="javascript:void(0)" onclick="zUserList(1,10)" class="item-a item-second" data-refresh-page="user_buyed">
                        支持过众筹
                    </a>
                </dd>
                
                <dd class="item">
                    <a href="javascript:void(0)"  class="item-a" data-refresh-page="">
<!--                        <i class="icon icon-yeji item-icon"></i>-->
                        举报列表
                    </a>
                </dd>
                <dd class="item">
                    <a id="base_jubaoshenhe_a" href="javascript:void(0)" onclick="reportMsgList(1,10)" class="item-a item-second" data-refresh-page="report">
<!--                        <i class="icon icon-juese item-icon"></i>-->
                        举报审核
                    </a>
                </dd>
                
                <dd class="item">
                    <a href="javascript:void(0)" class="item-a" data-refresh-page="ticheng">
<!--                        <i class="icon icon-ticheng item-icon"></i>-->
                        提现管理
                    </a>
                </dd>
                <dd class="item">
                    <a href="javascript:void(0)" onclick="cashApplyToApprove(1,10)" class="item-a item-second" data-refresh-page="lizhi">
<!--                        <i class="icon icon-xiugai item-icon"></i>-->
                        待审核申请
                    </a>
                </dd>
                <dd class="item">
                    <a href="javascript:void(0)" onclick="cashApplyToConfirm(1,10)" class="item-a item-second" data-refresh-page="lizhi">
<!--                        <i class="icon icon-xiugai item-icon"></i>-->
                        待确认申请
                    </a>
                </dd>
                <dd class="item">
                    <a href="javascript:void(0)" onclick="finishedCashApply(1,10)" class="item-a item-second" data-refresh-page="lizhi">
<!--                        <i class="icon icon-xiugai item-icon"></i>-->
                        已完成提现
                    </a>
                </dd>
                
                <dd class="item">
                    <a href="javascript:void(0)" class="item-a" data-refresh-page="">
<!--                        <i class="icon icon-kehu item-icon"></i>-->
                        项目审核
                    </a>
                </dd>
                <dd class="item">
                    <a href="javascript:void(0)" onclick="examineProjList(1,10)" class="item-a item-second" data-refresh-page="lizhi">
<!--                        <i class="icon icon-xiugai item-icon"></i>-->
                        待审核项目
                    </a>
                </dd>
                  <dd class="item">
                    <a href="javascript:void(0)" onclick="notPassProjList(1,10)" class="item-a item-second" data-refresh-page="lizhi">
<!--                        <i class="icon icon-xiugai item-icon"></i>-->
                       审核不通过
                    </a>
                </dd>
                
                <dd class="item">
                    <a href="javascript:void(0)" class="item-a" data-refresh-page="">
<!--                        <i class="icon icon-kehu item-icon"></i>-->
                        项目管理
                    </a>
                </dd>
      <!--           <dd class="item">
                    <a href="javascript:void(0)" class="item-a item-second" data-refresh-page="lizhi">
                       <i class="icon icon-xiugai item-icon"></i>
                        项目详情
                    </a>
                </dd> -->
                <dd class="item">
                    <a href="javascript:void(0)" onclick="recommendProjList(1,10)" class="item-a item-second" data-refresh-page="lizhi">
<!--                        <i class="icon icon-xiugai item-icon"></i>-->
                        主推项目
                    </a>
                </dd>
                <dd class="item">
                    <a href="javascript:void(0)" onclick="finishedProjList(1,10)" class="item-a item-second" data-refresh-page="lizhi">
<!--                        <i class="icon icon-xiugai item-icon"></i>-->
                        已完成项目
                    </a>
                </dd>
                
                      <dd class="item">
                    <a href="javascript:void(0)" onclick="failedProjList(1,10)" class="item-a item-second" data-refresh-page="lizhi">
<!--                        <i class="icon icon-xiugai item-icon"></i>-->
                        众筹失败项目
                    </a>
                </dd>
                <dd class="item">
                    <a href="javascript:void(0)" onclick="ongoingProjList(1,10)" class="item-a item-second" data-refresh-page="lizhi">
<!--                        <i class="icon icon-xiugai item-icon"></i>-->
                        进行中项目
                    </a> 
                </dd>
            </dl>
        </div>
        <!--        =============== menus end ===============-->

        <!--        中间右侧主显示区域样式开始-->
        <div class="main col-md-10" id="main">
            <div class="main-container" data-form-valid="valid" id="main-container">                       
                
            </div>
        </div>
        <!--        =============== main end ===============-->
    </div>
    <!--    =============== body end ===============-->
    <!--    底部样式开始-->
    <div class="bottom col-md-12"></div>
    <!--删除确认模态框开始-->
    <div class="modal fade bs-example-modal-sm" id="modal_confirm_remove" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">确认框</h4>
                </div>
                <div class="modal-body">
                    <!-- 填写信息的块状输入 +++++++开始-->
                    <div class="row form-input-box">
                        <div class="col-md-12 remove-lable-box">
                            <lable data-remove-confirm="modal-text" class="input-lable">您是否确定删除XXXX</lable>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="button button-primary button-small modal-button" data-confirm-modal-button="false">取消</button>
                    <button type="button" class="button button-caution button-small modal-button" data-confirm-modal-button="true">确定</button>
                </div>
            </div>
        </div>
    </div>
    <!--*************删除确认模态框开始*************-->



    <!--    jquery框架js文件引入-->
    <script type="text/javascript" src="/public/lib/jquery/jquery.min.js"></script>
    <!--    bootstrap框架js文件引入-->
    <script type="text/javascript" src="/public/lib/bootstrap/bootstrap.min.js"></script>

    <!--    警告框的js文件-->
    <script type="text/javascript" src="/public/lib/messenger/js/messenger.min.js"></script>
    <script type="text/javascript" src="/public/js/util/imessenger.js"></script>

    <!--    删除模态框的激活js-->
    <script type="text/javascript" src="/public/js/util/ibootbox.js"></script>

    <!--    表单验证的插件-->
<!--    <script type="text/javascript" src="../lib/jquery_validation/jquery.validate.min.js"></script>-->
<!--    <script type="text/javascript" src="../lib/jquery_validation/localization/messages_zh.min.js"></script>-->

    <!--    基于bootstrap对弹出框,确认对话框的重写-->
    <!--    主页面或全局中交互的js文件引入-->
    <script type="text/javascript" src="/public/admin/js/base.js"></script>

 <script type="text/javascript">
    
     function fUserList(pageIndex,pageSize) {//发起项目的用户
    	
			$.ajax({
				url : '/admin/getFuserList',
				type : 'POST',
				//dataType : 'html',
				data:{
					pageIndex:pageIndex,
					pageSize:pageSize
				},
				success : function(data) {
					//加载页面
					$("#main-container").html(data);
				},
				error : function(data) {
					alert("出错了!");
				},
			});
		}
		
		function zUserList(pageIndex,pageSize) {//支持项目的用户
    	
			$.ajax({
				url : '/admin/getZuserList',
				type : 'POST',
				data:{
					pageIndex:pageIndex,
					pageSize:pageSize
				},
				//dataType : 'html',
				success : function(data) {
					//加载页面
					$("#main-container").html(data);
				},
				error : function(data) {
					alert("出错了!");
				},
			});
						
		}
		
		function reportMsgList(pageIndex,pageSize) {//获取未读的投诉消息
    	
			$.ajax({
				url : '/admin/getReportMsgList',
				type : 'POST',
				data:{
					pageIndex:pageIndex,
					pageSize:pageSize
				},
				//dataType : 'html',
				success : function(data) {
					console.log(data);
					//加载页面
					$("#main-container").html(data);
				},
				error : function(data) {
					alert("出错了!");
				},
			});
		}
			
			
		function examineProjList(pageIndex,pageSize) {//项目审核：待审核的项目
   	
			$.ajax({
				url : '/admin/getExamineProjList',
				type : 'POST',
				//dataType : 'html',
				data:{
					pageIndex:pageIndex,
					pageSize:pageSize
				},
				success : function(data) {
					//加载页面
					$("#main-container").html(data);
				},
				error : function(data) {
					alert("出错了!");
				},
			});
		}
			
			//********************************************************
			function recommendProjList(pageIndex,pageSize) {//项目管理：主推项目
		
    	
				$.ajax({
					url : '/admin/getRecommendProjList',
					type : 'POST',
					//dataType : 'html',
					data:{
						pageIndex:pageIndex,
						pageSize:pageSize
					},
					success : function(data) {
						//加载页面
						$("#main-container").html(data);
					},
					error : function(data) {
						alert("出错了!");
					},
				});
			}
			function finishedProjList(pageIndex,pageSize) {//项目管理:已完成的项目finishedProjList
    	
				$.ajax({
					url : '/admin/getFinishedProjList',
					type : 'POST',
					data:{
						pageIndex:pageIndex,
						pageSize:pageSize
					},
					//dataType : 'html',
					success : function(data) {
						//加载页面
						$("#main-container").html(data);
					},
					error : function(data) {
						alert("出错了!");
					},
				});
			}
			function ongoingProjList(pageIndex,pageSize) {//项目管理：正在进行中的项目
			//alert("ongoing -----------------");
    	
				$.ajax({
					url : '/admin/getOngoingProjList',
					type : 'POST',
					data:{
						pageIndex:pageIndex,
						pageSize:pageSize
					},
					//dataType : 'html',
					success : function(data) {
					
					//alert("这个方法运行正常=-");
						//加载页面
						$("#main-container").html(data);
					},
					error : function(data) {
						alert("出错了!");
					},
				});
			}			
			//*******************************************************			
			function notPassProjList(pageIndex,pageSize) {//项目审核：审核不通过的项目
			//alert("ongoing -----------------");
    	
				$.ajax({
					url : '/admin/getNotPassProjList',
					type : 'POST',
					data:{
						pageIndex:pageIndex,
						pageSize:pageSize
					},
					//dataType : 'html',
					success : function(data) {
					
					//alert("这个方法运行正常=-");
						//加载页面
						$("#main-container").html(data);
					},
					error : function(data) {
						alert("出错了!");
					},
				});
			}			
			//*******************************************************
			function failedProjList(pageIndex,pageSize) {//项目审核：众筹失败的项目
			//alert("ongoing -----------------");
    	
				$.ajax({
					url : '/admin/getFailedProjList',
					type : 'POST',
					data:{
						pageIndex:pageIndex,
						pageSize:pageSize
					},
					//dataType : 'html',
					success : function(data) {
					
					//alert("这个方法运行正常=-");
						//加载页面
						$("#main-container").html(data);
					},
					error : function(data) {
						alert("出错了!");
					},
				});
			}			
			//*******************************************************
			
			function getProjInfo(id,flag) {//加载项目详情页面   flag 传递点击的是何种项目的标志	
				$.ajax({
					url : '/admin/projInfo?projId='+id+'&flag='+flag,
					type : 'POST',
					//dataType : 'html',
					success : function(data) {
					
					//alert("这个方法运行正常=-");
						//加载页面
						$("#main-container").html(data);
					},
					error : function(data) {
						alert("出错了!");
					},
				});
			}
			//***********************设置审核通过、不通过和主推、取消主推（开始）***********************************************************		
		   function pass(id) {//加载项目详情页面   flag 传递点击的是何种项目的标志	
				$.ajax({
					url : '/admin/projPass?projId='+id,
					type : 'POST',
					//dataType : 'html',
					success : function(data) {
					
					 alert(data.msg);
						//加载页面
						//$("#main-container").html(data);
					},
					error : function(data) {
						alert("出错了!");
					},
				});
			}
		   function noPass(id) {//加载项目详情页面   flag 传递点击的是何种项目的标志	
				$.ajax({
					url : '/admin/projNoPass?projId='+id,
					type : 'POST',
					//dataType : 'html',
					success : function(data) {
					
					 alert(data.msg);
						//加载页面
					//	$("#main-container").html(data);
					},
					error : function(data) {
						alert("出错了!");
					},
				});
			}		   
		   function recommend(id) {//把项目设置为主推项目
				$.ajax({
					url : '/admin/projRecommend?projId='+id,
					type : 'POST',
					//dataType : 'html',
					success : function(data) {
					 alert(data.msg);
						//加载页面
						//$("#main-container").html(data);
					},
					error : function(data) {
						alert("出错了!");
					},
				});
			}		   
			
			
			 function cancelRecommend(id) {//把项目设置为主推项目
				$.ajax({
					url : '/admin/projCancelRecommend?projId='+id,
					type : 'POST',
					//dataType : 'html',
					success : function(data) {
					 alert(data.msg);
						//加载页面
						//$("#main-container").html(data);
					},
					error : function(data) {
						alert("出错了!");
					},
				});
			}		   
		    //***********************设置审核通过、不通过和主推（结束）***********************************************************	
		    //*******************************处理提现申请***********************************	
		    function cashApplyToApprove(pageIndex,pageSize) {//显示没有批准的提现申请	
				$.ajax({
					url : '/admin/getCashApplyToApprove',
					type : 'POST',
					data:{
						pageIndex:pageIndex,
						pageSize:pageSize
					},
					//dataType : 'html',
					success : function(data) {
									
						$("#main-container").html(data);
					},
					error : function(data) {
						alert("出错了!");
					},
				});
			}		   
			function cashApplyToConfirm(pageIndex,pageSize) {//加载项目详情页面   flag 传递点击的是何种项目的标志	
				$.ajax({
					url : '/admin/getCashApplyToConfirm',
					type : 'POST',
					data:{
						pageIndex:pageIndex,
						pageSize:pageSize
					},
					//dataType : 'html',
					success : function(data) {
				
						//加载页面
					  $("#main-container").html(data);
					},
					error : function(data) {
						alert("出错了!");
					},
				});
			}		   
			function finishedCashApply(pageIndex,pageSize) {//加载项目详情页面   flag 传递点击的是何种项目的标志	
				$.ajax({
					url : '/admin/getFinishedCashApply',
					type : 'POST',
					data:{
						pageIndex:pageIndex,
						pageSize:pageSize
					},
					//dataType : 'html',
					success : function(data) {
					 
						//加载页面
						$("#main-container").html(data);
					},
					error : function(data) {
						alert("出错了!");
					},
				});
			}		   
		    
		    
		
		</script>
</body>

</html>