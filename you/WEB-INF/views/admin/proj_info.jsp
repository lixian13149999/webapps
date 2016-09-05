<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户列表</title>

</head>

<body>
    <div class="title-search-div row">
        <h3 class="menu-title">项目详情</h3>
<!--        <input type="text" class="title-search-input form-control" placeholder="请输入订单号或产品名称" />-->
    </div>
    <div class="proj-name">
        <label for="">项目名称</label>
        <span>${userProject.name}</span>
    </div>
    <div class="want-money m-t">
        <label for="">目标金额</label>
        <span>${userProject.targetMoney}</span>
    </div>
    <h3 class="menu-title"></h3>
    <div class="proj-img m-t">
    
    <c:forEach var="i" begin="0" end="5"> 
    	<img src="${userProject.a_desImg[i]}" alt="">           
    </c:forEach>
    </div>
    
    <div class="proj-info m-t">
        
        <label for="">项目详情</label>
        <p>${userProject.projDescribe}</p>
    </div>
    <h3 class="menu-title"></h3>
    
    <div class="proj-img m-t">
    
    <c:forEach var="i" begin="0" end="5"><!--显示六张  -->
          <img src="${userProject.a_founderImg[i]}" alt="">
    </c:forEach>
    </div>
    <div class="proj-info m-t">
        
        <label for="">创始人详情</label>
        <p>${userProject.founderDes}</p>
    </div>
    <h3 class="menu-title"></h3>
    
    <div class="proj-info-msg m-t">
        <label for="">回报说明</label>
        <p>${userProject.repayExplain}</p>
    </div>
    <h3 class="menu-title"></h3>
    
    <div class="proj-info-msg m-t">
        <label for="">注意事项</label>
        <p>${userProject.warning}</p>
    </div>
    
    <h3 class="menu-title"></h3>
    
    <div class="proj-info-msg m-t">
        <p><label for="">创始人二维码</label></p>
        <img src="${userProject.wechatDimen}" alt="">
    </div>
    <h3 class="menu-title"></h3>
    
    <div class="proj-info-msg m-t">
        <p><label for="">实名认证信息</label></p>
        <img src="${userProject.idCard}" alt="">
    </div>
    <h3 class="menu-title"></h3> 
    
      <c:if test="${flag==0 }">  <!--待审核项目-->  
     <div class="proj-buttans m-t">
        <p><label for="">操作</label></p>
         <a href="javascript:void(0)" onclick="pass(${userProject.projectId})" class="button button-primary">通过审核</a>
        <a href="javascript:void(0)"  onclick="noPass(${userProject.projectId})" class="button button-highlight">不予通过</a> 
        <a href="javascript:void(0)"  onclick="recommend(${userProject.projectId})" class="button button-action">设为主推项目</a> 
    </div>       
    </c:if>
    
    
      <c:if test="${flag==1 }">  <!--主推项目 -->  
     <div class="proj-buttans m-t">
        <p><label for="">操作</label></p>
         <!-- <a href="javascript:void(0)" class="button button-primary">通过审核</a>
        <a href="javascript:void(0)" class="button button-highlight">不予通过</a>  -->
        <a href="javascript:void(0)" onclick="cancelRecommend(${userProject.projectId})" class="button button-action">设为非主推项目</a> 
    </div>       
    </c:if>
    
    
    <c:if test="${flag==3 }">  <!--  进行中项目-->  
       <div class="proj-buttans m-t">
        <p><label for="">操作</label></p>  
        <c:if test="${userProject.recommend==2 }">
          <a href="javascript:void(0)" onclick="recommend(${userProject.projectId})" class="button button-action">设为主推项目</a> 
        </c:if>      
       
        <c:if test="${userProject.recommend==1 }">
                <a href="javascript:void(0)" onclick="cancelRecommend(${userProject.projectId})" class="button button-action">设为非主推项目</a> 
        </c:if>         
        
    </div>       
    </c:if>
     <c:if test="${flag==5&&orderList!='[]' }">
     
     		<table border="1px" style="width:800px " >
     			<tr>
     			  <td>收件人</td>
     			  <td>收件人电话</td>
     		      <td>流水号（微信）</td>
     			  <td>收件人地址</td>     			 
     			</tr>
     			
     			<c:forEach var="order" items="${orderList}">    			
     			<tr>
     			  <td>${order.addrRealName }</td>
     			  <td>${order.addrPhone }</td>
     		      <td>${order.payNumber }</td>
     			  <td>${order.addrAddr }</td>     			 
     			</tr>       			
     			</c:forEach>
     		
     		</table>
     
     
      </c:if>
    
</body>

</html>