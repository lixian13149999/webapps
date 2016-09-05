<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

	<c:choose>  
		<c:when test="${reasonWithLogedUser==1}">
			<title>我发起的</title>
		</c:when>  
		<c:when test="${reasonWithLogedUser==2}">
			<title>我支持的</title>
		</c:when>  
		<c:when test="${reasonWithLogedUser==3}">
			<title>我收藏的</title>
		</c:when>  
	     
		<c:otherwise>
			<title>项目关系出错了</title>
		</c:otherwise>  
	</c:choose>
   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!--   设置编码-->
    <meta charset="UTF-8">
    <!--    使页面在手机访问的时候自适应-->
    <meta name="viewport" content="initial-scale=1, user-scalable=0, minimal-ui">

    <!--    页面的标签栏处的小图标-->
    <link rel='shortcut icon' href='/public/imgs/logo32.png'>

    <!--    bootstrap基础样式引入-->
    <link rel="stylesheet" type="text/css" href="/public/lib/bootstrap/bootstrap.min.css">
    <!--    button样式引入-->
    <link rel="stylesheet" type="text/css" href="/public/lib/button/buttons.css">
    <!--    字体标签库引入-->
    <link rel="stylesheet" type="text/css" href="/public/lib/iconfont/iconfont.css">

    <!--   自定义样式总和引入-->
    <link rel="stylesheet" type="text/css" href="/public/css/index.css">

  </head>
  
  <body>
  <input id="hide_reason_value" type="text" class="hide" value="${reasonWithLogedUser}" />
  
    <div class="container-fluid">

		<c:choose>  
			<c:when test="${reasonWithLogedUser==1}">
				<!-- <title>我发起的</title> -->
				<div class="top row">
		            <div class="top-title-box col-xs-3">
		            <!-- var state = 0;//项目状态1.保存,2.待审核,3.审核通过,4.审核未通过, -->
		                <a data-page-button="user-proj-second-type" data-button-value="checking" class="top-title-item ${state==2 ? 'checked' : ''}" href="javascript:void(0)">
		                    审核中
		                </a>
		            </div>
		            <div class="top-title-box col-xs-3">
		                <a data-page-button="user-proj-second-type" data-button-value="collecting" class="top-title-item" href="javascript:void(0)">
		                    众筹中
		                </a>
		            </div>
		            <div class="top-title-box col-xs-3">
		                <a data-page-button="user-proj-second-type" data-button-value="ended" class="top-title-item" href="javascript:void(0)">
		                    已结束
		                </a>
		            </div>
		            <div class="top-title-box col-xs-3">
		                <a data-page-button="user-proj-second-type" data-button-value="saved" class="top-title-item ${state==1 ? 'checked' : ''}" href="javascript:void(0)">
		                    已保存
		                </a>
		            </div>
		        </div>
			</c:when>  
			<c:when test="${reasonWithLogedUser==2}">
				<!-- <title>我支持的</title> -->
				<div class="top row">
		            <div class="top-title-box col-xs-4">
		                <a data-page-button="user-proj-second-type" data-button-value="collecting" class="top-title-item checked" href="javascript:void(0)">
		                    进行中
		                </a>
		            </div>
		            <div class="top-title-box col-xs-4">
		                <a data-page-button="user-proj-second-type" data-button-value="seccess" class="top-title-item" href="javascript:void(0)">
		                    已成功
		                </a>
		            </div>
		            <div class="top-title-box col-xs-4">
		                <a data-page-button="user-proj-second-type" data-button-value="fail" class="top-title-item" href="javascript:void(0)">
		                    已失败
		                </a>
		            </div>
		        </div>
			</c:when>  
			<c:when test="${reasonWithLogedUser==3}">
				<!-- <title>我收藏的</title> -->
				<div class="top row">
		            <div class="top-title-box col-xs-4">
		                <a data-page-button="user-proj-second-type" data-button-value="collecting" class="top-title-item checked" href="javascript:void(0)">
		                    进行中
		                </a>
		            </div>
		            <div class="top-title-box col-xs-4">
		                <a data-page-button="user-proj-second-type" data-button-value="seccess" class="top-title-item" href="javascript:void(0)">
		                    已成功
		                </a>
		            </div>
		            <div class="top-title-box col-xs-4">
		                <a data-page-button="user-proj-second-type" data-button-value="fail" class="top-title-item" href="javascript:void(0)">
		                    已失败
		                </a>
		            </div>
		        </div>
			</c:when>  
		     
			<c:otherwise>
				<title>项目关系出错了</title>
			</c:otherwise>  
		</c:choose>
        
        <div id="project_cont" class="primary row">
        
        <c:forEach var="up" items="${projList }">
            <div class="project-box">
                <div class="proj-top">
                    <div style="background-image: url('${up.photo }');" class="proj-user-photo">
                        
                    </div>
                    <div class="proj-user-name">
