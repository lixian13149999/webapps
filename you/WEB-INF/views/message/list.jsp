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

<title>我的消息</title>

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
    <!--    字体标签库引入-->
    <link rel="stylesheet" type="text/css" href="/public/lib/iconfont/iconfont.css">

    <!--   自定义样式总和引入-->
    <link rel="stylesheet" type="text/css" href="/public/css/index.css">

</head>

<body>
<div class="container-fluid">
        <div id="" class="primary row msg-cont">
        <c:if test="${msgList==null }">
         <div class="fund-box">
	        <div style="text-align: center">
	         	<span style="color: #aaa" >暂无消息</span>  
	        </div>
	        </div>        
        </c:if>
           
         <c:if test="${msgList!=null }"><!--循环遍历  -->
          <c:forEach  var="msg" items="${msgList }">
           <div class="msg-box">
                <div class="msg-user-photo" style="background-image:url(${msg.photo})"></div>
                <div class="msg-info-box">
                    <div class="msg-user-box">
                        <label class="msg-user-name">
                  ${msg.nickname}
                        </label>
                        <a class="msg-msg-time">
                            ${msg.day}天前
                        </a>
                    </div>
                    <span class="msg-msg-info">
                          ${msg.content}
                    </span>
                </div>
            </div>
          </c:forEach>        
         </c:if>
            
           
        </div>
    </div>
    
</body>
</html>
