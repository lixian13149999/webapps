<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>举报列表</title>

</head>

<body>
    <div class="title-search-div row">
        <h3 class="menu-title">举报列表</h3>
<!--        <input type="text" class="title-search-input form-control" placeholder="请输入订单号或产品名称" />-->
    </div>
    <table class="table table-bordered table-hover">
        <tr class="active">
            <th>项目名称</th>
            <th>举报信息</th>
            <th>举报人</th>
            <th>举报人电话</th>
            <th>举报时间</th>
           <th>处理状态</th>
        </tr>
        
        <c:if test="${ msgList!=null}">
        	<c:forEach var="msg" items="${ msgList}">
        	<tr>
            <td>${msg.projName}</td>
            <td>${msg.content}</td>
            <td>${msg.nickname}</td>
            <td>${msg.phone}</td>
            <td>${msg.addTime}</td>
           <td><a href="javascript:void(0)" onclick="dealReport(${msg.id})" style="color:red">待处理</a></td>
        </tr>
        	
        	</c:forEach>
        
        </c:if>
    </table>
           共${pageCount}页
    <div class="pages-div">
        <nav>
            <ul class="pagination">
               <li>
                   <a href="javascript:reportMsgList(1,${pageSize })">首页</a>
                </li>
                <li>
                    <a href="javascript:reportMsgList(${pageIndex>1?pageIndex-1:1},${pageSize })" aria-label="Previous">
                        上一页
                    </a>
                </li>
                <c:forEach var="thisIndex" begin="1" end="${pageCount}">
	                <li class="${thisIndex==pageIndex?'active':''}">
	                    <a href="javascript:reportMsgList(${thisIndex},${pageSize })" class="page-num">${thisIndex}</a>
	                </li>
                </c:forEach>
                <li>
                    <a href="javascript:reportMsgList(${pageCount>pageIndex?pageIndex+1:pageCount},${pageSize })" aria-label="Next">
                        下一页
                    </a>
                </li>
                <li>
                   <a href="javascript:reportMsgList(${pageCount},${pageSize })">尾页</a>
                </li>
            </ul>
        </nav>
    </div>
    
 <script type="text/javascript">
    
     function dealReport(msgId) {//发起项目的用户
    	
			$.ajax({
				url : '/admin/dealReport?msgId='+msgId,
				type : 'POST',
				//dataType : 'html',
				success : function(data) {
				     alert("处理完成");
				     
				   //  window.location.reload();
					//加载页面
					$("#base_jubaoshenhe_a").click();
					//$("#main-container").html(data);
				},
				error : function(data) {
					alert("出错了!");
				},
			});
		}
		</script>
</body>

</html>