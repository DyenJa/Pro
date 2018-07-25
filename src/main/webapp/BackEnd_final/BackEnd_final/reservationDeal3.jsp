<%@ page language="java" import="java.util.*,com.neusoft.vo.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>预约处理页</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/BackEnd_final/layui/css/layui.css">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/BackEnd_final/css/page_diverge.css">
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
			.layui-icon {font-size: 21px;}
			.thead {font-weight: 600; font-size: 18px;}
  			.layui-card-body {margin-top: 2%; padding: 0px 40px 10px 40px;}
		    #a_reservationAdd {text-decoration: none;font-size: 17px; color: #808080;}
		    #selectStyle {display: inline-block; margin-left: 20px; font-size: 16px; font-weight: 500;}
		    td {text-align: center;}
			img {width: 80px; height: 80px;}
			button {border: none; background-color: transparent;}
			body {font-family: "宋体"; background-color: #F8F8FF;}
			.layui-card-body form input{display: inline;width: 10%;margin-right: 2%;}
			.laytable-cell-1-number{ width: 113px; text-align: center;}
			.laytable-cell-1-title{ width: 150px; text-align: center;}
			.laytable-cell-1-username{ width: 90px; text-align: center;}
			.laytable-cell-1-tel{ width: 130px; text-align: center;}
			.laytable-cell-1-status{ width: 100px; text-align: center;}
			.laytable-cell-1-date{ width: 170px; text-align: center;}
			.laytable-cell-1-note{ width: 170px; text-align: center;}
			.laytable-cell-1-deal{ width: 105px; text-align: center;}
  		</style>
  		<script type="text/javascript" src="<%=request.getContextPath() %>/BackEnd_final/layui/layui.js"></script>
		<script>
			//JavaScript代码区域
			layui.use('element', function(){
			  var element = layui.element;
			  
			});
			layui.use('layer ', function(){
				var layer = layui.layer ;
			});
			layui.use('element', function(){
			  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
			});
		</script>
		<script>
		//一般直接写在一个js文件中
		layui.use(['layer', 'form'], function(){
		  var layer = layui.layer
		  ,form = layui.form;
		
		});
		</script> 
  		<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.0.js"></script>
  		<script>
		$(function(){
			$("#btnSelect").click(function(){
				select();
			});
		})
		function select(){
			layui.use('table', function(){
				var table = layui.table;
				var fid = $("#conditionSelect input[name='fid']").val();
				var	nickName = $("#conditionSelect input[name='nickName']").val();
				var status = $("#conditionSelect select[name='status']").val();
				var startDate = $("#conditionSelect input[name='startDate']").val();
				var endDate = $("#conditionSelect input[name='endDate']").val();
				var url = '<%=request.getContextPath() %>/BackEnd/reserve/findPageByCondition';
				//第一个实例
				table.render({
					elem : '#reserv_table',
					height : 415,
					url : url, //数据接口
					where :{fid:fid,nickName:nickName,status:status,startDate:startDate,endDate:endDate},
					page : true,
					method: "post",
					limits:[10,15,20,25,30],
					cols : [ [ //表头
						{field : 'id', title : '预约编号', width : 100, sort : true,  align : 'center'}, 
	   					{field : 'fid', title : '课程编号', width : 100, sort : true, align : 'center' }, 
	   					{field : 'title', title : '课程标题', width : 300, sort : true, align : 'center',templet: '<div>{{d.freelisten.title}}</div>' }, 
	   					{field : 'userName', title : '用户昵称', width : 100, align : 'center'}, 
	   					{field : 'tel', title : '用户电话', width : 110, align : 'center' }, 
	   					{field : 'status', title : '预约状态', width : 100, sort : true, align : 'center'}, 
	   					{field : 'bookTime', title : '预定时间', width : 300, align : 'center'}, 
	   					{field : 'comment', title : '留言', width : 110, align : 'center' }, 
	   					{field : 'check', title: '操作', width:100,toolbar:"#barDemo", align: 'center'}
					] ],
					done: function(res, curr, count){
					    //如果是异步请求数据方式，res即为你接口返回的信息。
					    //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
					    console.log(res);
					    
					    //得到当前页码
					    console.log(curr); 
					    
					    //得到数据总量
					    console.log(count);
					  }
				});
				table.on('tool(check_filter)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
				        	var data = obj.data; //获得当前行数据
				        	var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
	
				        	if(layEvent === 'edit'){ //查看
				        		$.ajax({
				        		url: '<%=request.getContextPath() %>/BackEnd/reserve/dealReservation',
				        			type: 'post',
				        			data: {id: data.id},
				        			dataType: 'json',
				        			success: function(data){
				        				if(data.state == 1){
				        					obj.update({
				        						status : "已处理"
				        					})
				        					layer.msg('处理成功');
				        				}
				        			 	else{
				        					layer.msg('处理失败');
				        				}
				        			}
				        	   });
				           } 
				       });
				})	
			}
			window.onload  = select();
	</script>
	</head>

	<body class="layui-layout-body" onload="IFrameResize();">
		<div class="layui-layout layui-layout-admin" style="margin: 0px 50px 0px 0px;">
			<!-- 内容主体区域 -->
			<div class="layui-card">
				<div class="layui-card-header">
					<span>预约处理</span>
				</div>
				<div class="layui-card-body">
					<form class="scree" id="conditionSelect">
							关键字:<input type="text" name="fid"  lay-verify="required" placeholder="请输入课程编号" 
								autocomplete="off" class="layui-input" style="width: 11%;" > 
							用户昵称:<input type="text" name="nickName"  lay-verify="required" placeholder="请输入用户昵称" 
								autocomplete="off" class="layui-input" style="width: 11.5%;"> 
							预约状态:<select name="status" lay-verify="" style="margin-right: 2%;">
									  <option value="">任意状态</option>
									  <option value="待处理">待处理</option>
									  <option value="已处理">已处理</option>
								</select>
							预约时间:自<input type="date" name="startDate" style="width: 120px;"/>
							-至<input type="date" name="endDate" style="width: 120px"/>
									<button type="button" id="btnSelect" class="layui-btn  layui-btn-sm ">查询</button>
						</form>
					<!--示例表格-->
						<div class="layui-form layui-border-box layui-table-view" lay-filter="LAY-table-1" style="height: auto;">
							<table id="reserv_table" lay-filter="check_filter"></table>
							<script type="text/html" id="barDemo">
								<button id="btn_confirm" type="button" class="layui-btn  layui-btn-sm " lay-event="edit">处理</button>
							</script>
						</div>
				</div>
			</div>
		  </div>
	</body>
	
</html>
