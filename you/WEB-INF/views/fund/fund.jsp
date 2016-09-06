<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!--    使页面在手机访问的时候自适应-->
    <meta name="viewport" content="initial-scale=1, user-scalable=0, minimal-ui">
    <title>账单明细</title>
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

    <div class="container-fluid">
        <div id="" class="primary row fund-cont">
       
         <c:if test="${fundList=='[]' }">
        <div class="fund-box">
           <div style="text-align: center">
           		<span style="color: red" >暂无资金明细</span>           
           </div>
	        </div>        
        </c:if>
        <!--如果资金流集合不为空 循环得到资金流集合 -->
        <c:if test="${fundList!=null }">       
        	<c:forEach var="fund" items="${fundList}">
        	
        				<div class="fund-box">
                <div class="fund-top">
                     <c:if test="${fund.projName!=null}">
                          <span class="fund-proj-name">${fund.projName}</span>                     
                     </c:if>
                     
                     <c:if test="${fund.projName==null}">
                          <span class="fund-proj-name">钱包提现</span>                     
                     </c:if>                    
                    <span class="fund-fund-time">${fund.time}</span>
                </div>
                <div class="fund-bottom">
                    <span class="fund-msg">${fund.remark}</span>
                    <span class="fund-money">
                 <c:if test="${fund.direction ==1}">
                		 +
                 </c:if >
                
                  <c:if test="${fund.direction ==2}">
                       -
                 </c:if>
                    
                    ${fund.sumMoney}
                    </span>
                </div>
            </div>
            
        	
        	</c:forEach>
        
        </c:if>
            
        </div>
    </div>
    
    <!--jquery的js文件-->
    <script type="text/javascript" src="/public/lib/jquery/jquery.min.js"></script>

    <!--    bootstrap基础文件引入-->
    <script type="text/javascript" src="/public/lib/bootstrap/bootstrap.min.js"></script>
    <!--    警告提示框的js源文件-->
    <script type="text/javascript" src="/public/lib/messenger/js/messenger.min.js"></script>
    
    <!--    警告提示的js文件-->
    <script type="text/javascript" src="/public/js/util/imessenger.js"></script>
    <!--    用于验证的js文件-->
    <script type="text/javascript" src="/public/js/util/verify.js"></script>
    
    
    <!--    less文件引入-->
    <!-- <script type="text/javascript" src="/public/lib/less/less.min.js"></script> -->

    <!--    引入测试的js文件,此文件仅在开发过程中使用,真实上线时需要删除-->
    <script type='text/javascript' src="/public/js/create.js"></script>
</body>
</html>