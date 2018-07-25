<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>分部查看页</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/BackEnd_final/layui/css/layui.css">
		<script type="text/javascript" src="<%=request.getContextPath() %>/BackEnd_final/layui/layui.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/BackEnd_final/layui/layui.all.js"></script>
		<style>
			.layui-card {margin: 35px 45px 45px 0; border-radius: 10px; text-align: center;}
			.layui-card-header {
				font-size: 25px; 
				font-weight: 700;
				background-color: antiquewhite; 
				border-top-left-radius: 10px;
				border-top-right-radius: 10px;
				text-align: left;
			}
			.layui-icon {font-size: 25px;}
			.thead {font-weight: 600; font-size: 16px;}
			.table-cell-id, .table-cell-name, .table-cell-address, .table-cell-tel, .table-cell-opt{text-align: center;}
			#a_branchAdd {text-decoration: none;font-size: 17px;}
		</style>
		<script type="text/javascript">
            function IFrameResize()
            {
                    //得到父页面的iframe框架的对象
                var obj = parent.document.getElementById("myFrame");
                    //把当前页面内容的高度动态赋给iframe框架的高
                //.height = 'auto';
                var height = getComputedStyle(window.parent.document.getElementsByClassName("layui-body")[0],null).height;
                console.log(height); 
                obj.height = height;
            } 
        </script>
	</head>

	<body class="layui-layout-body" 
		style="font-family: '宋体'; background-color: #F8F8FF;" onload="IFrameResize();">
		<div class="layui-layout layui-layout-admin">
				<!-- 内容主体区域 -->
			<div style="background-color: white; 
			  	margin: 0px 50px 0px 0px; background-color: #F8F8FF;">
				<div class="layui-card">
				  <div class="layui-card-header">
				  	<span>分部信息表</span>
				  	<span style="float: right;">
				  		<a href="<%=request.getContextPath() %>/BackEnd_final/BackEnd_final/branchAdd.jsp?qid=<%=request.getAttribute("qid") %>" id="a_branchAdd">
				  			<i class="layui-icon layui-icon-add-1"></i>
				  			添加分部
				  		</a>
				  	</span>
				  </div>
				  <div class="layui-card-body" style="margin: 1%;">
					<table class="layui-table" lay-skin="nob" lay-even>
						<thead align="center">
							<tr>
								<th><div class="thead table-cell-id">分部编号</div></th>
								<th><div class="thead table-cell-name">分部名字</div></th>
								<th><div class="thead table-cell-address">分部地址</div></th>
								<th><div class="thead table-cell-tel">分部电话</div></th>
								<th><div class="thead table-cell-opt">选项</div></th>
							</tr>
						</thead>
						<tbody style="font-size: 15px;">
						<c:forEach items="${addresslist }" var="s">
											
							<c:if test="${s.isDeleted == 0 }">
								<tr style="background-color:">
									<td><div class="tbody table-cell-id">${s.aid }</div></td>
									<td><div class="tbody table-cell-name">${s.branch }</div></td>
									<td><div class="tbody table-cell-address">${s.address }</div></td>
									<td><div class="tbody table-cell-tel">${s.tel }</div></td>
									<td>
										<div class="tbody table-cell-opt">
											<a href='<%=request.getContextPath()%>/BackEnd/Handler_viewSingleAddressByQidId?aid=${s.aid}&method=branch'><i class="layui-icon layui-icon-location">&emsp;</i></a>
											<a href='<%=request.getContextPath()%>/BackEnd/Handler_viewSingleAddressByQidId?aid=${s.aid}&method=branchModify'><i class="layui-icon layui-icon-edit">&emsp;</i></a>
											<a href="#" id="deleteBranchInfo" onClick="deleteRow(this)"><i class="layui-icon layui-icon-delete">&emsp;</i></a>
										</div> 
									</td>
								</tr>
							</c:if>
						</c:forEach>
						</tbody>
					</table>
				  </div>
				</div>
			</div>
		</div>
	</body>

	<script src="<%=request.getContextPath() %>/BackEnd_final/jquery-3.2.0.min.js"></script>
	<script>
		var aid;
		function deleteRow(obj){
			var res = confirm("确定要删除该分部吗？");
			if(res == true){
				aid = $(obj).parents("tr").children("td").eq(0).text();
				$(obj).parents("tr").remove();
				$.ajax({
					url: "Handler_deleteBranchByQidId",
					type:"post",
					data:{
						aid:aid
					},
					dataType:"json",
					success:function(data){
						alert(data.result);
					}
				});
			}
		}		
	</script>

</html>