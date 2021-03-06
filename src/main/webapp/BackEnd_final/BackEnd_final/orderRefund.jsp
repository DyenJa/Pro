<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/"+path+"/";  
request.setAttribute("path", basePath);  
%> 
<!--String path = request.getServletContext().getRealPath("/");
		String ppath = new File(path).getParent();
		//1.3 临时-》目的
		File dest = new File(ppath+"/upload",filename);	  -->
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>退款处理页</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="${path}BackEnd_final/layui/css/layui.css">
		<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.0.js"></script>
		<style>
			.layui-card {margin: 35px 45px 45px 0; border-radius: 10px; text-align: center;}
			.layui-card-header {
				font-size: 25px; 
				font-weight: 600;
				background-color: antiquewhite; 
				border-top-left-radius: 10px;
				border-top-right-radius: 10px;
				text-align: left;
			}
  			.layui-card-body {margin-top: 2%; padding: 0px 40px 10px 40px;}
			button {border: none; background-color: transparent;}
			body {font-family: "宋体"; background-color: #F8F8FF;}
			.layui-card-body form input{display: inline;width: 10%;margin-right: 2%;}
			#btn_search {float: right; width:auto; background-color:#009E94;}
			#oid {width: 18%; margin-right: 4%;}
			#status {margin-right: 4%;}
			#startDate {width: 130px;margin-right: 4%;}
			#endDate {width: 130px;}
			#search_form {margin-bottom: 20px;}
			#btn_refund {width:auto; background-color:#009E94;margin-left:-6px}
  		</style>
  		<script src="${path}BackEnd_final/layui/layui.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#btn_search").click(function(){
					loadTable();
				});		
			})
			
			function getUrl(){
				var oid = $("#oid").val();
				var status = $("#status").val();
				var startDate = $("#startDate").val();
				var endDate = $("#endDate").val();
				var url = '<%=request.getContextPath() %>/BackEnd/order/getOrdersPageAjax?oid=' + oid 
							+ '&status=' + status + '&startDate=' + startDate + '&endDate=' + endDate;
				return url;
			}
			
			function loadTable(){
				layui.use('table', function(){
					var table = layui.table;
					var url = getUrl();
					
					//第一个实例
					table.render({
						elem : '#refund_table',
						height : 415,
						url : url, //数据接口
						page : true,
						cols : [ [ //表头
	    					{field : 'lid', title : '课程编号', width : 100, sort : true, fixed : 'left', align : 'center'}, 
	    					{field : 'oid', title : '订单编号', width : 95, sort : true, align : 'center' }, 
	    					{field : 'username', title : '用户昵称', width : 100, align : 'center'}, 
	    					{field : 'tel', title : '用户电话', width : 110, align : 'center' }, 
	    					{field : 'total', title : '订单金额', width : 100, sort : true, align : 'center'}, 
	    					{field : 'coupon_id', title : '代金券编号', width : 100, align : 'center'}, 
	    					{field : 'pay', title : '实付金额', width : 90, align : 'center' }, 
	    					{field : 'status', title : '订单状态', width : 90, align : 'center'}, 
	    					{field : 'orderTime', title : '下单时间', width : 180, sort  : true,align : 'center'},
	    					{field : 'refund', title: '操作', toolbar:"#barDemo", align: 'center'}
						] ]
				    });
					
					 table.on('tool(refund_filter)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
			        	  var data = obj.data; //获得当前行数据
			        	  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
			        	  var tr = obj.tr; //获得当前行 tr 的DOM对象
			        	 
			        	  if(layEvent === 'confirm'){ //查看
			        		  $.ajax({
			        			 url: '<%=request.getContextPath() %>/BackEnd/order/confirmRefund',
			        			 type: 'post',
			        			 data: {'oid': data.oid},
			        			 dataType: 'json',
			        			 success: function(data){
			        				 if(data.state == 1){
			        					 obj.del()
			        					 layer.msg('处理成功');
			        				 }
			        				 else{
			        					 layer.msg('处理失败');
			        				 }
			        			 }
			        		  });
			        	 } 
			        });
			    });
			}
			
			window.onload = loadTable();
        </script>
	</head>

	<body class="layui-layout-body">
		<div class="layui-layout layui-layout-admin" style="margin: 0px 50px 0px 0px;">
			<!-- 内容主体区域 -->
			<div class="layui-card">
				<div class="layui-card-header">
					<span>退款处理</span>
				</div>
				<div class="layui-card-body">
					<form id="search_form" class= "scree" method="post">
						订单编号:<input id="oid" type="text" name="title" placeholder="请输入订单编号" class="layui-input" > 
						订单状态:
						<select id="status" name="status" disabled="true">
							<option value="refunding" selected="true">退款中</option>
						</select>
						下单时间:自<input id="startDate" type="date" name="start_date" /> -至
						<input id="endDate" type="date" name="end_date" />
						<button type="button" id="btn_search" class="layui-btn  layui-btn-sm layui-btn-normal">查询</button>
					</form>
					<!--示例表格-->
					<div class="layui-form layui-border-box layui-table-view" style="height: 450px; " >
					    <div class="layui-table-box">
							<table id="refund_table" lay-filter="refund_filter"></table>
							<script type="text/html" id="barDemo">
								<button id="btn_refund" type="button" class="layui-btn  layui-btn-sm layui-btn-normal" lay-event="confirm">退款</button>
							</script>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>