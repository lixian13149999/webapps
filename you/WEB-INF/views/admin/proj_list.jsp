<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>待审核项目</title>

</head>

<body>
    <div class="title-search-div row">
        <h3 class="menu-title">
        
        <c:if test="${flag==0 }">  
	         		   待审核项目
	       </c:if>
	       <c:if test="${flag==4}">  
	         		   审核不通过
	       </c:if>
        <c:if test="${flag==1 }">  
	         		   主推项目
	       </c:if>
	        <c:if test="${flag==2 }">  
	         		已完成的项目
	       </c:if>
	        <c:if test="${flag==3 }">  
	         		进行中的项目
	       </c:if>
	       
	        <c:if test="${flag==5}">  
	         		众筹失败的项目
	       </c:if>
        
        </h3>
<!--        <input type="text" class="title-search-input form-control" placeholder="请输入订单号或产品名称" />-->
    </div>
    <table class="table table-bordered table-hover">
        <tr class="active">
            <th>项目名称</th>
            <th>创建时间</th>
            <th>众筹金额</th>
            <th>操作</th>
            <!--在详情页面中对项目进行审核操作  -->
        </tr>
        <c:if test="${projList!=null }">
	        <c:forEach var="proj" items="${projList }">	        
	        <tr>
            <td>${proj.name }</td>            
            <td>${proj.createTime }</td>
            <td>${proj.targetMoney }</td>
            <td><input type="button" value="详情" onclick="getProjInfo(${proj.id },${flag })"/></td>           
        </tr>
	        </c:forEach>
        
        </c:if>
    </table>
   共 ${pageCount}页
    <div class="pages-div">
        <c:if test="${flag==0 }">
	        <nav>
	            <ul class="pagination">
	               <li>
	                   <a href="javascript:examineProjList(1,${pageSize })">首页</a>
	                </li>
	                <li>
	                    <a href="javascript:examineProjList(${pageIndex>1?pageIndex-1:1},${pageSize })" aria-label="Previous">
	                        上一页
	                    </a>
	                </li>
	                <c:forEach var="thisIndex" begin="1" end="${pageCount}">
		                <li class="${thisIndex==pageIndex?'active':''}">
		                    <a href="javascript:examineProjList(${thisIndex},${pageSize })" class="page-num">${thisIndex}</a>
		                </li>
	                </c:forEach>
	                <li>
	                    <a href="javascript:examineProjList(${pageCount>pageIndex?pageIndex+1:pageCount},${pageSize })" aria-label="Next">
	                        下一页
	                    </a>
	                </li>
	                <li>
	                   <a href="javascript:examineProjList(${pageCount},${pageSize })">尾页</a>
	                </li>
	            </ul>
	        </nav>
    	</c:if>
    	<c:if test="${flag==4 }">
	        <nav>
	            <ul class="pagination">
	               <li>
	                   <a href="javascript:notPassProjList(1,${pageSize })">首页</a>
	                </li>
	                <li>
	                    <a href="javascript:notPassProjList(${pageIndex>1?pageIndex-1:1},${pageSize })" aria-label="Previous">
	                        上一页
	                    </a>
	                </li>
	                <c:forEach var="thisIndex" begin="1" end="${pageCount}">
		                <li class="${thisIndex==pageIndex?'active':''}">
		                    <a href="javascript:notPassProjList(${thisIndex},${pageSize })" class="page-num">${thisIndex}</a>
		                </li>
	                </c:forEach>
	                <li>
	                    <a href="javascript:notPassProjList(${pageCount>pageIndex?pageIndex+1:pageCount},${pageSize })" aria-label="Next">
	                        下一页
	                    </a>
	                </li>
	                <li>
	                   <a href="javascript:notPassProjList(${pageCount},${pageSize })">尾页</a>
	                </li>
	            </ul>
	        </nav>
    	</c:if>
    	<c:if test="${flag==1 }">
	        <nav>
	            <ul class="pagination">
	               <li>
	                   <a href="javascript:recommendProjList(1,${pageSize })">首页</a>
	                </li>
	                <li>
	                    <a href="javascript:recommendProjList(${pageIndex>1?pageIndex-1:1},${pageSize })" aria-label="Previous">
	                        上一页
	                    </a>
	                </li>
	                <c:forEach var="thisIndex" begin="1" end="${pageCount}">
		                <li class="${thisIndex==pageIndex?'active':''}">
		                    <a href="javascript:recommendProjList(${thisIndex},${pageSize })" class="page-num">${thisIndex}</a>
		                </li>
	                </c:forEach>
	                <li>
	                    <a href="javascript:recommendProjList(${pageCount>pageIndex?pageIndex+1:pageCount},${pageSize })" aria-label="Next">
	                        下一页
	                    </a>
	                </li>
	                <li>
	                   <a href="javascript:recommendProjList(${pageCount},${pageSize })">尾页</a>
	                </li>
	            </ul>
	        </nav>
    	</c:if>
    	<c:if test="${flag==2 }">
	        <nav>
	            <ul class="pagination">
	               <li>
	                   <a href="javascript:finishedProjList(1,${pageSize })">首页</a>
	                </li>
	                <li>
	                    <a href="javascript:finishedProjList(${pageIndex>1?pageIndex-1:1},${pageSize })" aria-label="Previous">
	                        上一页
	                    </a>
	                </li>
	                <c:forEach var="thisIndex" begin="1" end="${pageCount}">
		                <li class="${thisIndex==pageIndex?'active':''}">
		                    <a href="javascript:finishedProjList(${thisIndex},${pageSize })" class="page-num">${thisIndex}</a>
		                </li>
	                </c:forEach>
	                <li>
	                    <a href="javascript:finishedProjList(${pageCount>pageIndex?pageIndex+1:pageCount},${pageSize })" aria-label="Next">
	                        下一页
	                    </a>
	                </li>
	                <li>
	                   <a href="javascript:finishedProjList(${pageCount},${pageSize })">尾页</a>
	                </li>
	            </ul>
	        </nav>
    	</c:if>
    	<c:if test="${flag==5 }">
	        <nav>
	            <ul class="pagination">
	               <li>
	                   <a href="javascript:failedProjList(1,${pageSize })">首页</a>
	                </li>
	                <li>
	                    <a href="javascript:failedProjList(${pageIndex>1?pageIndex-1:1},${pageSize })" aria-label="Previous">
	                        上一页
	                    </a>
	                </li>
	                <c:forEach var="thisIndex" begin="1" end="${pageCount}">
		                <li class="${thisIndex==pageIndex?'active':''}">
		                    <a href="javascript:failedProjList(${thisIndex},${pageSize })" class="page-num">${thisIndex}</a>
		                </li>
	                </c:forEach>
	                <li>
	                    <a href="javascript:failedProjList(${pageCount>pageIndex?pageIndex+1:pageCount},${pageSize })" aria-label="Next">
	                        下一页
	                    </a>
	                </li>
	                <li>
	                   <a href="javascript:failedProjList(${pageCount},${pageSize })">尾页</a>
	                </li>
	            </ul>
	        </nav>
    	</c:if>
    	<c:if test="${flag==3 }">
	        <nav>
	            <ul class="pagination">
	               <li>
	                   <a href="javascript:ongoingProjList(1,${pageSize })">首页</a>
	                </li>
	                <li>
	                    <a href="javascript:ongoingProjList(${pageIndex>1?pageIndex-1:1},${pageSize })" aria-label="Previous">
	                        上一页
	                    </a>
	                </li>
	                <c:forEach var="thisIndex" begin="1" end="${pageCount}">
		                <li class="${thisIndex==pageIndex?'active':''}">
		                    <a href="javascript:ongoingProjList(${thisIndex},${pageSize })" class="page-num">${thisIndex}</a>
		                </li>
	                </c:forEach>
	                <li>
	                    <a href="javascript:ongoingProjList(${pageCount>pageIndex?pageIndex+1:pageCount},${pageSize })" aria-label="Next">
	                        下一页
	                    </a>
	                </li>
	                <li>
	                   <a href="javascript:ongoingProjList(${pageCount},${pageSize })">尾页</a>
	                </li>
	            </ul>
	        </nav>
    	</c:if>
    </div>
</body>

</html>