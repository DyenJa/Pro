<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>分部信息页</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/BackEnd_final/layui/css/layui.css">
		<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=7G4mrGoAKdfGRAGUNx8Wb1WhoVr0XkiV"></script>
		<style>
			.layui-card {margin: 35px 45px 45px 0; text-align: center; border-radius: 10px;}
			.layui-card-header {
				font-size: large; 
				background-color: antiquewhite; 
				border-top-left-radius: 10px;
				border-top-right-radius: 10px;
			}
			#allmap {width: 100%;height: 400px;margin:0;font-family:"微软雅黑"}
			
		</style>
		<script type="text/javascript">
            function IFrameResize()
            {
                    //得到父页面的iframe框架的对象
                var obj = parent.document.getElementById("myFrame");
                    //把当前页面内容的高度动态赋给iframe框架的高
                    //obj.height='auto';
                  
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
			  	<div class="layui-col-md6">
			  	  <div class="layui-row">
			  	  	<div class="layui-collapse">
						<div class="layui-col-md12 layui-colla-item">
							<div class="layui-card">
								<div class="layui-card-header layui-colla-title">分部名称</div>
								<div class="layui-card-body layui-colla-content layui-show" 
									style="height: 50px; line-height: 50px;">
									${address.branch }
								</div>
							</div>
						</div>
						<div class="layui-col-md12 layui-colla-item">
							<div class="layui-card">
								<div class="layui-card-header layui-colla-title">分部电话</div>
								<div class="layui-card-body layui-colla-content layui-show" 
									style="height: 50px; line-height: 50px;">
									${address.tel }
								</div>
							</div>
						</div>
				  	</div>
				  	<div class="layui-form-item">
						<button class="layui-btn" style="margin: 25% 0 0 36%;">
							<a href="<%=request.getContextPath()%>/BackEnd/Handler_viewSingleAddressByQidId?aid=<%= request.getAttribute("id") %>&method=branchModify" style="color: white;">修改分部信息</a>
						</button>
					</div>	
				  </div>
				</div>
				<div class="layui-col-md6">
			      <div class="layui-row">
			      	<div class="layui-collapse">
				      	<div class="layui-col-md12 layui-colla-item">
				        	<div class="layui-card">
								<div class="layui-card-header layui-colla-title">分部地址</div>
								<div class="layui-card-body layui-colla-content layui-show" 
									style="padding-left: 3%;">
									<div class="layui-input-inline" style="padding-bottom: 10px;">
									  ${address.address }
									</div><br />
						         	<!-- 地图-->
						         	<div id="allmap";></div>
								</div>
							</div>
				      	</div>
			      	</div>
				  </div>
				</div>		
			  </div>

		</div>
		 
		<script type="text/javascript" src="<%=request.getContextPath() %>/BackEnd_final/layui/layui.js"></script>
		<script>
		//JavaScript代码区域
		layui.use('layer ', function(){
			var layer = layui.layer ;
		});
		layui.use('element', function(){
		  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
		});
		</script>
	</body>
</html>
<script type="text/javascript">
			// 百度地图API功能
			var map = new BMap.Map("allmap");    // 创建Map实例
			var new_point = new BMap.Point(<%= request.getAttribute("longitude")%>,<%= request.getAttribute("latitude")%>);
			map.centerAndZoom(new_point, 18);  // 初始化地图,设置中心点坐标和地图级别
			//添加地图类型控件
			map.addControl(new BMap.MapTypeControl({
				mapTypes:[
		            BMAP_NORMAL_MAP,
		            BMAP_HYBRID_MAP
		        ]}));	  
			map.setCurrentCity("沈阳");          // 设置地图显示的城市 此项是必须设置的
			map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
			var marker = new BMap.Marker(new_point);  // 创建标注
			map.addOverlay(marker);              // 将标注添加到地图中
			map.panTo(new_point); 
		</script>