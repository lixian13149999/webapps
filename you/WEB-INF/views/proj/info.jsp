<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html lang="en">

<head>
    <!--   设置编码-->
    <!--    使页面在手机访问的时候自适应-->
    <meta name="viewport" content="initial-scale=1, user-scalable=0, minimal-ui">

    <title>详情页面</title>
    <!--    页面的标签栏处的小图标-->
    <link rel='shortcut icon' href='/public/imgs/logo32.png'>

    <!--    bootstrap基础样式引入-->
    <link rel="stylesheet" type="text/css" href="/public/lib/bootstrap/bootstrap.min.css">
    <!--    button样式引入-->
    <link rel="stylesheet" type="text/css" href="/public/lib/button/buttons.css">
    <!--    警告提示框的样式文件-->
    <link rel="stylesheet" type="text/css" href="/public/lib/messenger/css/messenger.css">
    <link rel="stylesheet" type="text/css" href="/public/lib/messenger/css/messenger-theme-air.css">
    <!--    字体标签库引入-->
    <link rel="stylesheet" type="text/css" href="/public/lib/iconfont/iconfont.css">

    <!--   自定义样式总和引入-->
    <link rel="stylesheet" type="text/css" href="/public/css/index.css">

</head>

<body>

<input id="hide_page_data_user_id" type="text" value="${userProject.userId }" class="hide" />
<input id="hide_page_data_project_id" type="text" value="${userProject.projectId }" class="hide" />
<!-- 设置当前系统时间戳 -->
    
    <div class="primary row">
        <div class="project-box">
            <div class="proj-top">
                <div style="background-image: url('${userProject.photo}');" class="proj-user-photo">

                </div>
                <div class="proj-user-name">
                        ${userProject.nickname}
                </div>
                <div class="proj-user-create-time">
                
                
             ${userProject.day}
               
                天前
                </div>
                <div class="proj-user-over-time">
                    剩余
                    <a href="javascript:void(0)"><fmt:parseNumber value="${30-userProject.day }" type="number" integerOnly="true" ></fmt:parseNumber>
</a>
                    天
                </div>
            </div>
            <div class="proj-title">
               <a id="proj_title_id">${userProject.name }</a>
            </div>
            
            <div class="proj-bottom-box">
                  <a class="font-default-color" href="javascript:void(0)">
                      
                       <div class="row">
                            <div class="col-xs-4 proj-bottom-item">
                                目标
                                <span class="font-base-color"> ${userProject.targetMoney }</span>
<!--                                <a href="javascript:void(0)">12345</a>-->
                                元
                            </div>
                            <div class="col-xs-4 proj-bottom-item">
                                已筹
                                <span class="font-base-color"> ${userProject.finishMoney } </span>
<!--                                <a href="javascript:void(0)">123142</a>-->
                                元
                            </div>
                            <div class="col-xs-4 proj-bottom-item">
                                剩余
                                <span class="font-base-color">
									  <fmt:parseNumber value="${(userProject.targetMoney-userProject.finishMoney)/userProject.unitPrice }" integerOnly="true"></fmt:parseNumber>
                                </span>
