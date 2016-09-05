<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>提现申请</title>

</head>

<body>
    <div class="title-search-div row">
        <h3 class="menu-title"><!--标志提现申请的阶段flag：1、待审核提现2.待确认提现3.已完成提现  -->
        
        <c:if test="${flag== 1}">
       待审核提现
        </c:if>
        <c:if test="${flag== 2}">
        待确认提现
        </c:if>
        <c:if test="${flag==3 }">
        已完成提现
        </c:if>
        
        
        </h3>
<!--        <input type="text" class="title-search-input form-control" placeholder="请输入订单号或产品名称" />-->
    </div>
    <table class="table table-bordered table-hover">
        <tr class="active">
            <th>提现人</th>
            <th>提现金额</th>
            <th>申请时间</th>
            <th>提现备注</th> 
             <c:if test="${flag==1||flag==2 }">
                <th>处理状态</th>
            </c:if>  
             
        </tr>        
        <c:if test="${ cashList!=null}">
        	<c:forEach var="cash" items="${ cashList}">
        	<tr>
            <td>${cash.nickname}</td>
            <td>${cash.cashAmount}</td>
            <td>${cash.createTime}</td>
            <td>${cash.remark}</td>            
            <!--根据申请的处理阶段选择  -->
            <c:if test="${flag==1 }">
                <td><a href="javascript:void(0)" onclick="approve(${cash.id})" style="color:red">批准申请</a></td>            
            </c:if>
             <c:if test="${flag==2 }">
               <td><a href="javascript:void(0)" onclick="confirm(${cash.id})" style="color:red">确认打款</a></td>            
            </c:if>
            
            </tr>
        	
        	</c:forEach>
        
        </c:if>
  
    </table>
           共${pageCount}页
    <div class="pages-div">
    <c:if test="${flag==1 }">
	        <nav>
	            <ul class="pagination">
	               <li>
	                   <a href="javascript:cashApplyToApprove(1,${pageSize })">首页</a>
	                </li>
	                <li>
	                    <a href="javascript:cashApplyToApprove(${pageIndex>1?pageIndex-1:1},${pageSize })" aria-label="Previous">
	                        上一页
	                    </a>
	                </li>
	                <c:forEach var="thisIndex" begin="1" end="${pageCount}">
		                <li class="${thisIndex==pageIndex?'active':''}">
		                    <a href="javascript:cashApplyToApprove(${thisIndex},${pageSize })" class="page-num">${thisIndex}</a>
		                </li>
	                </c:forEach>
	                <li>
	                    <a href="javascript:cashApplyToApprove(${pageCount>pageIndex?pageIndex+1:pageCount},${pageSize })" aria-label="Next">
	                        下一页
	                    </a>
	                </li>
	                <li>
	                   <a href="javascript:cashApplyToApprove(${pageCount},${pageSize })">尾页</a>
	                </li>
	            </ul>
	        </nav>
    	</c:if>
    	<c:if test="${flag==2 }">
	        <nav>
	            <ul class="pagination">
	               <li>
	                   <a href="javascript:cashApplyToConfirm(1,${pageSize })">首页</a>
	                </li>
	                <li>
	                    <a href="javascript:cashApplyToConfirm(${pageIndex>1?pageIndex-1:1},${pageSize })" aria-label="Previous">
	                        上一页
	                    </a>
	                </li>
	                <c:forEach var="thisIndex" begin="1" end="${pageCount}">
		                <li class="${thisIndex==pageIndex?'active':''}">
		                    <a href="javascript:cashApplyToConfirm(${thisIndex},${pageSize })" class="page-num">${thisIndex}</a>
		                </li>
	                </c:forEach>
	                <li>
	                    <a href="javascript:cashApplyToConfirm(${pageCount>pageIndex?pageIndex+1:pageCount},${pageSize })" aria-label="Next">
	                        下一页
	                    </a>
	                </li>
	                <li>
	                   <a href="javascript:cashApplyToConfirm(${pageCount},${pageSize })">尾页</a>
	                </li>
	            </ul>
	        </nav>
    	</c:if>
    	<c:if test="${flag==3 }">
	        <nav>
	            <ul class="pagination">
	               <li>
	                   <a href="javascript:finishedCashApply(1,${pageSize })">首页</a>
	                </li>
	                <li>
	                    <a href="javascript:finishedCashApply(${pageIndex>1?pageIndex-1:1},${pageSize })" aria-label="Previous">
	                        上一页
	                    </a>
	                </li>
	                <c:forEach var="thisIndex" begin="1" end="${pageCount}">
		                <li class="${thisIndex==pageIndex?'active':''}">
		                    <a href="javascript:finishedCashApply(${thisIndex},${pageSize })" class="page-num">${thisIndex}</a>
		                </li>
	                </c:forEach>
	                <li>
	                    <a href="javascript:finishedCashApply(${pageCount>pageIndex?pageIndex+1:pageCount},${pageSize })" aria-label="Next">
	                        下一页
	                    </a>
	                </li>
	                <li>
	                   <a href="javascript:finishedCashApply(${pageCount},${pageSize })">尾页</a>
	                </li>
	            </ul>
	        </nav>
    	</c:if>
    </div>
    
 <script type="text/javascript">
       //处理提现申请的方法
    
     function approve(cashId) {//发起项目的用户
    	
			$.ajax({
				url : '/admin/approveApply?cashId='+cashId,
				type : 'POST',
				//dataType : 'html',
				success : function(data) {
				     alert("处理完成");
				     
				   //  window.location.reload();
					//加载页面
				$("#main-container").html(data);
				},
				error : function(data) {
					alert("出错了!");
				},
			});
		}
		

			
			
			function confirm(cashId) {//发起项目的用户
    	
			$.ajax({
				url : '/admin/confirmApply?cashId='+cashId,
				type : 'POST',
				//dataType : 'html',
				success : function(data) {
				     alert("处理完成");
				     
				   //  window.location.reload();
					//加载页面
				$("#main-container").html(data);
				},
				error : function(data) {
					alert("出错了!");
				},
			});
		}
			//*******************************************************
		</script>
</body>

</html>