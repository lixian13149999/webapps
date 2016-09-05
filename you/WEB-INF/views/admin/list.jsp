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
<html>
<head>
<base href="<%=basePath%>">

<title>发现</title>

<!--   设置编码-->
    <meta charset="UTF-8">
    <!--    使页面在手机访问的时候自适应-->
    <meta name="viewport" content="initial-scale=1, user-scalable=0, minimal-ui">
    
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

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
<!-- 这是管理员后台管理页面 -->
<h4 style="color:red" align="center">欢迎进入管理页面</h4>
	<div class="container-fluid">

		<div class="top row">
			<div class="top-title-box col-xs-6">
				<a data-page-button="proj-type" data-page-value="doing" class="top-title-item checked"
					href="javascript:void(0)"> 审核不通过 </a>
			</div>
			<div class="top-title-box col-xs-6">
				<a data-page-button="proj-type"data-page-value="success" class="top-title-item"
					href="javascript:void(0)"> 审核通过 </a>
			</div>
		</div>
		

		<div id="project_cont" class="primary row">
			<c:forEach var="userProject" items="${userProjectList }">
				<div class="project-box">
					<div class="proj-top">
						<div style="background-image: url(${userProject.photo });"
							class="proj-user-photo"></div>
						<div class="proj-user-name">
							${userProject.nickname }
						</div>
						<div class="proj-user-create-time">					
                           ${userProject.day }						
      天前
											
						</div>
						<div class="proj-user-over-time">
							剩余 <a href="javascript:void(0)"><fmt:parseNumber value="${30-userProject.day}" type="number" integerOnly="true" ></fmt:parseNumber>