<!--                                <a href="javascript:void(0)">100</a>-->
                                份
                            </div>
                       </div>
                  </a>
                </div>
                
           	<!-- 项目大图 -->
            <div class="proj-img">
            	<a id="proj_imgs_id" data-back-img="open" data-back-img-mapping="back_img_box" href="javascript:void(0)">
					<c:forEach begin="0" end="3" var="url" items="${userProject.a_desImg}">
						<img class="proj-img-item" src="${url}" alt="">
					</c:forEach>
				</a>
			</div>
            <div class="proj-info">
                <a id="proj_desc_id" href="javascript:void(0)">${userProject.projDescribe }</a>
            </div>
        </div>
        
        <div class="primary-box">
            <div class="title-box">
                <a href="javascript:void(0)">关于创始人</a>
            </div>
            <div class="proj-img">
                 <!-- <div class="proj-img"> -->
                 
					<c:forEach  var="url" items="${userProject.a_founderImg}">
						<img class="proj-img-item" src="${url}" alt="">
					</c:forEach>
			<!-- </div> -->
            </div>
            <div class="proj-info">
                <a href="javascript:void(0)">
  ${userProject.founderDes }
                  
                </a>
            </div>
        </div>
        
        <div class="primary-box">
            <div class="title-box">
                <a href="javascript:void(0)">回报说明</a>
            </div>
            <div class="info-box">
             ${userProject.repayExplain }
      <!-- 回报说明 -->
            </div>
        </div>
        
        <div class="primary-box">
            <div class="title-box">
                <a href="javascript:void(0)">注意事项</a>
            </div>
            <div class="info-box">
             ${userProject.warning }
          <!-- 注意事项  -->
            </div>
        </div>
        
        <div class="primary-box">
            <div class="title-box">
                <a href="javascript:void(0)">创始人二维码</a>
            </div>
            <div class="info-box">
                <div class="proj-img">
                
                <img class="info-img-two-dimen-code" src=" ${userProject.wechatDimen }" alt="">
                </div>
            </div>
        </div>
    </div>
    <c:if test="${userProject.reason==1}">
	    <div class="bottom-info-self bottom-box container-fluid">
	       <div class="row bottom-button-box">
	            <a data-page-button="bottom" data-page-button-todo="supporter" href="/proj/supporter?projId=${userProject.projectId }" class="bottom-icon-box col-xs-12">
	                <i class="icon icon-supporter bottom-icon-i"></i>
	                <label for="" class="bottom-icon-label">支持者</label>
	            </a>
	            <!-- 
	            <a data-page-button="bottom" data-page-button-todo="share" href="javascript:void(0)" class="bottom-icon-box col-xs-6">
	                <i class="icon icon-share bottom-icon-i"></i>
	                <label for="" class="bottom-icon-label">分享</label>
	            </a> -->
	       </div>
	    </div>
    </c:if>
    <c:if test="${userProject.reason!=1}">
	    <div class="bottom-info bottom-box container-fluid">
	       <div class="row bottom-button-box">
	
	            <a data-page-button="bottom" data-page-button-todo="complain" href="javascript:void(0)" class="bottom-icon-box icol-xs-3">
	                <i class="icon icon-warning bottom-icon-i"></i>
	                <label for="" class="bottom-icon-label">投诉</label>
	            </a>
	            <!-- <a data-page-button="bottom" data-page-button-todo="share" href="javascript:void(0)" class="bottom-icon-box icol-xs-2 checked">
	                <i class="icon icon-share bottom-icon-i"></i>
	                <label for="" class="bottom-icon-label">分享</label>
	            </a> -->
		        <c:if test="${userProject.hasCollect==1 }">
		            <a data-page-button="bottom" data-page-button-todo="unCollect" href="javascript:void(0)" class="bottom-icon-box icol-xs-3 checked">
			                <i class="icon icon-collected bottom-icon-i"></i>
			                <label for="" class="bottom-icon-label">已收藏</label>
		            </a>
		        </c:if>
		        <c:if test="${userProject.hasCollect!=1 }">
		        	<a data-page-button="bottom" data-page-button-todo="collect" href="javascript:void(0)" class="bottom-icon-box icol-xs-3 checked">
		                <i class="icon icon-collect bottom-icon-i"></i>
		                <label for="" class="bottom-icon-label">收藏</label>
		            </a>
		        </c:if>
		        <c:if test="${userProject.type==1}">
		            <a data-page-button="bottom" data-page-button-todo="support" href="/proj/buy?projId=${userProject.projectId}" class="bottom-icon-box icol-xs-4 bottom-buttom-a-item">
		                去支持
		            </a>
		        </c:if>
		        <c:if test="${userProject.type!=1}">
		            <a href="javascript:void(0)" class="bottom-icon-box icol-xs-4" style="line-height: 45px;background-color: #ccc;">
		                已结束
		            </a>
		        </c:if>
	       </div>
	    </div>
    </c:if>
    
	<div id="back_img_box" class="background-cont hide">
<!--        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">-->
        <div id="carousel-example-generic" class="carousel slide">
          <!-- Indicators -->
          <ol class="carousel-indicators">
          	<c:forEach  var="url" items="${userProject.a_desImg}" varStatus="urls">
           		<li data-target="#carousel-example-generic" data-slide-to="${urls.index}" class="${urls.index==0?'active':''}"></li>
            </c:forEach>
          </ol>

          <!-- Wrapper for slides -->
          <div class="carousel-inner" role="listbox">
          		<c:forEach  var="url" items="${userProject.a_desImg}" varStatus="urls">
          			<a data-back-img="close" data-back-img-mapping="back_img_box" class="item ${urls.index==0?'active':''}" href="javascript:void(0)">
						<img class="proj-img-item" src="${url}" alt="">
					</a>
				</c:forEach>
          </div>

          <!-- Controls -->
          <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
        
    </div>
    
    <!--投诉输入框-->
    <div id="hide_proj_complain_msg" class="page-input-cont hide">
        <div class="page-input-box">
            <textarea id="hide_proj_complain_msg_value" name="" class="page-input-box-cont" rows="4" placeholder='请输入投诉信息'></textarea>
            <!-- <span class="right-bottom-corner-tip">50字</span> -->
        </div>
        <div class="page-input-button">
            <a data-open-input="close_complain" data-mapping-id="hide_proj_complain_msg" href="javascript:void(0)" class="input-button">完成</a>
        </div>
    </div>
   
    <!--jquery的js文件-->
    <script type="text/javascript" src="/public/lib/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>

    <!--    bootstrap基础文件引入-->
    <script type="text/javascript" src="/public/lib/bootstrap/bootstrap.min.js"></script>
    <!--    警告提示框的js源文件-->
    <script type="text/javascript" src="/public/lib/messenger/js/messenger.min.js"></script>
    <!--    警告提示的js文件-->
    <script type="text/javascript" src="/public/js/util/imessenger.js"></script>

    <!--    引入测试的js文件,此文件仅在开发过程中使用,真实上线时需要删除-->
        <script type='text/javascript' src="/public/js/info.js"></script>
</body>

</html>