<!--                       <h4>-->
                            ${up.nickname }
<!--                       </h4>-->
                    </div>
                    <div class="proj-user-create-time">
                        ${up.day }天前
                    </div>
                    <div class="proj-user-over-time">
                          <!--  判断是否是审核不过的项目-->
                          
                          
                          <c:if test="${up.state==2 }">    
                          
                                剩余
                        <a href="${ctx }/proj/info?projId=${up.projectId}&userId=${up.userId}">${30-up.day }</a>
                   		     天
            </c:if>                                                     
                          
                        <c:if test="${up.state==4 }">
                            审核不过
                        </c:if>
                    
                    </div>
                </div>
                <div class="proj-title">
                   <a href="${ctx }/proj/info?projId=${up.projectId}&userId=${up.userId}">
                    	${up.name }
                   </a>
                </div>
                <div class="proj-bottom-box">
                	<a class="font-default-color" href="${ctx }/proj/info?projId=${up.projectId}&userId=${up.userId}">
	                   <div class="row">
	                        <div class="col-xs-4 proj-bottom-item">
	                            目标
	                            <span class="font-base-color">${up.targetMoney }</span>
	                            元
	                        </div>
	                        <div class="col-xs-4 proj-bottom-item">
	                            已筹
	                            <span class="font-base-color">${up.finishMoney }</span>
	                            元
	                        </div>
	                        <div class="col-xs-4 proj-bottom-item">
	                            剩余
	                            <span class="font-base-color">
	                            
	                              <fmt:parseNumber value="${(up.targetMoney-up.finishMoney)/up.unitPrice }" integerOnly="true"></fmt:parseNumber>
	                            
	                            </span>
	                            份
	                        </div>
	                   </div>
	                 </a>
                </div>
            </div>
            
            </c:forEach>
        </div>
	
    </div>
    
    <div class="background-cont hide">
<!--        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">-->
        <div id="carousel-example-generic" class="carousel slide">
          <!-- Indicators -->
          <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
          </ol>

          <!-- Wrapper for slides -->
          <div class="carousel-inner" role="listbox">
            <div class="item active">
              <img src="/public/imgs/user.png" alt="...">
            </div>
            <div class="item">
              <img src="/public/imgs/test.jpg" alt="...">
            </div>
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
    
    

   
    <!--jquery的js文件-->
    <script type="text/javascript" src="/public/lib/jquery/jquery.min.js"></script>

    <!--    bootstrap基础文件引入-->
    <script type="text/javascript" src="/public/lib/bootstrap/bootstrap.min.js"></script>

    <!--    引入测试的js文件,此文件仅在开发过程中使用,真实上线时需要删除-->
    <!-- <script type='text/javascript' src="/public/js/util/util.js"></script> -->
    <script type='text/javascript' src="/public/js/user.js"></script>
        
    <!-- <script>
        document.title='你的title';
    </script> -->
  </body>
</html>
