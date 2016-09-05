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
        <h3 class="menu-title">
	        <c:if test="${flag==1 }">
	  				    发起过众筹  
	        </c:if>
	         <c:if test="${flag==2 }">
	  				    支持过众筹
	        </c:if>
         
        </h3>
<!--        <input type="text" class="title-search-input form-control" placeholder="请输入订单号或产品名称" />-->
    </div>
    <table class="table table-bordered table-hover">
            
        <tr class="active">
            <th>昵称</th>
            <th>电话</th>
            <th>注册时间</th>
            <th>最后登录时间</th>
            <th>钱包余额</th>
        </tr>
        <c:if test="${userList!=null }">
	        <c:forEach var="user" items="${userList }">	        
	        <tr>
            <td>${user.nickname }</td>
            <td>${user.phone }</td>
            <td>${user.addTime }</td>
            <td>${user.lastLoginTime }</td>
            <td>${user.holdMoney }</td>
        </tr>
	        </c:forEach>
        
        </c:if>
    </table>
     共${pageCount }页 
    <div class="pages-div">
    	<c:if test="${flag==1 }">
	        <nav>
	            <ul class="pagination">
	               <li>
	                   <a href="javascript:fUserList(1,${pageSize })">首页</a>
	                </li>
	                <li>
	                    <a href="javascript:fUserList(${pageIndex>1?pageIndex-1:1},${pageSize })" aria-label="Previous">
	                        上一页
	                    </a>
	                </li>
	                <c:forEach var="thisIndex" begin="1" end="${pageCount}">
		                <li class="${thisIndex==pageIndex?'active':''}">
		                    <a href="javascript:fUserList(${thisIndex},${pageSize })" class="page-num">${thisIndex}</a>
		                </li>
	                </c:forEach>
	                <li>
	                    <a href="javascript:fUserList(${pageCount>pageIndex?pageIndex+1:pageCount},${pageSize })" aria-label="Next">
	                        下一页
	                    </a>
	                </li>
	                <li>
	                   <a href="javascript:fUserList(${pageCount},${pageSize })">尾页</a>
	                </li>
	            </ul>
	        </nav>
    	</c:if>
    	<c:if test="${flag==2 }">
	        <nav>
	            <ul class="pagination">
	               <li>
	                   <a href="javascript:zUserList(1,${pageSize })">首页</a>
	                </li>
	                <li>
	                    <a href="javascript:zUserList(${pageIndex>1?pageIndex-1:1},${pageSize })" aria-label="Previous">
	                        上一页
	                    </a>
	                </li>
	                <c:forEach var="thisIndex" begin="1" end="${pageCount}">
		                <li class="${thisIndex==pageIndex?'active':''}">
		                    <a href="javascript:zUserList(${thisIndex},${pageSize })" class="page-num">${thisIndex}</a>
		                </li>
	                </c:forEach>
	                <li>
	                    <a href="javascript:zUserList(${pageCount>pageIndex?pageIndex+1:pageCount},${pageSize })" aria-label="Next">
	                        下一页
	                    </a>
	                </li>
	                <li>
	                   <a href="javascript:zUserList(${pageCount},${pageSize })">尾页</a>
	                </li>
	            </ul>
	        </nav>
    	</c:if>
    </div>
</body>

</html>