</a> 天
						</div>
					</div>
					<div class="proj-title">
						<a href="${ctx }/proj/info?projId=${userProject.projectId}&userId=${userProject.userId}"> ${userProject.name }</a>
					</div>
					<div class="proj-img">
						<c:forEach  begin="0" end="3" var="url" items="${userProject.a_desImg}">
							<img class="proj-img-item" src="${url}" alt="">	
						</c:forEach>		
					</div>
					
					<div class="proj-info">
						<a href="${ctx }/proj/info?projId=${userProject.projectId}&userId=${userProject.userId}">
							${userProject.projDescribe }
						</a>
					</div>
					
					<div class="proj-bottom-box">
						<a class="font-default-color" href="${ctx }/proj/info?projId=${userProject.projectId}&userId=${userProject.userId}">
							<div class="row">
								<div class="col-xs-4 proj-bottom-item">
									目标 <span class="font-base-color">${userProject.targetMoney }</span> 元
								</div>
								<div class="col-xs-4 proj-bottom-item">
									已筹 <span class="font-base-color">${userProject.finishMoney }</span> 元
								</div>
								<div class="col-xs-4 proj-bottom-item">
									剩余 <span class="font-base-color">						
										  <fmt:parseNumber value="${(userProject.targetMoney-userProject.finishMoney)/userProject.unitPrice }" integerOnly="true"></fmt:parseNumber>
									</span> 份
								</div>
							</div>
						</a>
					</div>
				</div>



			</c:forEach>


			<!-- <div class="project-box">
				<div class="proj-top">
					<div style="background-image: url('/public/imgs/user.png');"
						class="proj-user-photo"></div>
					<div class="proj-user-name">
						                      <h4>
						一个名字很
						                      </h4>
					</div>
					<div class="proj-user-create-time">1周前</div>
					<div class="proj-user-over-time">
						剩余 <a href="javascript:void(0)">10</a> 天
					</div>
				</div>
				<div class="proj-title">
					<a> 这个是项目的标题 </a>
				</div>
				<div class="proj-img">
					<img class="proj-img-item" src="/public/imgs/user.png" alt="">
					<img class="proj-img-item" src="/public/imgs/user.png" alt="">
					<img class="proj-img-item" src="/public/imgs/user.png" alt="">
					<img class="proj-img-item" src="/public/imgs/test.jpg" alt="">
				</div>
				<div class="proj-info">
					<a href="javascript:void(0)">

						项目的详细介绍信息,但是只能显示两行,多出来的内容要自动省略,这个自动省略好像不怎么好办,算了,到时候在想办法吧 </a>
				</div>
				<div class="proj-bottom-box">
					<div class="row">
						<div class="col-xs-4 proj-bottom-item">
							目标 <a href="javascript:void(0)">12345</a> 元
						</div>
						<div class="col-xs-4 proj-bottom-item">
							已筹 <a href="javascript:void(0)">123142</a> 元
						</div>
						<div class="col-xs-4 proj-bottom-item">
							剩余 <a href="javascript:void(0)">100</a> 份
						</div>
					</div>
				</div>
			</div>


			<div class="project-box">
				<div class="proj-top">
					<div style="background-image: url('/public/imgs/user.png');"
						class="proj-user-photo">
						                       <img class="proj-photo-img-item" src="/public/imgs/user.png" alt="">
					</div>
					<div class="proj-user-name">
						                      <h4>
						一个名字很
						                      </h4>
					</div>
					<div class="proj-user-create-time">1周前</div>
					<div class="proj-user-over-time">
						剩余 <a href="javascript:void(0)">10</a> 天
					</div>
				</div>
				<div class="proj-title">
					<a> 这个是项目的标题 </a>
				</div>
				<div class="proj-img">
					<img class="proj-img-item" src="/public/imgs/user.png" alt="">
					<img class="proj-img-item" src="/public/imgs/user.png" alt="">
					<img class="proj-img-item" src="/public/imgs/user.png" alt="">
					<img class="proj-img-item" src="/public/imgs/test.jpg" alt="">
				</div>
				<div class="proj-info">
					<a href="javascript:void(0)">

						项目的详细介绍信息,但是只能显示两行,多出来的内容要自动省略,这个自动省略好像不怎么好办,算了,到时候在想办法吧 </a>
				</div>
				<div class="proj-bottom-box">
					<div class="row">
						<div class="col-xs-4 proj-bottom-item">
							目标 <a href="javascript:void(0)">12345</a> 元
						</div>
						<div class="col-xs-4 proj-bottom-item">
							已筹 <a href="javascript:void(0)">123142</a> 元
						</div>
						<div class="col-xs-4 proj-bottom-item">
							剩余 <a href="javascript:void(0)">100</a> 份
						</div>
					</div>
				</div>
			</div> -->
		</div>

		<div class="bottom bottom-box container-fluid">
			<div class="row bottom-button-box">

				<a data-page-button="bottom" data-button-href="find" href="javascript:void(0)"
					class="bottom-icon-box col-xs-4 checked"> <i
					class="icon icon-find bottom-icon-i"></i> <label for=""
					class="bottom-icon-label">发现</label>
				</a> <a data-page-button="bottom" data-button-href="create" href="javascript:void(0)"
					class="bottom-icon-box col-xs-4"> <i
					class="icon icon-edit bottom-icon-i"></i> <label for=""
					class="bottom-icon-label">发起</label>
				</a> <a data-page-button="bottom" data-button-href="user" href="${ctx }/user"
					class="bottom-icon-box col-xs-4"> <i
					class="icon icon-user bottom-icon-i"></i> <label for=""
					class="bottom-icon-label">我</label>
				</a>
			</div>
			<!-- 最后一次加载页面的时间 -->
			<input id="last_refresh_time" type="text" class="hide" value="123" /> 
			<!-- 加载的页码 -->
			<input id="page_number" type="text" class="hide" value="1" /> 
			<!-- 项目类型,1.众筹中,2.已成功 -->
			<input id="proj_type" type="text" class="hide" value="1" />
		</div>
	</div>

	<div class="background-cont hide">
		<!--        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">-->
		<div id="carousel-example-generic" class="carousel slide">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
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
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>

	</div>




	<!--jquery的js文件-->
	<script type="text/javascript" src="/public/lib/jquery/jquery.min.js"></script>

	<!--    bootstrap基础文件引入-->
	<script type="text/javascript"
		src="/public/lib/bootstrap/bootstrap.min.js"></script>

	<!--    引入测试的js文件,此文件仅在开发过程中使用,真实上线时需要删除-->
	<script type='text/javascript' src="/public/js/util/util.js"></script>
	<script type='text/javascript' src="/public/js/admin/index.js"></script>
</body>
</html>
